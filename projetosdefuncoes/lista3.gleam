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


