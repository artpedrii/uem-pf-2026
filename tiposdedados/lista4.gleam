//Esse arquivo contém a resolução dos exercícios que envolvem código da lista de Tipos de Dados (10 ao 25).
import sgleam/check

//EXERCÍCIO 10)// (TIPOS ENUMERADOS)
//Direções cardeais principais.
pub type Direcao {
    Norte
    Sul 
    Leste 
    Oeste
}
//item a)
//ANÁLISE: Faça uma função que recebe uma direção e indique sua direção oposta.
//TIPOS DE DADOS: A entrada será uma: Uma direção que será representada pelo tipo enumerado *Direcao*. A saída será a direção oposta, 
//representada também pelo tipo enumerado *Direcao*.
//ESPEIFICAÇÃO: Recebe uma direção *dir* e devolve sua direção oposta.
pub fn direcao_oposta(dir: Direcao) -> Direcao {
    case dir {
        Norte -> Sul
        Sul -> Norte
        Leste -> Oeste
        Oeste -> Leste
    }
}
pub fn direcao_oposta_examples() {
    check.eq(direcao_oposta(Sul), Norte)
    check.eq(direcao_oposta(Norte), Sul)
    check.eq(direcao_oposta(Leste), Oeste)
    check.eq(direcao_oposta(Oeste), Leste)
}
//item b)
//ANÁLISE: Faça uma função que receba uma direção e indique qual direção está a noventa graus no sentido horário da direção inicialmente dada.
//TIPOS DE DADOS: A entrada será uma: Uma direção que será representada pelo tipo enumerado *Direcao*. A saída será a direção que está a 90 graus
//NO SENTIDO HORÁRIO da direção de entrada., representada também pelo tipo enumerado *Direcao*.
//ESPECIFICAÇÃO: Recebe uma direção *dir* e devolve qual direção está a 90 graus no SENTIDO HORÁRIO dessa direção inicialmente dada.
pub fn direcao_90_graus_horario(dir: Direcao) -> Direcao {
    case dir {
        Norte -> Leste
        Sul -> Oeste
        Leste -> Sul 
        Oeste -> Norte
    }
}
pub fn direcao_90_graus_horario_examples() {
    check.eq(direcao_90_graus_horario(Norte), Leste)
    check.eq(direcao_90_graus_horario(Sul), Oeste)
    check.eq(direcao_90_graus_horario(Leste), Sul)
    check.eq(direcao_90_graus_horario(Oeste), Norte)
}
//item c)
//ANÁLISE: Faça uma função que receba uma direção e indique qual direção está a noventa graus no sentido anti-horário da direção inicialmente dada.
//TIPOS DE DADOS: A entrada será uma: Uma direção que será representada pelo tipo enumerado *Direcao*. A saída será a direção que está a 90 graus
//NO SENTIDO ANTI-HORÁRIO da direção de entrada., representada também pelo tipo enumerado *Direcao*.
//ESPECIFICAÇÃO: Recebe uma direção *dir* e devolve qual direção está a 90 graus no SENTIDO ANTI-HORÁRIO dessa direção inicialmente dada.
pub fn direcao_90_graus_antihorario(dir: Direcao) -> Direcao {
    case dir {
        Norte -> Oeste
        Sul -> Leste
        Leste -> Norte
        Oeste -> Sul
    }
}
pub fn direcao_90_graus_antihorario_examples() {
    check.eq(direcao_90_graus_antihorario(Norte), Oeste)
    check.eq(direcao_90_graus_antihorario(Sul), Leste)
    check.eq(direcao_90_graus_antihorario(Leste), Norte)
    check.eq(direcao_90_graus_antihorario(Oeste), Sul)
}
//item d)
//ANÁLISE: Faça uma função que receba duas direções e devolva quantos graus são necessários para chegar de uma para a outra no sentido horário.
//TIPOS DE DADOS: As entradas serão duas: Duas direções representadas pelo tipo enumerado *Direcao*. A saída será a quantidade de graus, 
//representada pelo tipo primitivo *Int*
//ESPECIFICAÇÃO: Recebe *dir1* e *dir2* e retorna quantos graus em sentido horário são necessários para chegar de *dir1* até *dir2*
pub fn quantidade_graus_horario(dir1: Direcao, dir2: Direcao) -> Int {
    case dir1 {
        Norte -> case dir2 {
            Norte -> 0
            Sul -> 180
            Leste -> 90
            Oeste -> 270
        }
        Sul -> case dir2 {
            Norte -> 180
            Sul -> 0
            Leste -> 270
            Oeste -> 90
        }
        Leste -> case dir2 {
            Norte -> 270
            Sul -> 90
            Leste -> 0
            Oeste -> 180 
        }
        Oeste -> case dir2 {
            Norte -> 90
            Sul -> 270
            Leste -> 180
            Oeste -> 0
        }    
    }
}
pub fn quantidade_graus_horario_examples() {
    check.eq(quantidade_graus_horario(Norte, Sul), 180)
    check.eq(quantidade_graus_horario(Norte, Leste), 90)
    check.eq(quantidade_graus_horario(Norte, Oeste), 270)
    check.eq(quantidade_graus_horario(Sul, Norte), 180)
    check.eq(quantidade_graus_horario(Sul, Leste), 270)
    check.eq(quantidade_graus_horario(Sul, Oeste), 90)
    check.eq(quantidade_graus_horario(Leste, Norte), 270)
    check.eq(quantidade_graus_horario(Leste, Sul), 90)
    check.eq(quantidade_graus_horario(Leste, Oeste), 180)
    check.eq(quantidade_graus_horario(Oeste, Norte), 90)
    check.eq(quantidade_graus_horario(Oeste, Sul), 270)
    check.eq(quantidade_graus_horario(Oeste, Leste), 180)
}

//EXERCÍCIO 12)// (ESTRUTURAS)
//item a)
//item b)
//item c)

//EXERCÍCIO 13)// (UNIÕES)
//item a)
//item b)
