//Este arquivo contém a resolução dos exercícios práticos da lista 5 (Autorreferênmcia e Recursividade) (6 ao 21).

//IMPORTS 
import sgleam/check
import gleam/int

//EXERCÍCIO 6)
//ANÁLISE: Faça uma função que receba uma lista de strings e concatene todos os elementos dessa lista.
//TIPOS DE DADOS: A entrada será uma: Uma lista de strings que será representada por um tipo de dado com autorreferência contendo o tipo primitivo *String*, será
//uma *List(String)*. A saída será a concatenação de todos os elementos da lista, representada pelo tipo primitivo *String*
//ESPECIFICAÇÃO: Recebe uma lista de strings *lst* e concatena todos os elementos dela.
pub fn concatena(lst: List(String)) -> String {
    case lst {
        [] -> ""
        [primeiro, ..resto] -> primeiro <> concatena(resto)
    }
}
pub fn concatena_examples() {
    check.eq(concatena(["J", "U", "L", "I", "A"]), "JULIA")
    check.eq(concatena(["V", "K", "S", " ", "T", "u", "t", "u"]), "VKS Tutu")
}

//EXERCÍCIO 7)
//ANÁLISE: Faça uma função que receba uma lista de números e determine a quantidade de elementos dessa lista de números.
//TIPOS DE DADOS: A entrada será uma: Uma lista de números que será representada pelo tipo com autorreferência *List* contendo números representados pelo
//tipo primitivo *Int*, uma *List(Int)*. A saída será a contagem de elementos da lista, representada pelo tipo primitivo *Int*.
//ESPECIFICAÇÃO: Recebe uma lista *lst* e calcula a quantidade de elementos que ela contém.
pub fn conta_elementos(lst: List(Int)) -> Int {
    case lst {
        [] -> 0
        [_primeiro, ..resto] -> 1 + conta_elementos(resto)
    }
}
pub fn conta_elementos_examples() {
    check.eq(conta_elementos([6, 7]), 2)
    check.eq(conta_elementos([2, 3, 7, 6, 5, 4, 8, 9, 12]), 9)
}

//EXERCÍCIO 8)
//ANÁLISE: Faça uma função que recebe uma lista de números e a converte em uma lista de strings.
//TIPOS DE DADOS: A entrada será uma: Uma lista de números que será representada pelo tipo com autorreferência *List* contendo números representados pelo
//tipo primitivo *Int*, uma *List(Int)*. A saída será uma lista com os mesmos elementos, porém, no formato de string, representada também pelo tipo com
//autorreferência *List* contendo o tipo primtivo *String*, uma *List(String)*
//ESPECIFICAÇÃO:
pub fn converte_para_string(lst: List(Int)) -> List(String) {
    case lst{
        [] -> []
        [primeiro, ..resto] -> [int.to_string(primeiro), ..converte_para_string(resto)]
    }
}
pub fn converte_para_string_examples () {
    check.eq(converte_para_string([1, 2, 3, 4, 5, 6]), ["1", "2", "3", "4", "5", "6"])
    check.eq(converte_para_string([6, 7]), ["6", "7"])
}

//EXERCÍCIO 9)
//ANÁLISE:
//TIPOS DE DADOS:
//ESPECIFICAÇÃO: 