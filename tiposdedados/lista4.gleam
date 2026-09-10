//Esse arquivo contém a resolução dos exercícios que envolvem código da lista de Tipos de Dados (10 ao 25).
import sgleam/check
import gleam/int

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
    Norte ->
      case dir2 {
        Norte -> 0
        Sul -> 180
        Leste -> 90
        Oeste -> 270
      }
    Sul ->
      case dir2 {
        Norte -> 180
        Sul -> 0
        Leste -> 270
        Oeste -> 90
      }
    Leste ->
      case dir2 {
        Norte -> 270
        Sul -> 90
        Leste -> 0
        Oeste -> 180
      }
    Oeste ->
      case dir2 {
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
pub type Resolucao {
  // Altura e largura de uma resolução de tela em pixels.
  Resolucao(largura: Int, altura: Int)
}
pub type Aspecto {
    //Aspectos conhecidos de resolução.
    A16por9
    A4por3
    Outro 
}
//item a)
//ANÁLISE: Faça uma função que determina quantos megapixels tem uma imagem dada sua resolução. Saiba que 
//Basta multiplicar altura e largura da resolução e dividir o resultado por 1 milhão.
//TIPOS DE DADOS: A entrada será uma: Uma resolução representada pela estrutura *Resolucao*. A saída será a quantidade de megapixels, 
//representada pelo tipo primitivo *Float*. 
//ESPECIFICAÇÃO: Recebe uma resolução *resolucao* e devolve a quantidade de megapixels da imagem.
pub fn megapixels(resolucao: Resolucao) -> Float {
  int.to_float(resolucao.largura * resolucao.altura) /.  1_000_000.0
}
pub fn megapixels_examples() {
  check.eq(megapixels(Resolucao(1920, 1080)), 2.0736)
  check.eq(megapixels(Resolucao(1280, 720)), 0.9216)
  check.eq(megapixels(Resolucao(3840, 2160)), 8.2944)
}
//item b)
//ANÁLISE: Faça uma função que determina o aspecto de uma resolução. Saiba que a proporção é dada pela divisão da largura pela altura.
//TIPOS DE DADOS: A entrada será uma: Uma resolução representada pela estrutura *Resolucao*. A saída será o aspecto da resolução, 
//representada pelo tipo enumerado *Aspecto*.
//ESPECIFICAÇÃO: 
pub fn aspecto(res: Resolucao) -> Aspecto {
    case res.largura * 9 == res.altura * 16 {
        True -> A16por9
        False -> case res.largura * 3 == res.altura * 4 {
            True -> A4por3
            False -> Outro
        }
    }
}
pub fn aspecto_examples() {
    check.eq(aspecto(Resolucao(1920, 1080)), A16por9)
    check.eq(aspecto(Resolucao(1280, 720)), A16por9)
    check.eq(aspecto(Resolucao(1024, 768)), A4por3)
    check.eq(aspecto(Resolucao(800, 600)), A4por3)
    check.eq(aspecto(Resolucao(1366, 768)), Outro)
}
//item c)
//ANÁLISE: Faça uma função que receba duas resoluções, uma de uma imagem e uma de uma tela.
//E determine se a imagem pode ser exibida na tela sem distorção. Para isso, basta comparar os aspectos das duas resoluções.
//TIPOS DE DADOS: As entradas serão duas resoluções representadas pela estrutura *Resolucao*. A saída será um valor booleano.
//ESPECIFICAÇÃO: Recebe uma resolução de imagem *res_imagem* e uma resolução de tela *res_tela* e devolve True se a imagem pode ser exibida na tela sem distorção, ou False caso contrário.
pub fn pode_exibir_sem_distorcao(res_imagem: Resolucao, res_tela: Resolucao) -> Bool {
    aspecto(res_imagem) == aspecto(res_tela)
}
pub fn pode_exibir_sem_distorcao_examples() {
    check.eq(pode_exibir_sem_distorcao(Resolucao(1920, 1080), Resolucao(1280, 720)), True)
    check.eq(pode_exibir_sem_distorcao(Resolucao(1024, 768), Resolucao(800, 600)), True)
    check.eq(pode_exibir_sem_distorcao(Resolucao(1920, 1080), Resolucao(1024, 768)), False)     
}

//EXERCÍCIO 13)// (UNIÕES)
//item a)
//item b)
