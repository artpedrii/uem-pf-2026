//Este arquivo contém a resolução das questões práticas da lista (7 ao 25).

//imports
import sgleam/check

//EXERCÍCIO 7)
//ANÁLISE: Faça uma função que recebe um número natural n e um valor v e crie uma nova
//lista com n repetições do valor v.
//TIPOS DE DADOS: As entradas serão duas, um número natural n representado pelo tipo primitivo *Int* e
//um valor v representado pelo tipo primitivo genérico *a*.
//ESPECIFICAÇÃO: Recebe um valor *v* e um número natural *n* e cria uma lista com *n* repetições de *v*.
pub fn repete_valor (n: Int, v: a) {
    todo
}
pub fn repete_valor_examples {
    check.eq(repete_valor(-1, 2), [])
    check.eq(repete_valor(0, 2), [])
    check.eq(repete_valor(5, 2), [2, 2, 2, 2, 2])
}