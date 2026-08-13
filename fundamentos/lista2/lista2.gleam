//11
pub fn area_retangulo (largura: Float, altura: Float) -> Float {
  largura *. largura
}

//12
pub fn produto_anterior_posterior(n: Int) -> Int {
  {n - 1} * n * {n + 1}
}

//13
pub fn eh_par (n: Int) -> Bool {
  {n % 2} == 0
}

//14
pub fn tem_tres_digitos(n: Int) -> Bool {
  {n > 100} && {n < 999}
}