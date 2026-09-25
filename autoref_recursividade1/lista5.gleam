//Este arquivo contém a resolução dos exercícios práticos da lista 5 (Autorreferência e Recursividade) (6 ao 21).

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
//ANÁLISE: Faça uma função que receba uma lista de strings e crie uma nova lista removendo as strings vazias da lista original.
//TIPOS DE DADOS:A entrada será uma: Uma lista de strings que será um tipo de autorreferência contendo o tipo primitivo *String*, uma *List(String)*.
//A saída será uma lista com os elementos vazios removidos da lista de entrada, representada também pelo tipo com autorreferência contendo o tipo primitivo *String*.
//Uma *List(String)*.
//ESPECIFICAÇÃO: Recebe uma lista de strings *lst* e cria uma nova lista removendo suas strings vazias.
pub fn remove_string_vazia(lst: List(String)) -> List(String) {
    case lst {
        [] -> []
        [primeiro, ..resto] -> case primeiro != "" {
            True -> [primeiro, ..remove_string_vazia(resto)]
            False -> remove_string_vazia(resto) 
        }
    }
}
pub fn remove_string_vazia_examples() {
    check.eq(remove_string_vazia(["Julia", "","linda"]), ["Julia", "linda"])
    check.eq(remove_string_vazia(["VKS ", "Tutu"]), ["VKS ", "Tutu"])
}

//EXERCÍCIO 10)
//ANÁLISE: Faça uma função que recebe uma lista de booleanos e verifique se todos eles são verdadeiros.
//TIPOS DE DADOS: A entrada será uma: Uma lista de booleanos que será representada por um tipo de autorreferência contendo o tipo primitivo *Bool*, uma *List(Bool).
//A saída será o resultado dessa verificação, representada pelo tipo primitivo *Bool*.
//ESPECIFICAÇÃO: Recebe uma lista de booleanos *lst* e verifica se todos os elementos são verdadeiros. Produz *True* se todos forem verdadeiros e
//*False* caso contrário.
pub fn todos_verdadeiros(lst: List(Bool)) -> Bool {
    case lst {
        [] -> True  
        [primeiro, ..resto] -> case primeiro == True {
            True -> todos_verdadeiros(resto)
            False -> False
        }
    }
}
pub fn todos_verdadeiros_examples() {
    check.eq(todos_verdadeiros([True, True, True]), True)
    check.eq(todos_verdadeiros([True, True, False]), False)
    check.eq(todos_verdadeiros([]), True) 
}

//EXERCÍCIO 11)
//ANÁLISE: Faça uma função que receba uma lista de números e verifique se ela está em ordem não-decrescente.
//TIPOS DE DADOS: A entrada será uma: Um tipo com autorreferência contendo o tipo primitivo *Int*, uma *List(Int)*. 
//A saída será o resultado dessa verificação, que será representada pelo tipo primtivo *Bool*.
//ESPECIFICAÇÃO: Recebe uma lista de números *lst* e verifica se ela está em ordem não-decrescente. Produz *True* se estiver
//e produz *False* caso contrário.
pub fn eh_nao_decrescente (lst: List(Int)) -> Bool {
    case lst {
        [] -> True
        [_] -> True 
        [primeiro, segundo, ..resto] -> case primeiro <= segundo {
            True -> eh_nao_decrescente([segundo, ..resto])
            False -> False 
        }
    }
}
pub fn eh_nao_decrescente_examples () {
    check.eq(eh_nao_decrescente([1, 2, 3, 4, 5, 6]), True)
    check.eq(eh_nao_decrescente([1, 2, 3, 2, 4, 3, 2, 1]), False)
    check.eq(eh_nao_decrescente([]), True)
    check.eq(eh_nao_decrescente([0]), True)
}

//EXERCÍCIO 12
//ANÁLISE: Faça uma função que recebe uma lista de elementos e que retorne uma lista com os mesmoe elementos, porém em ordem contrária.
//TIPOS DE DADOS: A entrada será um tipo com autorreferência contendo algo genérico, representado por *List(a)*. A saída
//será também um tipo com autorreferência contendo algo genérico, representado também por *List(a)*
//ESPECIFICAÇÃO: Recebe uma lista contendo qualquer tipo de elemento *lst* e retorna outra lista com os mesmos elementos em ordem contrária.
pub fn inverte_lista(lst: List(a)) -> List(a) {
    case lst {
        [] -> []
        [primeiro, ..resto] -> adiciona_ao_final(inverte_lista(resto), primeiro)
    }
}
pub fn inverte_lista_examples() {
    check.eq(inverte_lista([True, True, True, True, True, True, False]), [False, True, True, True, True, True, True])
    check.eq(inverte_lista([0]), [0])
    check.eq(inverte_lista([]), [])
}
//FUNC. AUXILIAR DO EXERCÍCIO 12
//ANÁLISE: Faça uma função que recebe uma lista genérica e um elemento genérico (de mesmo tipo) e coloque esse elemento ao final da lista.
//TIPOS DE DADOS: A entrada será um tipo com autorreferência contendo algo genérico, representado por *List(a)*. A saída
//será também um tipo com autorreferência contendo algo genérico, representado também por *List(a)* 
//ESPECIFICAÇÃO: Recebe uma lista *lst* e um elemento *elem* e adiciona o elemento ao final da lista.
pub fn adiciona_ao_final(lst: List(a), elem: a) -> List(a) {
    case lst {
        [] -> [elem]
        [primeiro, ..resto] -> [primeiro, ..adiciona_ao_final(resto, elem)]
    }
}
pub fn adiciona_ao_final_examples () {
    check.eq(adiciona_ao_final([True, True, True, True, True, True], False), [True, True, True, True, True, True, False])
}

//EXERCÍCIO 13
//ANÁLISE:
//TIPOS DE DADOS:
//ESPECIFICAÇÃO: