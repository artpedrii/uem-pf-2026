import sgleam/check
import gleam/list
import gleam/int
import gleam/bool

// 9) Analise os exemplos e exercícios de listas e redefina as funções (que forem possíveis) utilizando as
// funções list.map, list.filter e list.fold_right (diretamente ou com uma combinação dessas
// funções). As novas funções ficaram mais simples?

pub fn lista_nega(lst: List(Int)) -> List(Int) { 
    list.map(lst, int.negate) 
}

pub fn lista_nega_examples(){
    check.eq(lista_nega([4, 3]), [-4, -3])
}

pub fn lista_pares(lst: List(Int)) -> List(Int) {
    list.filter(lst, int.is_even)
}

pub fn lista_pares_examples() {
    check.eq(lista_pares([3, 2, 7]), [2])
}

pub fn soma(lst: List(Int)) -> Int {
    list.fold_right(lst, 0, int.add)
}

pub fn soma_examples() {
    check.eq(soma([4, 1, 2]), 7)
}


// 10) Defina uma função que receba como parâmetro um predicado (função de um argumento que retorna
// um valor booleano) e uma lista, e conte quantos elementos da lista satisfazem o predicado. Exemplo
// > conta([3, 1, 2, 4, 7], int.is_odd)
// 3

pub fn conta(lst: List(a), pred: fn(a) -> Bool) -> Int {
  list.fold(lst, 0, fn(acc, x) {
    case pred(x) {
      True -> acc + 1
      False -> acc
    }
  })
}

pub fn conta_examples() {
  check.eq(conta([3, 1, 2, 4, 7], int.is_odd), 3)
  check.eq(conta([], int.is_odd), 0)
  check.eq(conta([2, 4, 6], int.is_odd), 0)
  check.eq(conta([1, 3, 5, 7], int.is_odd), 4)
  check.eq(conta([3, 1, 2, 4, 7], int.is_even), 2)
  check.eq(conta([5, 12, 8, 20, 3], fn(x) { x > 10 }), 2)
  check.eq(conta(["a", "", "bc", ""], fn(s) { s == "" }), 2)
  check.eq(conta([2, 2, 2, 3], fn(x) { x == 2 }), 3)
}

// 11) Projete a função duas_vezes que receba como parâmetro uma função de um parâmetro e retorne uma
// função que aplique a função original duas vezes. Exemplo
// > duas_vezes(fn(x) { x + 1 })(3)
// 5

pub fn duas_vezes(f: fn(a) -> a) -> fn(a) -> a {
    fn(x) {f(f(x))}
}

pub fn duas_vezes_examples() {
  check.eq(duas_vezes(fn(x) { x + 1 })(3), 5)
  check.eq(duas_vezes(fn(x) { x * 2 })(5), 20)
  check.eq(duas_vezes(fn(s) { s <> "!" })("oi"), "oi!!")
}

// 12) Veja a documentação das funções list.map2, list.filter_map e list.fold_until e faça uma im-
// plementação dessas funções.

// map2: combina duas listas elemento a elemento.
// Se uma for maior que a outra, os elementos extras são descartados.
pub fn map2(l1: List(a), l2: List(b), f: fn(a, b) -> c) -> List(c) {
  case l1, l2 {
    [x, ..resto1], [y, ..resto2] -> [f(x, y), ..map2(resto1, resto2, f)]
    _, _ -> []
  }
}

// filter_map: aplica f a cada elemento e guarda só os resultados Ok.
pub fn filter_map(lst: List(a), f: fn(a) -> Result(b, e)) -> List(b) {
  case lst {
    [] -> []
    [x, ..resto] ->
      case f(x) {
        Ok(y) -> [y, ..filter_map(resto, f)]
        Error(_) -> filter_map(resto, f)
      }
  }
}

// fold_until: como fold, mas pode parar antes do fim da lista.
pub type ContinueOrStop(a) {
  Continue(a)
  Stop(a)
}

pub fn fold_until(lst: List(a), inicial: acc, f: fn(acc, a) -> ContinueOrStop(acc)) -> acc {
  case lst {
    [] -> inicial
    [x, ..resto] ->
      case f(inicial, x) {
        Continue(novo) -> fold_until(resto, novo, f)
        Stop(novo) -> novo
      }
  }
}

pub fn map2_examples() {
  check.eq(map2([1, 2, 3], [4, 5, 6], int.add), [5, 7, 9])
  check.eq(map2([1, 2, 3], [10, 20], int.add), [11, 22])
  check.eq(map2([], [1, 2], int.add), [])
}

pub fn filter_map_examples() {
  check.eq(filter_map(["1", "a", "3"], int.parse), [1, 3])
  check.eq(filter_map([], int.parse), [])
  check.eq(filter_map(["x", "y"], int.parse), [])
}

pub fn fold_until_examples() {
  // soma até passar de 10
  let soma_ate_10 = fn(acc, x) {
    case acc + x > 10 {
      True -> Stop(acc)
      False -> Continue(acc + x)
    }
  }
  check.eq(fold_until([1, 2, 3, 4, 5, 6], 0, soma_ate_10), 10)
  check.eq(fold_until([1, 2], 0, soma_ate_10), 3)
  check.eq(fold_until([], 0, soma_ate_10), 0)
}

// 13) Analise os exemplos e exercícios de números naturais e defina uma função num_reduz (semelhante
// a função reduz feita em sala) que abstraia o comportamento do modelo para funções com números
// naturais. Redefina as funções da lista de exercícios de números naturais (que for possível) em termos
// de num_reduz. As novas funções ficaram mais simples?

pub fn num_reduz(n: Int, init: a, f: fn(a, Int) -> a) -> a {
  case n {
    0 -> init
    _ -> f(num_reduz(n - 1, init, f), n)
  }
}

fn num_reduz_nat(n: Int, init: a, f: fn(a, Int) -> a) -> Result(a, String) {
  case n < 0 {
    True -> Error("numero nao natural")
    False -> Ok(num_reduz(n, init, f))
  }
}

fn repete_n(lst: List(Int), n: Int, v: Int) -> Result(List(Int), String) {
  num_reduz_nat(n, lst, fn(acc, _) { [v, ..acc] })
}

fn calcula_expoente(final: Int, a: Int, n: Int) -> Result(Int, String) {
  num_reduz_nat(n, final, fn(acc, _) { acc * a })
}

fn calcula_produto(resultado: Int, n: Int) -> Result(Int, String) {
  num_reduz_nat(n, resultado, fn(acc, k) { acc * k })
}

fn par(n: Int) -> Result(Bool, String) {
  num_reduz_nat(n, True, fn(acc, _) { bool.negate(acc) })
}

fn impar(n: Int) -> Result(Bool, String) {
  num_reduz_nat(n, False, fn(acc, _) { bool.negate(acc) })
}

pub fn naturais_examples() {
  check.eq(repete_n([1], 3, 9), Ok([9, 9, 9, 1]))
  check.eq(repete_n([], -1, 9), Error("numero nao natural"))
  check.eq(calcula_expoente(1, 2, 10), Ok(1024))
  check.eq(calcula_expoente(3, 2, 2), Ok(12))
  check.eq(calcula_produto(1, 5), Ok(120))
  check.eq(calcula_produto(2, 3), Ok(12))
  check.eq(par(4), Ok(True))
  check.eq(par(-1), Error("numero nao natural"))
  check.eq(impar(3), Ok(True))
  check.eq(impar(4), Ok(False))
}