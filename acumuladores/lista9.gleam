//Este arquivo contém as respostas da parte prática da lista 9 (acumuladores) (6 a 8).

//imports
import sgleam/check
import gleam/int
import gleam/list

//*EXERCÍCIO 6*//
pub fn tamanho(lst: List(a)) -> Int {
  list.fold(lst, 0, fn(acc, _) { acc + 1 })
}
pub fn soma(lst: List(Int)) -> Int {
  list.fold(lst, 0, int.add)
}
pub fn inverte(lst: List(a)) -> List(a) {
  list.fold(lst, [], fn(acc, e) { [e, ..acc] })
}
pub fn lista_pares(lst: List(Int)) -> List(Int) {
  let acc_reverso = list.fold(lst, [], fn(acc, e) {
    case int.is_even(e) {
      True -> [e, ..acc]
      False -> acc
    }
  })
  inverte(acc_reverso)
}

///*EXERCÍCIO 7**///
pub type Posicao {
    //representa posicao
    Posicao(x: Int, y: Int, z: Int)
}
pub type Direcao {
    //direcoes possiveis
    Norte
    Sul
    Leste
    Oeste
    Cima
    Baixo
}
//*PRINCIPAL*//
//ANÁLISE: Faça uma função que recebe uma posição de personagem e uma sequência de deslocamentos e retorne a nova posição do personagem.
pub fn move_posicao (posic: Posicao, moves: List(Direcao)) -> Posicao {
    case moves {
        [] -> posic 
        [p, ..r] -> move_posicao(move_uma_posicao(posic, p), r)
    }
}
//*auxiliar*//
//ANÁLISE: Faça uma função que recebe uma direção e uma posição e devolve a nova posição.
pub fn move_uma_posicao(posicao: Posicao, direcao: Direcao) -> Posicao {
    case direcao {
        Norte -> Posicao(..posicao, y: posicao.y + 1)
        Sul -> Posicao(..posicao, y: posicao.y - 1)
        Leste -> Posicao(..posicao, x: posicao.x + 1)
        Oeste -> Posicao(..posicao, x: posicao.x - 1)
        Cima -> Posicao(..posicao, z: posicao.z + 1)
        Baixo -> Posicao (..posicao, z: posicao.z - 1)
    }
}

///***EXERCÍCIO 7**///
//ANÁLISE: Faça uma função que recebe uma lista de transferências e saldo inicial e calcula quanto o pedro deve doar. Uma vez que a conta negativar ele doa 10 reais.
pub fn doacao(saldo: Int, mov: List(Int)) -> Int {
    calcula_doacoes_loop(mov, saldo, 0)
}

//*auxiliar*//
fn calcula_doacoes_loop(
  movimentacoes: List(Int),
  saldo: Int,
  doacoes: Int,
) -> Int {
  case movimentacoes {
    [] -> doacoes
    [m, ..resto] -> {
      let novo_saldo = saldo + m
      case novo_saldo < 0 {
        True -> calcula_doacoes_loop(resto, novo_saldo, doacoes + 10)
        False -> calcula_doacoes_loop(resto, novo_saldo, doacoes)
      }
    }
  }
}