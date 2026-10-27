//Aqui está a resolução dos exercícios práticos da lista 7 (3 ao 11).

//imports
import sgleam/check

//EXERCÍCIO 3)
//ANÁLISE: Faça uma função que recebe duas listas e verifica se todos os elementos da primeiro lista
//estão dentro da outra lista.
//TIPOS DE DADOS: As entradas serão duas: Dois tipos autorreferentes contendo algo genérico, representados por *List(a)*.
//A saída será o resultado da verificação, representada pelo tipo primitivo *Bool*.
//ESPECIFICAÇÃO: Recebe duas listas *lsta* e *lstb* e verifica se todos os elementos de *lsta* estão contidos em (independente da ordem) *lstb*. Produz *True* se estiverem contidos
//e *False* caso contrário.
pub fn esta_contido(lsta: List(a), lstb: List(a)) -> Bool {
  todo
}

pub fn esta_contido_examples() {
  check.eq(esta_contido([1, 2, 3, 4, 5], [1, 7, 2, 4, 3, 5]), True)
  check.eq(esta_contido([1, 2, 3, 4, 5, 6], [1, 7, 2, 4, 3, 5]), False)
  check.eq(esta_contido([], []), False)
  check.eq(esta_contido([1], []), False)
  check.eq(esta_contido([], [1, 2]), False)
}
