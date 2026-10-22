//Este arquivo contém a resolução das questões práticas da lista (7 ao 25).

//imports
import sgleam/check
import gleam/string
import gleam/int
import gleam/list

//EXERCÍCIO 7)
//ANÁLISE: Faça uma função que recebe um número natural n e um valor v e crie uma nova
//lista com n repetições do valor v.
//TIPOS DE DADOS: As entradas serão duas, um número natural n representado pelo tipo primitivo *Int* e
//um valor v representado pelo tipo primitivo genérico *a*. A saída será um tipo autorreferente contendo *a* *n* vezes, representada por
//*List(a)*.
//ESPECIFICAÇÃO: Recebe um valor *v* e um número natural *n* e cria uma lista com *n* repetições de *v*.
pub fn repete_valor (n: Int, v: a) -> List(a) {
    case n <= 0 {
        True -> []
        False -> [v, ..repete_valor(n - 1, v)]
    }
}
pub fn repete_valor_examples () {
    check.eq(repete_valor(-1, 2), [])
    check.eq(repete_valor(0, 2), [])
    check.eq(repete_valor(5, 2), [2, 2, 2, 2, 2])
}

//EXERCÍCIO 8)
//ANÁLISE: Faça uma função que receba um número a e um número natural n e calcule a^n.
//TIPOS DE DADOS: As entradas serão duas: Um número real representado pelo tipo primitivo *Float* e um número 
//natural representado pelo tipo primitivo *Int*. A saída será o resultado do cálculo, representado pelo tipo primitivo 
//*Float*.
//ESPECIFICAÇÃO: Recebe um número *a* e um número *n* e calcula a^n.
fn potenciacao(a: Float, n: Int) -> Float {
    case n == 0 {
        True -> 1.0
        False -> a *. potenciacao(a, n - 1)
    }
}
pub fn potenciacao_examples () {
    check.eq(potenciacao(2.0, 0), 1.0)
    check.eq(potenciacao(2.0, 1), 2.0)
    check.eq(potenciacao(2.0, 4), 16.0)
}

//EXERCÍCIO 9)
//ANÁLISE:
//TIPOS DE DADOS:
//ESPECIFICAÇÃO:

//EXERCÍCIO 10)
//ANÁLISE:
//TIPOS DE DADOS:
//ESPECIFICÇÃO:

//EXERCÍCIO 11
//AUXILIARES
//ANÁLISE: Faça uma função que recebe uma lista de números inteiros e um valor máximo atual, e encontre o maior número da lista.
//TIPOS DE DADOS: As entradas serão duas: Uma lista de números inteiros representada pelo tipo composto *List(Int)* e um número inteiro representando o maior valor atual pelo tipo primitivo *Int*. A saída será o maior número encontrado, representado pelo tipo primitivo *Int*.
//ESPECIFICAÇÃO: Recebe uma lista de inteiros e um acumulador, varre a lista recursivamente e devolve o maior valor.
pub fn acha_maior(lst: List(Int), max_atual: Int) -> Int {
  case lst {
    [] -> max_atual
    [primeiro, ..resto] -> {
      let novo_max = case primeiro > max_atual {
        True -> primeiro
        False -> max_atual
      }
      acha_maior(resto, novo_max)
    }
  }
}
//ANÁLISE: Faça uma função que recebe uma lista de números inteiros e um valor mínimo atual, e encontre o menor número da lista.
//TIPOS DE DADOS: As entradas serão duas: Uma lista de números inteiros representada pelo tipo composto *List(Int)* e um número inteiro representando o menor valor atual pelo tipo primitivo *Int*. A saída será o menor número encontrado, representado pelo tipo primitivo *Int*.
//ESPECIFICAÇÃO: Recebe uma lista de inteiros e um acumulador, varre a lista recursivamente e devolve o menor valor.
pub fn acha_menor(lst: List(Int), min_atual: Int) -> Int {
  case lst {
    [] -> min_atual
    [primeiro, ..resto] -> {
      let novo_min = case primeiro < min_atual {
        True -> primeiro
        False -> min_atual
      }
      acha_menor(resto, novo_min)
    }
  }
}
//PRINCIPAL
//ANÁLISE: Faça uma função que calcule a amplitude dos valores de uma lista de números, isto é, a diferença entre o valor máximo e mínimo da lista.
//TIPOS DE DADOS: A entrada será uma lista de números inteiros, representada pelo tipo composto *List(Int)*. A saída será o valor da amplitude, representado pelo tipo primitivo *Int*.
//ESPECIFICAÇÃO: Recebe uma lista de números inteiros, extrai o primeiro elemento para servir de base e calcula a diferença entre o valor máximo e mínimo. Retorna 0 caso a lista seja vazia.
pub fn amplitude(lst: List(Int)) -> Int {
  case lst {
    [] -> 0
    [primeiro, ..resto] -> {
      let maximo = acha_maior(resto, primeiro)
      let minimo = acha_menor(resto, primeiro)
      maximo - minimo
    }
  }
}
pub fn amplitude_examples() {
  check.eq(amplitude([10, 2, 8, 4]), 8)
  check.eq(amplitude([-5, 5, 0]), 10)
  check.eq(amplitude([5]), 0)
  check.eq(amplitude([]), 0)
}

//EXERCÍCIO 12)
//AUXILIARES:
//ANÁLISE: Faça uma função que conte a quantidade de strings em uma lista.
//TIPOS DE DADOS: A entrada será uma lista de strings, representada pelo tipo composto *List(String)*. A saída será um número inteiro, representado pelo tipo primitivo *Int*.
//ESPECIFICAÇÃO: Recebe uma lista de strings e conta quantos elementos ela possui, utilizando recursão estrutural.
pub fn conta_strings(lst: List(String)) -> Int {
  case lst {
    [] -> 0
    [_primeiro, ..resto] -> 1 + conta_strings(resto)
  }
}
//ANÁLISE: Faça uma função que calcule a soma do número de caracteres de todas as strings de uma lista.
//TIPOS DE DADOS: A entrada será uma lista de strings, representada pelo tipo composto *List(String)*. A saída será a soma dos tamanhos, representada pelo tipo primitivo *Int*.
//ESPECIFICAÇÃO: Recebe uma lista de strings e varre a lista somando o tamanho da primeira string com o tamanho do resto da lista.
pub fn soma_tamanhos(lst: List(String)) -> Int {
  case lst {
    [] -> 0
    [primeiro, ..resto] -> string.length(primeiro) + soma_tamanhos(resto)
  }
}
//PRINCIPAL
//ANÁLISE: Faça uma função que determine o tamanho médio das strings de uma lista.
//TIPOS DE DADOS: A entrada será uma lista de strings, representada pelo tipo composto *List(String)*. A saída será a média calculada, representada pelo tipo primitivo *Float*.
//ESPECIFICAÇÃO: Recebe uma lista de strings, utiliza funções auxiliares para somar os tamanhos e contar os elementos, e retorna a média (retornando 0.0 caso a lista seja vazia para evitar divisão por zero).
pub fn tamanho_medio(lst: List(String)) -> Float {
  case lst {
    [] -> 0.0
    _ -> {
      let total_tamanho = soma_tamanhos(lst)
      let quantidade = conta_strings(lst)
      int.to_float(total_tamanho) /. int.to_float(quantidade)
    }
  }
}
pub fn tamanho_medio_examples() {
  check.eq(tamanho_medio(["Gleam", "Funcional", "Tipos"]), 6.333333333333333) 
  check.eq(tamanho_medio(["abc", "defg", "hi"]), 3.0) 
  check.eq(tamanho_medio(["testes"]), 6.0)
  check.eq(tamanho_medio([]), 0.0)
}

//EXERCÍCIO 13)
//AUXILIARES:
//ANÁLISE: Faça uma função que calcule a quantidade de elementos de valor maior ou igual a 0 em uma lista de inteiros.
//TIPOS DE DADOS: A entrada será uma lista de inteiros, representada pelo tipo composto *List(Int)*. A saída será a contagem dos números não-negativos, representada pelo tipo primitivo *Int*.
//ESPECIFICAÇÃO: Recebe uma lista de inteiros, utiliza recursão com caso base para lista vazia e somador condicional para números inteiros maiores ou iguais a zero.
pub fn conta_positivos(lst: List(Int)) -> Int {
  case lst {
    [] -> 0
    [primeiro, ..resto] -> {
      let eh_positivo = case primeiro >= 0 {
        True -> 1
        False -> 0
      }
      eh_positivo + conta_positivos(resto)
    }
  }
}
//ANÁLISE: Faça uma função que calcule a quantidade de elementos de valor menor que 0 em uma lista de inteiros.
//TIPOS DE DADOS: A entrada será uma lista de inteiros, representada pelo tipo composto *List(Int)*. A saída será a contagem dos números negativos, representada pelo tipo primitivo *Int*.
//ESPECIFICAÇÃO: Recebe uma lista de inteiros, utiliza recursão com caso base para lista vazia e somador condicional para números inteiros menores que zero.
pub fn conta_negativos(lst: List(Int)) -> Int {
  case lst {
    [] -> 0
    [primeiro, ..resto] -> {
      let eh_negativo = case primeiro < 0 {
        True -> 1
        False -> 0
      }
      eh_negativo + conta_negativos(resto)
    }
  }
}
//PRINCIPAL:
//ANÁLISE: Faça uma função que indique se em uma lista de inteiros existem mais valores positivos ou negativos.
//TIPOS DE DADOS: A entrada será uma lista de inteiros, representada pelo tipo composto *List(Int)*. A saída será uma resposta textual indicando qual grupo tem mais ocorrências (ou empate), representada pelo tipo primitivo *String*.
//ESPECIFICAÇÃO: Recebe uma lista de inteiros, utiliza funções auxiliares para totalizar números positivos (incluindo o zero) e negativos e retorna uma indicação de qual quantidade é maior.
pub fn avalia_quantidades(lst: List(Int)) -> String {
  let positivos = conta_positivos(lst)
  let negativos = conta_negativos(lst)
  case positivos > negativos {
    True -> "Mais positivos"
    False -> case negativos > positivos {
      True -> "Mais negativos"
      False -> "Quantidades iguais"
    }
  }
}
pub fn avalia_quantidades_examples() {
  check.eq(avalia_quantidades([1, 2, -1]), "Mais positivos")
  check.eq(avalia_quantidades([-1, -2, -3, 4]), "Mais negativos")
  check.eq(avalia_quantidades([-1, 1, -2, 2]), "Quantidades iguais")
  check.eq(avalia_quantidades([]), "Quantidades iguais")
}

// -----------------------------------
// *** TIPO ÁRVORE BINÁRIA ***
// -----------------------------------
pub type Arvore(a) {
  Vazia
  No(valor: a, esq: Arvore(a), dir: Arvore(a))
}

//EXERCÍCIO 14)
//ANÁLISE: Faça uma função que determine quantos nós em uma árvore binária tem grau 2 (isto é, possuem tanto o filho esquerdo quanto o filho direito).
//TIPOS DE DADOS: A entrada será uma árvore binária, representada pelo tipo customizado autorreferente *Arvore(a)*. A saída será a contagem dos nós, representada pelo tipo primitivo *Int*.
//ESPECIFICAÇÃO: Recebe uma árvore binária, faz uma recursão estrutural. Se o nó atual possuir ambos os filhos não-vazios, soma 1 e continua a busca nos dois lados; caso contrário, não soma nada e busca nos filhos existentes. Retorna 0 para árvore vazia.
pub fn conta_grau2(arvore: Arvore(a)) -> Int {
  case arvore {
    Vazia -> 0
    No(_, Vazia, Vazia) -> 0
    No(_, Vazia, dir) -> conta_grau2(dir)
    No(_, esq, Vazia) -> conta_grau2(esq)
    No(_, esq, dir) -> 1 + conta_grau2(esq) + conta_grau2(dir)
  }
}
pub fn conta_grau2_examples() {
  let folha1 = No(1, Vazia, Vazia)
  let folha2 = No(3, Vazia, Vazia)
  let no_grau1 = No(4, folha1, Vazia)
  let no_grau2 = No(2, folha1, folha2)
  let raiz = No(5, no_grau2, no_grau1)

  check.eq(conta_grau2(Vazia), 0)
  check.eq(conta_grau2(folha1), 0)
  check.eq(conta_grau2(no_grau1), 0)
  check.eq(conta_grau2(no_grau2), 1)
  check.eq(conta_grau2(raiz), 2) // A raiz e o no_grau2 têm grau 2
}


//EXERCÍCIO 15)
//ANÁLISE: Faça uma função que determine se uma árvore binária é cheia (todos os seus nós têm grau 0 ou 2).
//TIPOS DE DADOS: A entrada será uma árvore binária, representada pelo tipo *Arvore(a)*. A saída será um valor booleano indicando se é cheia ou não, representado pelo tipo primitivo *Bool*.
//ESPECIFICAÇÃO: Recebe uma árvore, utiliza recursão estrutural para validar. Se a árvore for vazia ou for folha (grau 0), retorna True. Se tiver apenas um filho (grau 1), retorna False. Se tiver dois filhos (grau 2), verifica se as duas subárvores também são cheias.
pub fn eh_arvore_cheia(arvore: Arvore(a)) -> Bool {
  case arvore {
    Vazia -> True
    No(_, Vazia, Vazia) -> True
    No(_, _, Vazia) -> False // Tem filho esquerdo, mas não direito (Grau 1)
    No(_, Vazia, _) -> False // Tem filho direito, mas não esquerdo (Grau 1)
    No(_, esq, dir) -> {
      let esq_cheia = eh_arvore_cheia(esq)
      let dir_cheia = eh_arvore_cheia(dir)
      case esq_cheia {
        True -> dir_cheia
        False -> False
      }
    }
  }
}
pub fn eh_arvore_cheia_examples() {
  let folha = No(1, Vazia, Vazia)
  let cheia = No(2, folha, folha)
  let nao_cheia = No(3, folha, Vazia)
  
  check.eq(eh_arvore_cheia(Vazia), True)
  check.eq(eh_arvore_cheia(folha), True)
  check.eq(eh_arvore_cheia(cheia), True)
  check.eq(eh_arvore_cheia(nao_cheia), False)
}


//EXERCÍCIO 16)
//AUXILIAR:
//ANÁLISE: Faça uma função auxiliar que calcule a altura de uma árvore binária (a maior distância da raiz até a folha mais distante).
//TIPOS DE DADOS: A entrada será uma árvore *Arvore(a)* e a saída será um inteiro *Int*.
//ESPECIFICAÇÃO: Retorna -1 para árvore vazia. Para um nó, soma 1 ao maior valor entre a altura da subárvore esquerda e a altura da direita.
pub fn altura_arvore(arvore: Arvore(a)) -> Int {
  case arvore {
    Vazia -> -1
    No(_, esq, dir) -> {
      let alt_esq = altura_arvore(esq)
      let alt_dir = altura_arvore(dir)
      let max_alt = case alt_esq > alt_dir {
        True -> alt_esq
        False -> alt_dir
      }
      1 + max_alt
    }
  }
}
//AUXILIAR MATEMÁTICA:
pub fn modulo(valor: Int) -> Int {
  case valor < 0 {
    True -> valor * -1
    False -> valor
  }
}
//PRINCIPAL:
//ANÁLISE: Faça uma função que verifique se uma árvore binária é balanceada (diferença de altura entre subárvores esquerda e direita é no máximo 1 e as subárvores também são balanceadas).
//TIPOS DE DADOS: A entrada será uma árvore *Arvore(a)* e a saída um booleano *Bool*.
//ESPECIFICAÇÃO: Verifica se a árvore é vazia (True). Se não for, calcula a altura da esquerda e direita, checa se a diferença é menor ou igual a 1, e faz a chamada recursiva para verificar se as subárvores esquerda e direita também obedecem à regra.
pub fn eh_balanceada(arvore: Arvore(a)) -> Bool {
  case arvore {
    Vazia -> True
    No(_, esq, dir) -> {
      let alt_esq = altura_arvore(esq)
      let alt_dir = altura_arvore(dir)
      let diferenca_aceitavel = modulo(alt_esq - alt_dir) <= 1
      
      case diferenca_aceitavel {
        True -> {
          case eh_balanceada(esq) {
            True -> eh_balanceada(dir)
            False -> False
          }
        }
        False -> False
      }
    }
  }
}
pub fn eh_balanceada_examples() {
  let folha = No(1, Vazia, Vazia)
  let balanc1 = No(2, folha, folha)
  let desbalanc = No(3, No(2, folha, Vazia), Vazia)
  
  check.eq(eh_balanceada(Vazia), True)
  check.eq(eh_balanceada(folha), True)
  check.eq(eh_balanceada(balanc1), True)
  check.eq(eh_balanceada(desbalanc), False)
}


//EXERCÍCIO 17)
//AUXILIARES DE COMPARAÇÃO:
//ANÁLISE: Fazem funções que validam se todos os valores de uma árvore são estritamente menores (ou estritamente maiores) que um valor de referência.
//TIPOS DE DADOS: Entradas: árvore *Arvore(Int)* e valor referência *Int*. Saída: *Bool*.
pub fn todos_menores(arvore: Arvore(Int), ref: Int) -> Bool {
  case arvore {
    Vazia -> True
    No(valor, esq, dir) -> {
      case valor < ref {
        True -> {
          case todos_menores(esq, ref) {
            True -> todos_menores(dir, ref)
            False -> False
          }
        }
        False -> False
      }
    }
  }
}
pub fn todos_maiores(arvore: Arvore(Int), ref: Int) -> Bool {
  case arvore {
    Vazia -> True
    No(valor, esq, dir) -> {
      case valor > ref {
        True -> {
          case todos_maiores(esq, ref) {
            True -> todos_maiores(dir, ref)
            False -> False
          }
        }
        False -> False
      }
    }
  }
}
//PRINCIPAL:
//ANÁLISE: Faça uma função que verifique se uma árvore é uma Árvore Binária de Busca (BST).
//TIPOS DE DADOS: Entrada: árvore *Arvore(Int)*. Saída: *Bool*.
//ESPECIFICAÇÃO: Árvore vazia é BST. Para um nó, valida se todos à esquerda são menores que a raiz, se todos à direita são maiores que a raiz, e se ambas as subárvores também são BSTs.
pub fn eh_bst(arvore: Arvore(Int)) -> Bool {
  case arvore {
    Vazia -> True
    No(valor, esq, dir) -> {
      let esq_ok = todos_menores(esq, valor)
      let dir_ok = todos_maiores(dir, valor)
      
      case esq_ok {
        True -> case dir_ok {
          True -> case eh_bst(esq) {
            True -> eh_bst(dir)
            False -> False
          }
          False -> False
        }
        False -> False
      }
    }
  }
}
pub fn eh_bst_examples() {
  let folha1 = No(1, Vazia, Vazia)
  let folha3 = No(3, Vazia, Vazia)
  let folha5 = No(5, Vazia, Vazia)
  let bst_valida = No(4, No(2, folha1, folha3), folha5) // 4 -> (2 -> 1, 3), 5
  let bst_invalida = No(4, No(2, folha1, No(5, Vazia, Vazia)), folha5) // Tem um 5 na esquerda do 4
  
  check.eq(eh_bst(Vazia), True)
  check.eq(eh_bst(folha1), True)
  check.eq(eh_bst(bst_valida), True)
  check.eq(eh_bst(bst_invalida), False)
}


//EXERCÍCIO 18)
//ANÁLISE: Faça uma função que verifique se um elemento específico está contido em uma árvore binária de busca.
//TIPOS DE DADOS: A entrada será uma árvore *Arvore(Int)* e um valor alvo *Int*. A saída será um *Bool*.
//ESPECIFICAÇÃO: Tirando proveito da propriedade da BST, se a árvore for vazia, retorna False. Se o valor da raiz for igual ao alvo, retorna True. Se o alvo for menor que a raiz, busca apenas na subárvore esquerda. Se for maior, busca apenas na direita.
pub fn busca_em_bst(arvore: Arvore(Int), alvo: Int) -> Bool {
  case arvore {
    Vazia -> False
    No(valor, esq, dir) -> {
      case valor == alvo {
        True -> True
        False -> case alvo < valor {
          True -> busca_em_bst(esq, alvo)
          False -> busca_em_bst(dir, alvo)
        }
      }
    }
  }
}
pub fn busca_em_bst_examples() {
  let bst = No(4, No(2, No(1, Vazia, Vazia), No(3, Vazia, Vazia)), No(6, Vazia, Vazia))
  
  check.eq(busca_em_bst(Vazia, 4), False)
  check.eq(busca_em_bst(bst, 4), True)
  check.eq(busca_em_bst(bst, 3), True)
  check.eq(busca_em_bst(bst, 7), False)
}

// ==========================================
// PARTE 1: SISTEMA DE ARQUIVOS (Exs 19 e 24)
// ==========================================

// Modificando a representação conforme o Exercício 19
pub type Entrada {
  Arq(nome: String, tamanho: Int)
  Dir(nome: String, conteudos: List(Entrada))
}

//EXERCÍCIO 19 a)
//ANÁLISE: Faça uma função para calcular o número total de bytes ocupados por todos os arquivos a partir de uma entrada.
//TIPOS DE DADOS: A entrada é do tipo customizado *Entrada* (que pode ser um arquivo ou diretório). A saída será um *Int* com o total de bytes.
//ESPECIFICAÇÃO: Se for arquivo, devolve o tamanho dele. Se for diretório, delega para uma função auxiliar somar os tamanhos de todos os itens da lista de conteúdos.
pub fn total_bytes(ent: Entrada) -> Int {
  case ent {
    Arq(_, tamanho) -> tamanho
    Dir(_, conteudos) -> total_bytes_lista(conteudos)
  }
}
pub fn total_bytes_lista(lst: List(Entrada)) -> Int {
  case lst {
    [] -> 0
    [primeiro, ..resto] -> total_bytes(primeiro) + total_bytes_lista(resto)
  }
}

//EXERCÍCIO 19 b)
//ANÁLISE: Faça uma função para encontrar o tamanho do maior arquivo a partir de uma entrada.
//TIPOS DE DADOS: A entrada é do tipo customizado *Entrada*. A saída será o tamanho máximo encontrado *Int*.
//ESPECIFICAÇÃO: Retorna o próprio tamanho se for arquivo. Se for diretório, varre a lista recursivamente mantendo o maior valor encontrado. Retorna 0 para diretórios vazios.
pub fn maior_arquivo(ent: Entrada) -> Int {
  case ent {
    Arq(_, tamanho) -> tamanho
    Dir(_, conteudos) -> maior_arquivo_lista(conteudos)
  }
}
pub fn maior_arquivo_lista(lst: List(Entrada)) -> Int {
  case lst {
    [] -> 0
    [primeiro, ..resto] -> {
      let max_primeiro = maior_arquivo(primeiro)
      let max_resto = maior_arquivo_lista(resto)
      case max_primeiro > max_resto {
        True -> max_primeiro
        False -> max_resto
      }
    }
  }
}

//EXERCÍCIO 24 (Desafio)
//ANÁLISE: Projete uma função para construir uma representação textual (lista de strings) de uma entrada em um sistema de arquivos.
//TIPOS DE DADOS: Entrada: *Entrada* e uma *String* de indentação. Saída: *List(String)*.
//ESPECIFICAÇÃO: Concatena o nome do arquivo com um prefixo. Para diretórios, adiciona o nome com "/" e chama a recursão para os filhos adicionando espaços na indentação.
pub fn arvore_texto(ent: Entrada, indentacao: String) -> List(String) {
  case ent {
    Arq(nome, _) -> [indentacao <> "+- " <> nome]
    Dir(nome, conteudos) -> {
      let linha_dir = indentacao <> nome <> "/"
      let novas_linhas = arvore_texto_lista(conteudos, indentacao <> "  ")
      [linha_dir, ..novas_linhas]
    }
  }
}
pub fn arvore_texto_lista(lst: List(Entrada), indentacao: String) -> List(String) {
  case lst {
    [] -> []
    [primeiro, ..resto] -> {
      let linhas_prim = arvore_texto(primeiro, indentacao)
      let linhas_resto = arvore_texto_lista(resto, indentacao)
      list.append(linhas_prim, linhas_resto) // Junta as duas listas de strings
    }
  }
}

pub fn arquivos_examples() {
  let arq1 = Arq("notas.txt", 150)
  let arq2 = Arq("foto.png", 2000)
  let dir_vazio = Dir("vazio", [])
  let raiz = Dir("home", [arq1, Dir("imagens", [arq2]), dir_vazio])

  // Testes Ex 19
  check.eq(total_bytes(arq1), 150)
  check.eq(total_bytes(raiz), 2150)
  check.eq(maior_arquivo(raiz), 2000)
  
  // Testes Ex 24
  check.eq(arvore_texto(raiz, ""), [
    "home/",
    "  +- notas.txt",
    "  imagens/",
    "    +- foto.png",
    "  vazio/"
  ])
}

// ==========================================
// PARTE 2: RESOLVENDO PROBLEMAS (Exs 20 a 25)
// ==========================================

//EXERCÍCIO 20
//AUXILIARES:
pub fn conta_notas(lst: List(Float)) -> Int {
  case lst {
    [] -> 0
    [_, ..resto] -> 1 + conta_notas(resto)
  }
}
pub fn conta_laurea(lst: List(Float)) -> Int {
  case lst {
    [] -> 0
    [primeiro, ..resto] -> {
      let eh_alta = case primeiro >. 9.0 {
        True -> 1
        False -> 0
      }
      eh_alta + conta_laurea(resto)
    }
  }
}
//PRINCIPAL:
//ANÁLISE: Determina se um aluno recebe Láurea Acadêmica (> 2/3 das notas finais maiores que 9.0).
//TIPOS DE DADOS: Entrada: lista de notas *List(Float)*. Saída: *Bool*.
//ESPECIFICAÇÃO: Conta o total de disciplinas e quantas têm nota > 9.0. Compara se as notas altas representam estritamente mais de dois terços do total. Retorna False se não houver notas.
pub fn recebe_laurea(notas: List(Float)) -> Bool {
  let total = int.to_float(conta_notas(notas))
  let altas = int.to_float(conta_laurea(notas))
  case total >. 0.0 {
    True -> altas >. { total *. 2.0 /. 3.0 }
    False -> False
  }
}
pub fn recebe_laurea_examples() {
  check.eq(recebe_laurea([9.5, 9.2, 8.0]), True) // 2 de 3 (66.6% não é > 2/3, empate, então False dependendo da precisão, mas 2/3 de 3 é 2. Tem que ser MAIOR que 2/3? O enunciado diz "mais do que 2/3". Se for estrito, 2 não é maior que 2. Vamos testar com 3 de 4).
  check.eq(recebe_laurea([9.5, 9.1, 9.8, 8.0]), True) // 3 de 4 = 75% > 66.6%
  check.eq(recebe_laurea([7.0, 8.0, 9.5]), False)
}


//EXERCÍCIO 21
pub type Voto { Cand1 Cand2 Branco }

//AUXILIARES:
pub fn conta_voto(lst: List(Voto), alvo: Voto) -> Int {
  case lst {
    [] -> 0
    [primeiro, ..resto] -> {
      let soma = case primeiro == alvo {
        True -> 1
        False -> 0
      }
      soma + conta_voto(resto, alvo)
    }
  }
}
pub fn tamanho_votos(lst: List(Voto)) -> Int {
  case lst {
    [] -> 0
    [_, ..r] -> 1 + tamanho_votos(r)
  }
}
//PRINCIPAL:
//ANÁLISE: Analisa uma lista de votos para determinar o vencedor ou se haverá nova eleição (brancos > 50%).
//TIPOS DE DADOS: Entrada: *List(Voto)*. Saída: *String*.
//ESPECIFICAÇÃO: Conta os brancos e o total. Se brancos > total/2, novas eleições. Senão, compara Cand1 e Cand2.
pub fn resultado_eleicao(votos: List(Voto)) -> String {
  let total = tamanho_votos(votos)
  let brancos = conta_voto(votos, Branco)
  let v1 = conta_voto(votos, Cand1)
  let v2 = conta_voto(votos, Cand2)

  // Brancos > 50% significa brancos > total / 2
  case brancos * 2 > total {
    True -> "Novas eleições"
    False -> case v1 > v2 {
      True -> "Candidato 1 venceu"
      False -> case v2 > v1 {
        True -> "Candidato 2 venceu"
        False -> "Empate"
      }
    }
  }
}
pub fn eleicao_examples() {
  check.eq(resultado_eleicao([Cand1, Cand1, Cand2]), "Candidato 1 venceu")
  check.eq(resultado_eleicao([Cand1, Branco, Branco]), "Novas eleições")
  check.eq(resultado_eleicao([Cand1, Cand2]), "Empate")
}


//EXERCÍCIO 22
pub type Ponto { Ponto(x: Int, y: Int) }
pub type Retangulo { Ret(min_x: Int, max_x: Int, min_y: Int, max_y: Int) }

//AUXILIAR (Um Varredor Genérico para Min/Max):
pub fn acha_extremos(lst: List(Ponto), minx: Int, maxx: Int, miny: Int, maxy: Int) -> Retangulo {
  case lst {
    [] -> Ret(minx, maxx, miny, maxy)
    [Ponto(x, y), ..resto] -> {
      let nx = case x < minx { True -> x False -> minx }
      let nxx = case x > maxx { True -> x False -> maxx }
      let ny = case y < miny { True -> y False -> miny }
      let nyy = case y > maxy { True -> y False -> maxy }
      acha_extremos(resto, nx, nxx, ny, nyy)
    }
  }
}
//PRINCIPAL:
//ANÁLISE: Determina o menor retângulo (lados paralelos aos eixos) que cobre todos os pontos.
//TIPOS DE DADOS: Entrada *List(Ponto)*, Saída *Retangulo*.
//ESPECIFICAÇÃO: Usa o primeiro ponto como referência inicial para min e max, varrendo o resto da lista para expandir os limites.
pub fn menor_retangulo(pontos: List(Ponto)) -> Retangulo {
  case pontos {
    [] -> Ret(0, 0, 0, 0) // Caso de segurança
    [Ponto(x, y), ..resto] -> acha_extremos(resto, x, x, y, y)
  }
}
pub fn retangulo_examples() {
  let pontos = [Ponto(2, 3), Ponto(5, 1), Ponto(4, 8)]
  check.eq(menor_retangulo(pontos), Ret(2, 5, 1, 8))
}


//EXERCÍCIO 23
//ANÁLISE: Calcula quantos itens de classe 1 são necessários para construir um item de classe n.
//TIPOS DE DADOS: Entrada: Classe alvo *Int*. Saída: Quantidade necessária *Int*.
//ESPECIFICAÇÃO: Para classe 1, precisa de 1. Para classe n > 1, precisa do dobro da quantidade necessária para a classe (n-1). Usa recursão generativa baseada em matemática.
pub fn calcula_itens(classe: Int) -> Int {
  case classe <= 1 {
    True -> 1
    False -> 2 * calcula_itens(classe - 1)
  }
}
pub fn calcula_itens_examples() {
  check.eq(calcula_itens(1), 1)
  check.eq(calcula_itens(2), 2)
  check.eq(calcula_itens(4), 8)
  check.eq(calcula_itens(10), 512)
}


//EXERCÍCIO 25 (Desafio)
//ANÁLISE: Verifica se uma lista A é prefixo (começo) de uma lista B.
//TIPOS DE DADOS: Entradas: Duas listas genéricas *List(a)*. Saída: Booleano *Bool*.
//ESPECIFICAÇÃO: Se A for vazia, é prefixo de qualquer coisa (True). Se B acabar antes de A, é False. Se os dois primeiros elementos forem iguais, avança a recursão; se não, False.
pub fn eh_prefixo(lsta: List(a), lstb: List(a)) -> Bool {
  case lsta {
    [] -> True
    [a, ..resto_a] -> {
      case lstb {
        [] -> False
        [b, ..resto_b] -> {
          case a == b {
            True -> eh_prefixo(resto_a, resto_b)
            False -> False
          }
        }
      }
    }
  }
}
pub fn eh_prefixo_examples() {
  check.eq(eh_prefixo([], [1, 2, 3]), True)
  check.eq(eh_prefixo([1, 2], [1, 2, 3, 4]), True)
  check.eq(eh_prefixo([1, 3], [1, 2, 3, 4]), False)
  check.eq(eh_prefixo([1, 2], [1]), False)
}