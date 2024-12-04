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

distancia <- 3000
transporte_ideal <- escolher_transporte(distancia)
cat("O transporte ideal para", distancia, "km é:", transporte_ideal, "\n")
combustivel_ideal <- escolher_combustivel(preco_gasolina, preco_etanol, preco_gnv)
cat("O combustivel ideal é:", combustivel_ideal, "\n")
# Resposta: Transporte ideal para 3000 km é: Avião, combustivel ideal é: Etanol;


# A Araucária (25 km):

distancia <- 25
transporte_ideal <- escolher_transporte(distancia)
cat("O transporte ideal para", distancia, "km é:", transporte_ideal, "\n")
combustivel_ideal <- escolher_combustivel(preco_gasolina, preco_etanol, preco_gnv)
cat("O combustivel ideal é:", combustivel_ideal, "\n")
# Resposta: Transporte ideal para 25 km é: Bicicleta, combustivel ideal é: Etanol;




# Questão 4:
# Crie uma matriz (M) (10\ times 10) preenchida com números aleatórios entre 1 e 100. Desenvolva as seguintes funções para manipular a matriz:
# 1. soma_linha(matriz, linha) - Calcula a soma dos elementos de uma linha específica.

M <- matrix(sample(1:100, 100, replace = TRUE), nrow = 10, ncol = 10)

soma_linha <- function(matriz, linha) {
  if (linha < 1 || linha > nrow(matriz)) stop("Linha fora do intervalo!")
  return(sum(matriz[linha, ]))
}

# 2. sima_coluna(matriz, coluna) - Calcula a soma dos elementos de uma coluna específica.

soma_coluna <- function(matriz, coluna) {
  if (coluna < 1 || coluna > ncol(matriz)) stop("Coluna fora do intervalo!")
  return(sum(matriz[ ,coluna]))
}

# 3. diagonal_principal(matriz) - Retorna os elementos da diagonal principal.

diagonal_principal <- function(matriz) {
  return(diag(matriz))
}

# 4. diagonal_secundaria(amtriz) - Retorna os elementos da diagonal secundária.

diagonal_secundaria <- function(matriz) {
  return(matriz[row(matriz) + col(matriz) == nrow(matriz) + 1])
}

# TEste todas as funções percorrendo a matriz. Mostre:
# Asoma dos elementos de cada linha:
print(soma_linha(M, 1))
# 579
print(soma_linha(M, 2))
#407
print(soma_linha(M, 3))
#373
print(soma_linha(M, 4))
# 548
print(soma_linha(M, 5))
# 517
print(soma_linha(M, 6))
# 594
print(soma_linha(M, 7))
# 515
print(soma_linha(M, 8))
# 543
print(soma_linha(M, 9))
# 475
print(soma_linha(M, 10))
# 280

# A soma dos elementos de cada coluna:
print(soma_coluna(M, 1))
#465
print(soma_coluna(M, 2))
# 309
print(soma_coluna(M, 3))
# 430
print(soma_coluna(M, 4))
# 444
print(soma_coluna(M, 5))
# 572
print(soma_coluna(M, 6))
# 607
print(soma_coluna(M, 7))
# 464
print(soma_coluna(M, 8))
# 532
print(soma_coluna(M, 9))
# 487
print(soma_coluna(M, 10))
# 521

# Os elementos da diagonal principal e secundária:
print(diagonal_principal(M))
# 96 30 3 20 92 96 38 16 88 30
print(diagonal_secundaria(M))
# 30 60 85 57 80 59 34 32 12 78
print(M)


# Questão 5:
# Implemente um programa para determinar se uma matriz é simétrica. Para isso:
# 1. Crie a função verificar_simetria(matriz) que receba uma matriz quadrada e retorne se ela é simétrica ou não.
verificar_simetria <- function(matriz) {
  # Verificar se a matriz é quadrada
  if (nrow(matriz) != ncol(matriz)) {
    stop("A matriz não é quadrada!")
  }
  # Comparar a matriz com sua transposta
  if (all(matriz == t(matriz))) {
    return(TRUE) # Simétrica
  } else {
    return(FALSE) # Não simétrica
  }
}

# 2, Preencha a matriz com valores aleatórios e verifique sua simetria:

matriz_simetrica <- matrix(c(1, 2, 3,
                             2, 4, 5,
                             3, 5, 6), nrow = 3, byrow = TRUE)
matriz_nao_simetrica <- matrix(c(1, 2, 3,
                                 4, 5, 6,
                                 7, 8, 9), nrow = 3, byrow = TRUE)
print(verificar_simetria(matriz_simetrica))
# TRUE
print(verificar_simetria(matriz_nao_simetrica))
# FALSE

# Questão 6:
# Implemente um programa para calcular as seguintes operações sobre uma matriz de números inteiros (M)(5\times 5):
# 1. maior_valor(matriz) -  Retorna o maior valor contido na matriz.

maior_valor <- function(matriz) {
  return(max(matriz))
}

# 2. menor_valor(matriz) - Retorna o menos valor contido na matriz.

menor_valor <- function(matriz) {
  return(min(matriz))
}

# 3. media_geral(matriz) - retorna a média arimética de todos os elementos da matrriz.

media_geral <- function(matriz) {
  return(mean(matriz))
}

# 4. Aplique as funções sobre a matriz e exiba os resultados.
print(maior_valor(M))
# 98
print(menor_valor(M))
# 1
print(media_geral(M))
# 48.31


# Questão 7:
# Dado um vetor (V) contendo 100 elementos aleatórios entre 1 e 1.000:
V <- sample(1:100, 100, replace = TRUE)
# 1. Crie uma função par_impar(vetor) que retorne dois vetores: um contendo apenas os números pares e outro com os números ímpares.
par_impar <- function(vetor) {
  pares <- vetor[vetor %% 2 == 0]
  impares <- vetor[vetor %% 2 != 0]
  return(list(pares = pares, impares = impares))
}

# 2. Aplique a função sobre (V) e calcule a média dos elementos pares e ímpares separadamente:
resultado <- par_impar(V)
media_pares <- mean(resultado$pares)
media_impares <- mean(resultado$impares)
print(V)
print(resultado)
print(media_pares)
# 47.67857
print(media_impares)
# 52.5


# Questão 8:
# Dada uma matriz (N) (6\times 6), implemente um programa para encontrar:
# 1. A soma dos elementos acima da diagonal principal.
N <- matrix(sample(1:50, 36, replace = TRUE), nrow = 6, ncol = 6)
soma_acima_diagonal <- function(matriz) {
  if (nrow(matriz) != ncol(matriz)) {
    stop("A matriz não é quadrada!")
  }
  elementos <- matriz[row(matriz) < col(matriz)]
  return(sum(elementos))
}

# 2. A soma dos elementos abaixo da diagonal principal.
soma_abaixo_diagonal <- function(matriz) {
  if (nrow(matriz) != ncol(matriz)) {
    stop("A matriz não é quadrada")
  }
  elementos <- matriz[row(matriz) > col(matriz)]
  return(sum(elementos))
}

# 3. Implemente as funções e aplique sobre a matriz N.
print(soma_acima_diagonal(N))
# 352
print(soma_abaixo_diagonal(N))
# 388


# Questão 9:
# 1. Crie uma função que calcule o fatirial de um número (n):
calcular_fatorial <- function(fatorial) {
  return(factorial(fatorial))
}
n <- c(4)
print(calcular_fatorial(n))
# 24

# 2. Crie uma função que dado um números, retorna o número primo mais próximo.
e_primo <- function(n) {
  if (n <= 1) return(FALSE)
  for (i in 2:sqrt(n)) {
    if (n %% i == 0) return(FALSE)
  }
  return(TRUE)
}
primo_proximo <- function(n) {
  if (e_primo(n)) {
    return(n)
  }
  menor_primo <- n - 1
  maior_primo <- n + 1
  while (TRUE) {
    if (e_primo(menor_primo)) {
      return(menor_primo)
    }
    if (e_primo(maior_primo)) {
      return(maior_primo)
    }
    menor_primo <- menor_primo - 1
    maior_primo <- maior_primo + 1
  }
}
print(primo_proximo(n))
# 3

# 3. Crie uma função que dado um número, retorna o número quadrado perfeito mais próximo.

perfeito_quadrado <- function(n) {
  raiz <- sqrt(n)
  return(raiz == floor(raiz))
}

quadrado_perfeito_proximo <-  function(n) {
  if (perfeito_quadrado(n)) {
    return(n)
  }
  menor_quadrado <- floor(sqrt(n))^2
  maior_quadrado <- (floor(sqrt(n)) + 1)^2
  if (abs(n - menor_quadrado) <= abs(n - maior_quadrado)) {
    return(menor_quadrado)
  } else {
    return(maior_quadrado)
  }
}
n <- c(10)
print(quadrado_perfeito_proximo(n))
# 9

# 4. Crie uma função que dado um número, retorna o resto da divisão por 3.
resto_divisaor_3 <- function(n) {
  return(n %% 3)
} 
print(resto_divisaor_3(n))
# 1

# 5. Varra uma matriz d e20x20 com números aleatórios entre 1 e 1000 e aplique as funções criadas sobre cada elemento da matriz segundo as seguintes regras:
# - Se o número for par e menor do que 10, aplique a função do fatorial;
# - Se o número for ímpar, aplique a função do número primo mais próximo;
# - Se o número for maior de que 10 e menor do que 100, aplique a função do número quadrado perfeito mais próximo;
# - Se o número for maior do que 100, aplique a função do resto da divisão por 3;
# - retorne 0 caso contrário;

processar_matriz <- function(matriz) {
  resultado <- matriz
  for (i in 1:nrow(matriz)) {
    for (j in 1:ncol(matriz)) {
      numero <- matriz[i, j]
      if (numero %% 2 == 0 && numero < 10) {
        resultado[i, j] <- calcular_fatorial(numero)
      } else if (numero %% 2 != 0) {
        resultado[i, j] <- primo_proximo(numero)
      } else if (numero > 10 && numero < 100) {
        resultado[i, j] <- quadrado_perfeito_proximo(numero)
      } else if (numero > 100) {
        resultado[i, j] <- resto_divisaor_3(numero)
      } else {
        resultado[i, j] <- 0
      }
    }
  }
  return(resultado)
}

matriz_para_processar <- matrix(sample(1:1000, 400, replace = TRUE), nrow = 20, ncol = 20)
print(matriz_para_processar)
print(processar_matriz(matriz_para_processar))

