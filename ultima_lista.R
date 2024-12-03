# Estruturas de Repetição e Funções:


# Fazer o exercício da sessão 6.2.5 de gysi.quarto.pub



# Base de conhecimento:

if (condição) {
  # Código a ser executado se a condição for verdadeira
} else {
  # Código a ser executado se a condição for falsa
}



# Questão 1:
# Dado o conjunto de números naturais entre 1 e 500.000, resolva as questões a seguir:
# 1- Quantos números primos existem neste intervalo?
# Dica: crie uma função chamada conta_primos(limite) que receba um número limite (neste caso o 500.000) e retorne a quantidade de números primos encontrados;

# Função para contar números primos em um intervalo
contar_primos <- function(inicio, fim) {
  # Função auxiliar para verificar se um número é primo:
  primo <- function(n) {
    if (n <= 1) {
      return(FALSE)
    }
    for (i in 2:sqrt(n)) {
      if (n %% i == 0) {
        return(FALSE)
      }
    }
    return(TRUE)
  }
  # Criando o vetor de números no intervalo:
  numeros <- inicio:fim
  # Selecionando os números primos:
  num_primos <- numeros[sapply(numeros, primo)]
  # Retornando a quantidade de números primos
  return(length(num_primos))
}
# Contando os números primos de 1 a 500.000:
contar_primos(1, 500000)
# Resposta: 41.537 números primos.



# 2-Quantos números pertencem à sequência (S_i), definida por:
# [S_i = i + \frac{i^2}{2}]
# Condição: considere apenas os números de (S_i) no intervalo [1, 500.000];
# Dica: implemente uma função chamada calcular_sequencia(limite) que retorne os números (S_i) que atendem a condição;

calcular_sequencia <- function(limite) {
  # Iniciando um vetor vazio para armazenar os valores de (S-i)
  numeros <- c()
  # Define o índice inicial
  i <- 1
  # Calcula os valores de S-i até ultrapassar o limite
  repeat {
    # Calcula S_i
    S_i <- i + (i^2 / 2)
    # Se S_i ultrapassar o limite, para o loop
    if (S_i > limite) break
    # Adiciona S_i ao vetor de números vélidos
    numeros <- c(numeros, S_i)
    # Incrementa o índice
    i <- i + 1
  }
  return(numeros)
}
# Define o limite de 500.000 e chama a função
limite <- 500000
resultados <- calcular_sequencia(limite)
# Exibe os resultados
print(length(resultados)) # Quantidade de números; Resposta: 999
print(resultados) # Os números



# Questão 2:
# Faça um programa que calcule o novo salário de um funcionário com base no código de seu cargo, de acordo com a tabela dada:
# 1- Implemente uma função chamada calcular_aumento(codigo, salario) que receba o código do cargo e o salário atual, e retorne o valor do aumento e o novo salário:

calcular_aumento <- function(codigo, salario) {
  # Tabela de aumentos por código do cargo
  aumentos <- c(
    "1" = 0.10, # Estagiário
    "2" = 0.20, # Analista Júnior
    "3" = 0.22, # Analista Pleno
    "4" = 0.25, # Analista Senior
    "5" = 0.28 # Especialista
  )
  # Verificando se o código do cargo é válido
  if (!(as.character(codigo) %in% names(aumentos))) {
    stop("Código de cargo inválido. Use um código entre 1 e 5")
  }
  # obtendo o percentual de aumento correspondente 
  percentual_aumento <- aumentos[as.character(codigo)]
  # Calculando o valor do aumento e o novo salário
  valor_aumento <- salario * percentual_aumento
  novo_salario <- salario + valor_aumento
  # Retornando os resultados como uma lista
  return(list(valor_aumento = valor_aumento, novo_salario = novo_salario))
}



# 2- Aplique a função desenvolvida sobre uma lista de funcionários com diferentes cargos e salários, e exiba os resultados:

codigo <- 1
salario <- 1500
resultado <- calcular_aumento(codigo, salario)
# Exibindo os resultados;
cat("Valor do aumento: R$", resultado$valor_aumento, "\n")
cat("Novo salário: R$", resultado$novo_salario, "\n")
# Respostas: 150 e 1650
codigo <- 2
salario <- 3000
resultado <- calcular_aumento(codigo, salario)
cat("Valor do aumento: R$", resultado$valor_aumento, "\n")
cat("Novo salário: R$", resultado$novo_salario, "\n")
# Respostas: 600 e 3600
codigo <- 3
salario <- 4500
resultado <- calcular_aumento(codigo, salario)
cat("Valor do aumento: R$", resultado$valor_aumento, "\n")
cat("Novo salário: R$", resultado$novo_salario, "\n")
# Respostas: 990 e 5490
codigo <- 4
salario <- 6000
resultado <- calcular_aumento(codigo, salario)
cat("Valor do aumento: R$", resultado$valor_aumento, "\n")
cat("Novo salário: R$", resultado$novo_salario, "\n")
# REspostas: 1500 e 7500
codigo <- 5
salario <- 7500
resultado <- calcular_aumento(codigo, salario)
cat("Valor do aumento: R$", resultado$valor_aumento, "\n")
cat("Novo salário: R$", resultado$novo_salario, "\n")
# Respostas: 2100 e 9600


# Questão 3
# Um indivíduo possui três meios de transposte e escolhe o mais apropriado com base nas condições abaixo:

# 1. Escolha do meio de tarnsporte com base na distância:
# - Mais de 500 km: Avião
# - Entre 50 e 500 km: Carro
# - Menos de 50 km: bicicleta

# 2. Escolha do combustível quando usa o caroo:
# - Etanol: até 75% do preço da gasolina
# - GNV: até 60% do preço da gasolina
# - Caso contrário: Gasolina

# Implemente os seguintes funções:
# 1- escolher_transporte(distancia), que retorna o meio de transporte ideal com base na distância:

escolher_transporte <- function(distancia) {
  # Verificar a distãncia e escolher o meio de transporte
  if (distancia > 500) {
    transporte <- "Avião"
  } else if (distancia >= 50 && distancia <= 500) {
    transporte <- "Carro"
  } else if (distancia < 50) {
    transporte <- "Bicicleta"
  } else {
    stop("Distância inválida. Por favor, forneça um valor numérico positivo.")
  }
  return(transporte)
}

# escolher_combustivel(preco_gasolina, preco_etanol, preco_gnv), que retorne o combustível ideial baseado nos preços atuais:

escolher_combustivel <- function(preco_gasolina, preco_etanol, preco_gnv) {
  # Verifica os preços e calcula as condiç~oes
  if (preco_etanol <= 0.75 * preco_gasolina) {
    combustivel <- "Etanol"
  } else if (preco_gnv <= 0.60 * preco_gasolina) {
    combustivel <- "GNV"
  } else {
    combustivel <- "Gasolina"
  }
  return(combustivel)
}


# 3- Utilize as funções para responder:
# Qual transposte e combustível o indivíduo deve escolher para ir:
# A Florianópolis (750km)

distancia <- 750
transporte_ideal <- escolher_transporte(distancia)
cat("O transporte ideal para", distancia, "km é:", transporte_ideal, "\n")
preco_gasolina <- 5.00
preco_etanol <- 3.50
preco_gnv <- 2.80
combustivel_ideal <- escolher_combustivel(preco_gasolina, preco_etanol, preco_gnv)
cat("O combustivel ideal é:", combustivel_ideal, "\n")
# Resposta: Transporte ideal para 750 km é: Avião, combustível ideal é: Etanol;

# A Natal(3.000km):

