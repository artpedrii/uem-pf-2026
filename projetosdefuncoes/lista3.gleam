///Este arquivo contém a resolução dos exercícios da lista que envolvem código (13 ao 30).
import gleam/string
import sgleam/check

///EXCERCÍCIO 13)
/// Produz True se uma pessoa com *idade* é isento da
/// tarifa de transporte público, isto é, tem menos
/// que 18 anos ou 65 ou mais. Produz False caso contrário.
pub fn isento_tarifa(idade: Int) -> Bool {
  idade < 18 || idade >= 65
}
pub fn isento_tarifa_examples() {
  check.eq(isento_tarifa(17), True)
  check.eq(isento_tarifa(18), False)
  //corrigi aqui, 18 anos não é isento
  check.eq(isento_tarifa(50), False)
  check.eq(isento_tarifa(65), True)
  check.eq(isento_tarifa(70), True)
}

///EXERCÍCIO 14)
/// Conta a quantidade de dígitos de *n*.
/// Se *n* é 0, então devolve um.
/// Se *n* é menor que zero, então devolve a quantidade
/// de dígitos do valor absoluto de *n*.
pub fn quantidade_digitos(n: Int) -> Int {
  case n >= -1 && n <= 1 {
    True -> 1
    False ->
      case n > 0 {
        True -> 1 + quantidade_digitos(n / 10)
        False -> 1 + quantidade_digitos({ n * -1 } / 10)
      }
  }
}
pub fn quantidade_digitos_examples() {
  check.eq(quantidade_digitos(123), 3)
  check.eq(quantidade_digitos(0), 1)
  check.eq(quantidade_digitos(-1519), 4)
}

///EXERCÍCIO 15)
/// Produz True se uma pessoa com *idade* é supercentenária,
/// isto é, tem 110 anos ou mais, False caso contrário.
pub fn supercentenario(idade: Int) -> Bool {
  idade >= 110
}
pub fn supercentenario_examples() {
  check.eq(supercentenario(101), False)
  check.eq(supercentenario(110), True)
  //corrigi aqui
  check.eq(supercentenario(112), True)
}

///EXERCÍCIO 16
/// Transforma a string *data* que está no formato "dia/mes/ano"
/// para o formato "ano/mes/dia".
///
/// Requer que o dia e o mês tenham dois dígitos e que
/// o ano tenha quatro dígitos.
pub fn dma_para_amd(data: String) -> String {
  string.slice(data, 6, 4)
  <> "/"
  <> string.slice(data, 3, 2)
  <> "/"
  <> string.slice(data, 0, 2)
}
pub fn dma_para_amd_examples() {
  check.eq(dma_para_amd("19/07/2023"), "2023/07/19")
  check.eq(dma_para_amd("01/01/1980"), "1980/01/01")
  check.eq(dma_para_amd("02/02/2002"), "2002/02/02")
  //corrigi
}

//EXERCÍIO 17
//ANÁLISE: Faça uma função que recebe um valor e uma porcentagem e aumenta a porcentagem do valor inicial em cima do próprio valor.
//TIPOS DE DADOS: As entradas são duas: Um *valor*e uma *porcentagem*, ambas reprsentadas pelo tipo primitivo *FLoat*. O resultado a função é o cálculo realizado, representado
//também pelo tipo primitivo *Float*
//Especificação: Recebe *valor* e *porcentagem* e faz o seguinte cálculo: tira a *porcentagem* do *valor* e soma em cima dele mesmo, esse é o resultado.
pub fn aumenta(valor: Float, porcentagem: Float) -> Float {
  valor *. { 1.0 +. porcentagem /. 100.0 }
}
pub fn aumenta_examples() {
  check.eq(aumenta(100.0, 5.0), 105.0)
  check.eq(aumenta(150.0, 7.0), 160.5)
}

//EXERCÍCIO 18
//ANÁLISE: Faça uma função que receba um nome e classifique-o ente curto, médio ou longo. Para um nome ser curto ele deve possuir até 4 caracteres, para ser médio deve ter de 5 a 10,
//se tiver mais de 10 ele é longo.
//TIPOS DE DADOS: A entrada é uma: Um nome que é representado pelo tipo primitivo *String*. A saídaé sua classificação, também representada pelo tipo primitivo *String*.
//Especificação: Recebe um *nome* e o classifica entre curto, medio ou longo. Para um nome ser curto ele deve possuir até 4 caracteres, para ser médio deve ter de 5 a 10,
//se tiver mais de 10 ele é longo
pub fn tamanho_nome(nome: String) -> String {
  case string.length(nome) <= 4 {
    True -> "curto"
    False ->
      case string.length(nome) <= 10 {
        True -> "médio"
        False -> "longo"
      }
  }
}
pub fn tamanho_nome_examples() {
  check.eq(tamanho_nome("José"), "curto")
  check.eq(tamanho_nome("Guilherme"), "médio")
  check.eq(tamanho_nome("JOAOCHOMANETO"), "longo")
}

//EXERCÍCIO 19)
//ANÁLISE: Faça uma função que receba uma frase e adicione um ponto final nela se ela não termina com um.
//TIPOS DE DADOS: A entrada será uma: Uma frase que será representada pelo tipo primitivo *String*. A saída será também uma frase com ponto final,
//representada pelo tipo primitivo *String*
//ESPECIFICAÇÃO: Recebe uma *frase* e adicona um ponto final nela se ela já não tiver um.
pub fn adiciona_ponto_final(frase: String) -> String {
  case string.slice(frase, string.length(frase) - 1, 1) == "." {
    True -> frase 
    False -> frase <> "."
  }
}
pub fn adiciona_ponto_final_examples() {
  check.eq(adiciona_ponto_final("Gustavo"), "Gustavo.")
  check.eq(adiciona_ponto_final("Eu te amo Julia."), "Eu te amo Julia.")
}

//EXERCÍCIO 20
//ANÁLISE: Projete uma função que verifique se uma frase tem o caractere "-" bem no meio dela.
//TIPOS DE DADOS: A entrada será uma: Uma frase que será representada pelo tipo primitivo *String*. O resultado será a verificação, representado 
//pelo tipo primitivo *Bool*.
//ESPECIFICAÇÃO: Recebe uma *frase* e verifica se seu caractere central é "-", produz *True* se for e *False* caso contrário.
pub fn verifica_traco_meio(frase: String) -> Bool {
  string.slice(frase, {string.length(frase) / 2}, 1) == "-"
}
pub fn verifica_traco_meio_examples() {
  check.eq(verifica_traco_meio("Tu-Tu"), True)
  check.eq(verifica_traco_meio("Tutu"), False)
}

//EXERCÍCIO 21
//ANÁLISE: Faça uma função que receba três números e devolva o maior número dentre eles.
//TIPOS DE DADOS: As entradas serão três números inteiros, todos representados pelo tipo primitivo *Int*. A saída será o maior número dentro desses três,
//representado também pelo tipo primitivo *Int*.
//ESPECIFICAÇÃO: Recebe três números *num1*, *num2* e *num3* e devolve qual é o maior dentre esses três números.
pub fn maximo_tres_numeros(num1: Int, num2: Int, num3: Int) -> Int {
  case num1 >= num2 && num1 >= num3 {
    True -> num1
    False -> case num2 >= num3 && num2 >= num1 {
      True -> num2
      False -> num3 
    }
  }
}
pub fn maximo_tres_numeros_examples() {
  check.eq(maximo_tres_numeros(1, 2, 3), 3)
  check.eq(maximo_tres_numeros(1, 3, 2), 3)
  check.eq(maximo_tres_numeros(3, 1, 2), 3)
}

//EXERCÍCIO 22)
//ANÁLISE: Faça uma função que receba uma frase e um número natural n e substituia os n primeiros cracteres da frase por "x".
//TIPOS DE DADOS: As entradas serão duas: Uma frase que será representada pelo tipo primitivo *String* e um número natural que será representado
//pelo tipo primitivo *Int*. O resultado será a frase com a substituição, representado pelo tipo primitivo *String*.
//ESPECIFICAÇÃO: Recebe uma *frase* e um número inteiro *n*, após isso, substitui os *n* primeiros caracteres da *frase* por "x".
pub fn substitui_por_x(frase: String, n: Int) -> String {
  string.repeat("x", n) <> string.slice(frase, n, string.length(frase))
}
pub fn substitui_por_x_examples() {
  check.eq(substitui_por_x("Arthur", 3), "xxxhur")
  check.eq(substitui_por_x("Julia", 1), "xulia")
}

//EXERCÍCIO 23
//ANÁLISE: Faça uma função que recebe uma frase e verifica se ela não possui espaços extras. Isto é, não possui espaços no começo e nem no final. 
//TIPOS DE DADOS: A entrada será uma: Uma frase que será representada pelo tipo primitivo *String*. A saída será o resultado da verificação, representado
//pelo tipo primitivo *Bool*.
//ESPECIFICAÇÃO: Recebe uma frase* e verifica se ela NÃO começa ou termina com espaços. Produz *True* se não possuir espaços no começo ou ao final
//e produz *False* caso contrário.
pub fn sem_espacos_extras(frase: String) -> Bool {
  string.slice(frase, 0, 1) != " " && string.slice(frase, {string.length(frase) - 1}, 1) != " "
}
pub fn sem_espacos_extras_examples() {
  check.eq(sem_espacos_extras("Julia"), True)
  check.eq(sem_espacos_extras(" Julia"), False)
  check.eq(sem_espacos_extras("Julia "), False)
  check.eq(sem_espacos_extras(" Julia "), False)
}

//EXERCÍCIO 24
//ANÁLISE: Faça uma função que receba uma renda e calcule o valor do imposto que será pagado sobre essa renda. Os casos são os seguintes:
//Quem recebe até 1000: Paga 5% de imposto. 
//Quem recebe de mais de 1000 até 5000: Paga 5% de imposto sobre 1000 e 10% sobre o que passar de 1000.
//Quem recebe mais de 5000: Paga 5% sobre 1000, 10% sobre 4000 e 20% sobre o que passar de 5000. 
//TIPOS DE DADOS: A entrada será uma: Um valor de salário que será representado pelo tipo primitivo *Float*. O resultado da 
//função será o valor do imposto à ser pago, representado também pelo tipo primitivo *Float*.
//ESPECIFICAÇÃO: Recebe um *salario* e calcula o imposto à ser pago à partir dele seguindo as seguintes regras: 
//Quem recebe até 1000: Paga 5% de imposto. 
//Quem recebe de mais de 1000 até 5000: Paga 5% de imposto sobre 1000 e 10% sobre o que passar de 1000.
//Quem recebe mais de 5000: Paga 5% sobre 1000, 10% sobre 4000 e 20% sobre o que passar de 5000. 
pub fn calcula_imposto(salario: Float) -> Float {
  case salario <=. 1000.0 {
    True -> {5.0 /. 100.0} *. salario 
    False -> case salario >. 1000.0 && salario <=. 5000.0 {
      True -> {{5.0 /. 100.0} *. 1000.0} +. {{10.0 /. 100.0} *. {salario -. 1000.0}}
      False -> {{5.0 /. 100.0} *. 1000.0} +. {{10.0 /. 100.0} *. 4000.0}} +. {{20.0 /. 100.0} *. {salario -. 5000.0}}
  } 
}
pub fn calcula_imposto_examples() {
  check.eq(calcula_imposto(1000.0), 50.0)
  check.eq(calcula_imposto(5000.0), 450.0)
  check.eq(calcula_imposto(6000.0), 650.0)
}

//EXERCÍCIO 25
//ANÁLISE: Faça uma função que verifique se uma palavra é duplicada. 
//TIPOS DE DADOS: A entrada será uma: Uma palavra que será representada pelo tipo primitivo *String*. O resultado 
//será a verificação, representado pelo tipo primitivo *Bool*.
//ESPECIFICAÇÃO:
pub fn eh_duplicada(palavra: String) -> Bool {
  case string.slice(palavra, {string.length(palavra) / 2}, 1) == "-" {
    True -> string.slice(palavra, 0, {string.length(palavra) / 2}) == string.slice(palavra, {string.length(palavra) / 2} + 1, {string.length(palavra) / 2})
    False -> string.slice(palavra, 0, {string.length(palavra) / 2}) == string.slice(palavra, {string.length(palavra) / 2}, {string.length(palavra) - 1})
  }
}
pub fn eh_duplicada_examples() {
  check.eq(eh_duplicada("mi-mi"), True)
  check.eq(eh_duplicada("mi-ma"), False)
  check.eq(eh_duplicada("lerolero"), True)
  check.eq(eh_duplicada("jujulia"), False)
}

//EXERCÍCIO 26
//ANÁLISE:
//TIPOS DE DADOS:
//ESPECIFICAÇÃO:
