import sgleam/check

//EXERCÍCIO 10
//TIPOS DE DADOS:
pub type Associacao {
    //Associação chave-valor.
    Associacao(chave: String, valor: Int)
}
//ANÁLISE: Faça uma função que recebe uma lista de associações, uma chave e um valor e atualize a lista. Isto é: Se a chave já existir, ajusta o valor novo nessa chave,
//se a chave não existir, adiciona uma nova associação na lista com a chave e o valor do parâmetro. Devolve uma lista com a atualização.
//TIPOS DE DADOS: As entradas serão três: Um tipo com autorreferência contendo a estrutura *Associacao*, uma *List(Associacao)*, uma chave representada pelo
//tipo primitivo *String* e um valor representado pelo tipo primitivo *Int*. A saída é a lista atualizada representada por um tipo com autorreferência contendo uma estrutura
//*Associacao*, também uma *List(Associacao)*.
//ESPECIFICAÇÃO: Recebe uma lista de associações *lst*, uma *chave* e um *valor* e atualiza a lista. 
pub fn atualiza(lst: List(Associacao), chave: String, valor: Int) -> List(Associacao) {
    case lst {
        [] -> [Associacao(chave, valor)]
        [primeiro, ..resto] -> case primeiro.chave == chave {
            True -> [Associacao(chave, valor), ..resto]
            False -> [primeiro, ..atualiza(resto, chave, valor)]
        }
    }
}
pub fn atualiza_examples() {
    check.eq(atualiza([], "A", 10), [Associacao("A", 10)])
    check.eq(atualiza([Associacao("A", 10), Associacao("B", 20)], "B", 30), [Associacao("A", 10), Associacao("B", 30)])
    check.eq(atualiza([Associacao("A", 10), Associacao("B", 20)], "A", 30), [Associacao("A", 30), Associacao("B", 20)])
    check.eq(atualiza([Associacao("A", 10)], "J", 67), [Associacao("A", 10), Associacao("J", 67)])
}

//NAO DECRESCENTE
pub fn nao_decrescente(lst: List(Int)) -> Bool {
    case lst {
        [] -> True 
        [_] ->True
        [primeiro, segundo, ..resto] -> case primeiro <= segundo {
            True -> nao_decrescente([segundo, ..resto])
            False -> False
        } 
    }
}
pub fn eh_nao_decrescente_examples () {
    check.eq(nao_decrescente([1, 2, 3, 4, 5, 6]), True)
    check.eq(nao_decrescente([1, 2, 3, 2, 4, 3, 2, 1]), False)
    check.eq(nao_decrescente([]), True)
    check.eq(nao_decrescente([0]), True)
}

//NAO REPETIR
pub fn nao_repete(lst: List(Int)) -> List(Int) {
    case lst {
        [] -> []
        [_] -> [_]
        [primeiro, segundo, ..resto] -> case primeiro == segundo {
            True -> [primeiro, ..nao_repete(resto)]
            False -> [primeiro, ..nao_repete([segundo, resto])]
        }
    }
}