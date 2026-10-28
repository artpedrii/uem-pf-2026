//Aqui está a resolução dos exercícios práticos da lista 7 (3 ao 11).

//imports
import sgleam/check

//**EXERCÍCIO 3)**//
//*PRINCIPAL*//
/// ANÁLISE: Faça uma função que recebe duas listas e verifica se todos os elementos da primeiro lista
/// estão dentro da outra lista.
/// TIPOS DE DADOS: As entradas serão duas: Dois tipos autorreferentes contendo algo genérico, representados por *List(a)*.
/// A saída será o resultado da verificação, representada pelo tipo primitivo *Bool*.
/// ESPECIFICAÇÃO: Recebe duas listas *lsta* e *lstb* e verifica se todos os elementos de *lsta* estão contidos em (independente da ordem) *lstb*. Produz *True* se estiverem contidos
/// e *False* caso contrário.
pub fn esta_contido(lsta: List(a), lstb: List(a)) -> Bool {
  case lsta {
    [] -> True 
    [f, ..r] -> esta_na_lista(f, lstb) && esta_contido(r, lstb)
  }
}
pub fn esta_contido_examples() {
  check.eq(esta_contido([1, 2, 3, 4, 5], [1, 7, 2, 4, 3, 5]), True)
  check.eq(esta_contido([1, 2, 3, 4, 5, 6], [1, 7, 2, 4, 3, 5]), False)
  check.eq(esta_contido([], []), True)
  check.eq(esta_contido([1], []), False)
  check.eq(esta_contido([], [1, 2]), True)
}
//*AUXILIAR*//
/// ANÁLISE: Faça uma função que recebe um elemento e uma lista e verifica se o elemento está presente na lista.
/// TIPOS DE DADOS: As entradas serão duas: Um elemento genérico representado pelo tipo *a* e um tipo autorreferente contendo
/// um elemento genérico, representado por *List(a)*. A saída será o resultado dessa verificação representado pelo tipo primitivo *Bool*
/// ESPECIFICAÇÃO: Recebe um elemento *elem* e uma lista *lst* e verifica se *elem* está na *lst*. Produz _True_ se estiver na lista e _False_ 
/// caso contrário.
pub fn esta_na_lista(elem: a, lst: List(a)) -> Bool {
  case lst {
    [] -> False
    [p, ..r] -> elem == p || esta_na_lista(elem, r)
  }
}
pub fn esta_na_lista_examples () {
  check.eq(esta_na_lista("Julia linda", []), False)
  check.eq(esta_na_lista(1, [1, 2, 3]), True)
  check.eq(esta_na_lista(2, [2]), True)
  check.eq(esta_na_lista(3, [1, 2, 4, 6]), False)
  check.eq(esta_na_lista(4, [7]), False)
}

//**EXERCÍCIO 4)**//
//*PRINCIPAL*//
/// ANÁLISE:
/// TIPOS DE DADOS:
/// ESPECIFICAÇÃO:
//*AUXILIAR*//
/// ANÁLISE: Faça uma função que recebe um elemento e uma lista e crie uma lista com os pares entre esse elemento e os elementos da lista.
/// TIPOS DE DADOS: 
/// ESPECIFICAÇÃO: