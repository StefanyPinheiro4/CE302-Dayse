# Lista de funções:

# 1- Implemente um código que envia um e-mail automaticamente para os clientes de uma empresa que fizeram uma compra de acordo com dois critérios: Horário da compra e valor da compra. - Se a compra for pela manhã, o e-mail deve ser iniciar com Bom dia. - Se a compra for à tarde, o e-mail deve ser iniciar com Boa tarde. - Se a compra for à noite, o e-mail deve ser iniciar com Boa noite. - Se o valor da compra for maior que R$100, o e-mail deve conter um cupom de desconto de 10%. - Se o valor da compra for menor ou igual a R$100, o e-mail deve conter um cupom de desconto de 5%.
hora_compra <- "manha"
valor_compra <- 150

if(hora_compra == "manha" & valor_compra > 100) {
  print("Bom dia! Você ganhou um cupom de 10% de desconto.")
} else if(hora_compra == "manha" & valor_compra <= 100) {
  print("Bom dia! Você ganhou um cupom de 5% de desconto.")
} else if(hora_compra == "tarde" & valor_compra > 100) {
  print("Boa tarde! Você ganhou um cupom de 10% de desconto.")
} else if(hora_compra == "tarde" & valor_compra <= 100) {
  print("Boa tarde! Você ganhou um cupom de 5% de desconto.")
} else if(hora_compra == "noite" & valor_compra > 100) {
  print("Boa noite! Você ganhou um cupom de 10% de desconto.")
} else {
  print("Boa noite! Você ganhou um cupom de 5% de desconto.")
}



# 2- Para quaisquer ponto (x,y) em um plano cartesiano, indique a qual quadrante esse ponto pertence.

x = 1
y = -1
if (x > 0) {
  if (y > 0) {
    quadrante = "Quadrante 1"
    cat(paste0("O ponto (", x, ", ", y, ") pertence ao ",  quadrante))
    return(quadrante)
  } else {
    quadrante = "Quadrante 4"
    cat(paste0("O ponto (", x, ", ", y, ") pertence ao ",  quadrante))
  }
} else {
  if (y > 0) {
    quadrante = "Quadrante 2"
    cat(paste0("O ponto (", x, ", ", y, ") pertence ao ",  quadrante))
  } else {
    quadrante = "Quadrante 3"
    cat(paste0("O ponto (", x, ", ", y, ") pertence ao ",  quadrante))
  }
}



# 3- Crie um código que, dado um número, indique se ele é pár ou ímpar.

numero = 5
if(numero %% 2 ==0) {
  cat(paste0("O número", numero, "é par."))
} else {
  cat(paste0("O número", numero, "é ímpar."))
}



# 4- Utilizando o for loop, calcule os n primeiros números da sequência de Fibonacci. A sequência de Fibonacci começa com 1, e os números subsequentes são a soma dos dois anteriores (1, 1, 2, 3, 5, 8, ...).

n = 10
# Vetor para armazenar os números
Fibonacci <- numeric(n)
# Inicialização dos dois primeiros números
Fibonacci[1] <- 1
Fibonacci[2] <- 1
# Cálculo dos números
for (i in 3:n) {
  Fibonacci[i] <- Fibonacci[i - 1] + Fibonacci[i - 2]
}
Fibonacci
# 1 1 2 3 5 8 13 21 34 55



# 5- Para uma matriz de dimensão n×n, indique se cada um dos elementos da matriz é par ou ímpar.

M <- matrix(1:9, nrow = 3, ncol = 3)
P <- matrix(NA, nrow = 3, ncol = 3)
# Verificando se os elementos são pares ou ímpares
for(i in 1:nrow(M)) {
  for(j in 1:ncol(M)) {
    if(M[i, j] %% 2 == 0) {
      cat(paste0("O elemento (", i, ", ", j, ") é par.\n"))
      P[i, j] <- "Par"
    } else {
      cat(paste0("O elemento (", i, ", ", j, ") é ímpar.\n"))
      P[i, j] <- "Ímpar"
    }
  }
}
M
P



# 6- Utilizando o while loop, calcule o número de termos da sequência de Fibonacci até que o último termo seja maior que 10000.

# Inicialização dos dois primeiros números

Fibonacci <- c(1, 1)
i <- 3
while (Fibonacci[i - 1] + Fibonacci[i - 2] <= 10000) {
  Fibonacci[i] <- Fibonacci[i - 1] + Fibonacci[i - 2]
  i <- i + 1
}
print(Fibonacci)



# 7- Em um laboratório, uma cultura inicial de 100 bactérias foi colocada em uma placa de Petri com nutrientes abundantes. Sabe-se que, em condições ideais, a população de bactérias dobra a cada ciclo de crescimento, mas o ambiente da placa tem uma capacidade máxima de 10.000.000.000 bactérias.
# Escreva um script em R que simule o crescimento da população de bactérias utilizando um loop while. Seu script deve:
# 1. Iniciar com a população inicial de 100 bactérias.
# 2. Dobrar a população a cada ciclo de crescimento.
# 3. Interromper o crescimento quando a população atingir ou ultrapassar a capacidade máxima.
# 4. Exibir o número do ciclo e o tamanho da população a cada iteração.
# 5. Mostrar, ao final, o número total de ciclos necessários e o tamanho final da população.


# Inicialização

populacao <- 100
capacidade <- 10000000000
ciclo <- 0

while (populacao < capacidade) {
  ciclo <- ciclo + 1
  populacao <- populacao * 2
  cat(paste0("Ciclo: ", ciclo, " - População: ", populacao, "\n"))
}



# 8- Classificação do Combustível do Meio de Transporte: Crie uma função chamada classifica_combustivel que recebe o nome de um meio de transporte como argumento e retorna o tipo de combustível que esse meio de transporte utiliza. Considere os seguintes meios de transporte e seus respectivos tipos de combustível:
# - Carro: Gasolina, Diesel, Eletrecidade ou Gás Natural
# - Moto: Gasolina
# - Bicicleta: Humana (sem combustível)
# - Ônibus: Diesel ou Gás Natural
# - Trem: Eletricidade ou Diesel
# - Avião: Querosene
# - Barco: Diesel ou Gasolina

classifica_combustivel <- function(meio_transporte) {
  combustivel <- switch(
    meio_transporte,
    "Carro" = c("Gasolina", "Diesel", "Eletricidade", "Gás Natural"),
    "Moto" = "Gasolina",
    "Bicicleta" = "Humana",
    "Ônibus" = c("Diesel", "Gás Natural"),
    "Trem" = c("Eletricidade", "Diesel"),
    "Avião" = "Querosene",
    "Barco" = c("Diesel", "Gasolina")
  )
  return(combustivel)
}
classifica_combustivel("Carro")



# 9- Conversão de Temperatura: Crie uma função chamada converte_temperatura que recebe uma temperatura em graus Celsius ou Fahrenheit como argumento e converte para graus Celsius ou Fahrenheit. A função recebe dois argumentos: A temperatura e a unidade de medida correspondente.

converte_temperatura <- function(temperatura, unidade) {
  if(unidade == "Celsius") {
    fahrenheit <- temperatura * 9/5 + 32
    return(fahrenheit)
  } else if(unidade == "Fahrenheit") {
    celsius <- (temperatura - 32) * 5/9
    return(celsius)
  } else {
    stop("Unidade de medida inválida")
  }
}

converte_temperatura(0, "Celsius")
converte_temperatura(32, "Fahrenheit")



# 10- Calculadora de IMC: Crie uma função chamada calcula_imc que recebe o peso (em quilogramas) e a altura (em metros) de uma pessoa como argumentos e calcula o Índice de Massa Corporal (IMC). A função deve retornar o IMC calculado e uma mensagem que classifica a pessoa em uma das seguintes categorias: Se IMC inferior a 18.5 o invidíduo está “Abaixo do Peso”, se IMC entre 18.5 e 24.9 o indivíduo está com “Peso Normal”, se IMC entre 25 e 29.9 o indivíduo está com “Sobrepeso” e se IMC maior ou igual a 30 o indivíduo está com “Obesidade”.

calcula_imc <- function(peso, altura) {
  imc <- peso / altura^2
  if(imc < 18.5) {
    mensagem <- "Abaixo do Peso"
  } else if(imc >= 18.5 & imc < 25) {
    mensagem <- "Peso Normal"
  } else if(imc >= 25 & imc < 30) {
    mensagem <- "Sobrepeso"
  } else {
    mensagem <- "Obesidade"
  }
  return(list(imc = imc, mensagem = mensagem))
}
calcula_imc(70, 1.75)
calcula_imc(75, 1.65)



# 11- Crie uma função chamada calcula_media_k que recebe um vetor de números como argumento e retorna a média aritmética dos k maiores valores.

calcula_media_k <- function(x, k) {
  media <- mean(tail(sort(x), k))
  return(media)
}



# 12- Crie uma função chamada calcula_desvio_k que recebe um vetor de números como argumento e retorna o desvio padrão dos k maiores valores.

calcula_desvio_k <- function(x, k) {
  desvio <- sd(tail(sort(x), k))
  return(desvio)
}



## Tarefa:

# 1- Implemente uma função chamada cresciento_simples() que receba os seguintes parâmetros:
# - populacao_inicial: número inicial de bactérias (ex: 100).
# - populacao_maxima; capacidade máxima do ambiente (ex: 10.000).
# - ciclos_maximos: número máximo de ciclos permitidos para a simulação (ex: 20)

# crescimento_somples():

crescimento_simples <- function(populacao_inicial, populacao_maxima, ciclos_maximos = 1000) {
  populacao <- populacao_inicial
  ciclo <- 0
  while (populacao < populacao_maxima & ciclo < ciclos_maximos) {
    populacao <- populacao * 2
    ciclo <- ciclo + 1
  }
  
  cat(paste0("Após ", ciclo, "
             ciclos, a população alcançou ", populacao, " bactérias."))
  
  return(list(ciclo = ciclo, populacao = populacao))
}
