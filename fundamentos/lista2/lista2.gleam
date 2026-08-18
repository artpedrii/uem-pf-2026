import gleam/string

//11
pub fn area_retangulo(largura: Float, altura: Float) -> Float {
  largura *. altura
}

//12
pub fn produto_anterior_posterior(n: Int) -> Int {
  { n - 1 } * n * { n + 1 }
}

//13
pub fn eh_par(n: Int) -> Bool {
  { n % 2 } == 0
}

//14
pub fn tem_tres_digitos(n: Int) -> Bool {
  { n >= 100 } && { n <= 999 }
}

//15
pub fn maximo(n1: Int, n2: Int) -> Int {
  case n1 >= n2 {
    True -> n1
    False -> n2
  }
}

//16
pub fn ordem(a: Int, b: Int, c: Int) -> String {
  case { a > b } && { b > c } {
    True -> "decrescente"
    False ->
      case { a < b } && { b < c } {
        True -> "crescente"
        False -> "sem ordem"
      }
  }
}

//17 
pub fn so_primeira_maiuscula(texto: String) -> String {
  string.uppercase(string.slice(texto, 0, 1))
  <> string.lowercase(string.slice(texto, 1, string.length(texto)))
}