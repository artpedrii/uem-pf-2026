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
//*AUXILIAR*//
/// ANÁLISE: Faça uma função que recebe um elemento e uma lista e cria os pares entre esse elemento e todos os elementos da lista.
/// TIPOS DE DADOS: As entradas serão duas: Um elemento genérico representado pelo tipo *a* e um tipo autorreferente contendo
/// um elemento genérico, representado por *List(a)*. A saída será uma lista de listas genéricas representada por *List(List(a))*.
/// ESPECIFICAÇÃO: Recebe um elemento *elem* e uma lista *lst* e cria listas contendo *elem* e cada elemento de *lst*.
pub fn pares_auxiliar(elem: a, lst: List(a)) -> List(List(a)) {
  case lst {
    [] -> []
    [p, ..r] -> [[elem, p], ..pares_auxiliar(elem, r)]
  }
}
pub fn pares_auxiliar_examples() {
  check.eq(pares_auxiliar(1, []), [])
  check.eq(pares_auxiliar(1, [2, 3]), [[1, 2], [1, 3]])
}
//*AUXILIAR DE CONCATENAÇÃO*//
/// ANÁLISE: Faça uma função que recebe duas listas e junta todos os elementos da segunda lista no final da primeira.
/// TIPOS DE DADOS: As entradas serão duas listas genéricas *List(a)*. A saída será uma lista genérica *List(a)*.
/// ESPECIFICAÇÃO: Concatena a primeira lista com a segunda.
pub fn concatenar(lsta: List(a), lstb: List(a)) -> List(a) {
  case lsta {
    [] -> lstb
    [p, ..r] -> [p, ..concatenar(r, lstb)]
  }
}
pub fn concatenar_examples() {
  check.eq(concatenar([1, 2], [3, 4]), [1, 2, 3, 4])
}
//*PRINCIPAL*//
/// ANÁLISE: Faça uma função que recebe duas listas e calcula todos os possíveis pares entre os elementos delas.
/// TIPOS DE DADOS: As entradas serão duas: Listas contendo um tipo genérico, representadas por *List(a)*.
/// A saída será uma lista de listas genéricas representada por *List(List(a))*.
/// ESPECIFICAÇÃO: Recebe duas listas *lsta* e *lstb* e retorna o produto cartesiano entre elas.
pub fn pares(lsta: List(a), lstb: List(a)) -> List(List(a)) {
  case lsta {
    [] -> []
    [p, ..r] -> concatenar(pares_auxiliar(p, lstb), pares(r, lstb))
  }
}
pub fn pares_examples() {
  check.eq(pares([3, 1, 8], [7, 4]), [[3, 7], [3, 4], [1, 7], [1, 4], [8, 7], [8, 4]])
  check.eq(pares([], [1, 2]), [])
  check.eq(pares([1, 2], []), [])
}

//**EXERCÍCIO 5)**//
//*PRINCIPAL*//
/// ANÁLISE: Faça uma função que recebe uma lista de nomes e uma lista de booleanos e retorna apenas os nomes que possuem *True* na mesma posição.
/// TIPOS DE DADOS: Entradas: uma lista de strings *List(String)* e uma lista de booleanos *List(Bool)*. Saída: uma lista de strings *List(String)*.
/// ESPECIFICAÇÃO: Retorna os nomes de *nomes* correspondentes a *True* em *booleanos*.
pub fn seleciona(nomes: List(String), booleanos: List(Bool)) -> List(String) {
  case nomes, booleanos {
    [], _ -> []
    _, [] -> []
    [nome, ..r_nomes], [booleano, ..r_bools] -> 
      case booleano {
        True -> [nome, ..seleciona(r_nomes, r_bools)]
        False -> seleciona(r_nomes, r_bools)
      }
  }
}
pub fn seleciona_examples() {
  check.eq(seleciona(["Jorge", "Amanda", "Pedro", "Joana"], [True, False, False, True]), ["Jorge", "Joana"])
  check.eq(seleciona(["A", "B"], [False, False]), [])
}

//**EXERCÍCIO 6)**//
//*PRINCIPAL*//
/// ANÁLISE: Faça uma função que verifica se duas listas de números são idênticas, processando elemento por elemento.
/// TIPOS DE DADOS: Entradas: duas listas de inteiros *List(Int)*. Saída: um booleano *Bool*.
/// ESPECIFICAÇÃO: Verifica se as duas listas possuem os mesmos elementos na mesma ordem.
pub fn listas_iguais(lsta: List(Int), lstb: List(Int)) -> Bool {
  case lsta, lstb {
    [], [] -> True
    [p1, ..r1], [p2, ..r2] -> p1 == p2 && listas_iguais(r1, r2)
    _, _ -> False
  }
}
pub fn listas_iguais_examples() {
  check.eq(listas_iguais([1, 2, 3], [1, 2, 3]), True)
  check.eq(listas_iguais([1, 2], [1, 2, 3]), False)
  check.eq(listas_iguais([1, 2, 3], [1, 2]), False)
}

//**EXERCÍCIO 7)**//
//*PRINCIPAL*//
/// ANÁLISE: Faça uma função que verifica se a primeira lista tem mais elementos do que a segunda.
/// TIPOS DE DADOS: Entradas: duas listas genéricas *List(a)*. Saída: um booleano *Bool*.
/// ESPECIFICAÇÃO: Retorna *True* se o tamanho de *lsta* for maior que o de *lstb*.
pub fn tem_mais_elementos(lsta: List(a), lstb: List(a)) -> Bool {
  case lsta, lstb {
    [], _ -> False
    [_, .._], [] -> True
    [_, ..r1], [_, ..r2] -> tem_mais_elementos(r1, r2)
  }
}
pub fn tem_mais_elementos_examples() {
  check.eq(tem_mais_elementos([1, 2, 3], [1, 2]), True)
  check.eq(tem_mais_elementos([1, 2], [1, 2, 3]), False)
  check.eq(tem_mais_elementos([1, 2], [3, 4]), False)
}

//**EXERCÍCIO 8)**//
//*PRINCIPAL*//
/// ANÁLISE: Faça uma função que recebe uma lista e um número *n* e retorna uma nova lista com os *n* primeiros elementos.
/// TIPOS DE DADOS: Entradas: uma lista genérica *List(a)* e um inteiro *Int*. Saída: uma lista genérica *List(a)*.
/// ESPECIFICAÇÃO: Devolve os *n* primeiros elementos.
pub fn mantem(lst: List(a), n: Int) -> List(a) {
  case lst, n > 0 {
    [], _ -> []
    [p, ..r], True -> [p, ..mantem(r, n - 1)]
    _, False -> []
  }
}
pub fn mantem_examples() {
  check.eq(mantem([10, 40, 70, 20, 3], 2), [10, 40])
  check.eq(mantem([1, 2], 0), [])
}

//**EXERCÍCIO 9)**//
//*PRINCIPAL*//
/// ANÁLISE: Faça uma função que recebe uma lista e um número *n* e retorna uma nova lista sem os *n* primeiros elementos.
/// TIPOS DE DADOS: Entradas: uma lista genérica *List(a)* e um inteiro *Int*. Saída: uma lista genérica *List(a)*.
/// ESPECIFICAÇÃO: Descarta os *n* primeiros elementos e devolve o resto.
pub fn descarta(lst: List(a), n: Int) -> List(a) {
  case lst, n > 0 {
    [], _ -> []
    [_, ..r], True -> descarta(r, n - 1)
    _, False -> lst
  }
}
pub fn descarta_examples() {
  check.eq(descarta([10, 40, 70, 20, 3], 2), [70, 20, 3])
  check.eq(descarta([1, 2], 0), [1, 2])
}

//**EXERCÍCIO 10)**//
//*PRINCIPAL*//
/// ANÁLISE: Faça uma função que recebe uma lista e uma posição e remove o elemento que está naquela posição (considerando 0 como primeiro).
/// TIPOS DE DADOS: Entradas: uma lista genérica *List(a)* e um inteiro *Int*. Saída: uma lista genérica *List(a)*.
/// ESPECIFICAÇÃO: Remove o elemento na posição *pos*.
pub fn remove_em(lst: List(a), pos: Int) -> List(a) {
  case lst, pos > 0 {
    [], _ -> []
    [_, ..r], False -> r
    [p, ..r], True -> [p, ..remove_em(r, pos - 1)]
  }
}
pub fn remove_em_examples() {
  check.eq(remove_em([3, 6, 1, 2], 2), [3, 6, 2])
  check.eq(remove_em([3, 6], 0), [6])
}

//**EXERCÍCIO 11)**//
//*PRINCIPAL*//
/// ANÁLISE: Faça uma função que recebe uma lista, um elemento e uma posição, inserindo o elemento naquela posição (considerando 0 como primeiro).
/// TIPOS DE DADOS: Entradas: uma lista genérica *List(a)*, um elemento genérico *a*, e um inteiro *Int*. Saída: uma lista genérica *List(a)*.
/// ESPECIFICAÇÃO: Insere *elem* na posição *pos* de *lst*.
pub fn insere_em(lst: List(a), elem: a, pos: Int) -> List(a) {
  case lst, pos > 0 {
    [], _ -> [elem]
    _, False -> [elem, ..lst]
    [p, ..r], True -> [p, ..insere_em(r, elem, pos - 1)]
  }
}
pub fn insere_em_examples() {
  check.eq(insere_em([3, 6, 1, 2], 5, 2), [3, 6, 5, 1, 2])
  check.eq(insere_em([3, 6], 5, 0), [5, 3, 6])
}