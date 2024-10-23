# Criando vetores com valores aleatórios:
runif(10)
runif(10, min = 0, max = 100)
set.seed(123)
runif(10)

## Gerando valores de uma normal:
rnorm(n = 10)
rnorm(n = 10, mean = 6, sd = 10)

rpois(n = 10, labda = 2)
rpois(10,2)
rpois(lambda = 2, n = 10)

x <-  c("Thiago", "Alex", "Lucas")
x
sample(x)
sample(x, size = 2)
sample(x, size = 10, replace = TRUE)

y <- rnorm(100)
sample(y)
sample(y, size = 2)

# Comparação entre vetores
vetor1 <- c(1, 2, 6, 7)
vetor2 <- c(4, 5, 6, 2)

# Igualdade
vetores_iguais <- vetor1 == vetor2  
vetores_iguais

# Diferença
vetores_diferentes <- vetor1 != vetor2
vetores_diferentes

# Maior que
vetores_maior_que <- vetor1 > vetor2
vetores_maior_que

# Menor que
vetores_menor_que <- vetor1 < vetor2
vetores_menor_que

# Maior ou igual
vetores_maior_ou_igual_a <- vetor1 >= vetor2
vetores_maior_ou_igual_a

# Menor ou igual
vetores_menor_ou_igual_a <- vetor1 <= vetor2
vetores_menor_ou_igual_a

alturas <- c("João" = 1.82, 
             "Bianca" = 1.68,
             "Carlos" = 1.75, 
             "Ana" = 1.70)


# Seleciona o primeiro elemento
alturas[1]
alturas["João"]
alturas[1:3]
alturas[c(1,4)]

# Seleciona até o terceiro elemento
alturas[1:3]

# Seleciona elementos 1, 3 e 4
alturas[c(1, 3, 4)]

# remove o segundo elemento
alturas[-2]

# Seleciona alturas maiores que 1.70
mascara_logica <- alturas > 1.70
alturas[mascara_logica]
alturas[alturas > 1.70]

alturas

# Modifica a altura de João
alturas["João"] <- 1.85
alturas

# Atribui altura desconhecida a Bianca
alturas["Bianca"] <- NA
alturas

# Remove a altura de Carlos
alturas = alturas[-3]

# Adiciona a altura de Ivete
alturas <- append(alturas, 
             value = c("Ivete" = 1.60),
             after = 0)
             

#Substituir a altura de Bianca pela média:
media_alturas <- mean(alturas, na.rm = TRUE)
alturas[is.na(alturas)] <- media_alturas

alturas

alturas <- alturas[!names(alturas) == "Ivete"]

order(alturas)[names(alturas) == "Ivete"]

unique(alturas)


### Ordenando por ordem alfabetica:
nomes = names(alturas)
nomes[order(nomes)]
alturas[order(nomes)]

#Ordem de execução:
b
b <- 5
b

c <-  b + 5 


invisible(x + 3)

print(c)

print(vetor1)

dados <- c(10, 15, 20, 25, 30)
soma <- sum(dados)
media <- mean(dados)
mediana <- median(dados)
valor_maximo <- max(dados)
valor_minimo <- min(dados)
raiz_quadrada <- sqrt(25)
vetor3 = c(4,7,2,4,1,5)
length(vetor3)
sort(vetor3)
rev(vetor3)
unique(vetor3)
dados <- c(5, 2, 8, 3, 2)
dados
tamanho <- length(dados)
tamanho
dados_ordenados <- sort(dados)
dados_ordenados
dados_invertidos <- rev(dados)
dados_invertidos
dados_unicos <- unique(dados)
dados_unicos

y <- c(7, 5, 2, 2, 4, 8, 
       5, 2, 6, 4, 5, 10, 
       3, 2, 6, 10, 7, 8,
       6, 10, 3, 4, 5, 1)

# Número de elementos
length(y)

# Soma dos elementos
sum(y)

# Média
mean(y)

# Mediana
median(y)

# Máximo
max(y)

# Mínimo
min(y)

# Variância
var(y)

# Desvio padrão
sd(y)

# Desvio absoluto mediana
mad(y, constant = 1)

# Coeficiente de variação
100 * sd(y) / mean(y)

# Quartis
quantile(y)

# Amplitude Interquartilica
IQR(y)

# Tabela de Frequência
table(y)

# Funções para criação de gráficos:
vetor4 = c(1:100)
vetor5 = sqrt(vetor4)

plot(x = vetor4[1:50], 
     y = vetor5[1:50], 
     las = 1, 
     pch = 8,
     col = "red")
vetor_normal = rnorm(1000)
hist(vetor4, 
     las = 1)

x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 6, 8, 10)
plot(x, y, type = "b")  # Cria um gráfico de linhas e pontos

hist(x)  # Cria um histograma dos dados no vetor x

#Funções de Manipulação de Texto:
nomes = c("Maria", "Ana", "Rafaela")

paste(nomes[1], "e", nomes[2], "são minhas amigas.")

paste(nomes[1], nomes[2], nomes[3], sep = "_")
peste0(nomes[1], "e, nomes[2")

paste(nomes, collapse = "|")

toupper(nomes)

tolower(nomes)

substr(x = nomes[1], start = 1,stop = 3)

gsub(pattern = "G", 
     replacement = "R",
     x = "Gato")

getwd()

# Importar dados de um arquivo CSV
dados <- read.csv("dados.csv")

# Exportar um dataframe para um arquivo CSV
write.csv(dados, "dados_novos.csv")

# Listar conjuntos de dados integrados disponíveis no R
data()
 
# Carregar o conjunto de dados "iris" (conjunto de dados de flores iris)
data(iris)

# Exibir as primeiras linhas do conjunto de dados "iris"
head(iris)

# Exibir as últimas linhas do conjunto de dados "iris"
tail(iris)

# Exibir um resumo estatístico do conjunto de dados "iris"
summary(iris)

# Criando um vetor de números inteiros
vetor_inteiro <- c(2, 4, 6, 8, 10)

# Criando um vetor de números reais
vetor_real <- c(3.14, 1.618, 2.718, 3.48, 1.9)

# Criando um vetor de caracteres
vetor_caracteres <- c("maçã", "banana", "laranja")

# Criando um vetor misto
vetor_misto <- c(1, 2, "maçã", "banana", "laranja")


class(vetor_inteiro)

idades <- c(16, 21, 14, 30, 25, 45)
condicao1 <- idades > 18
condicao2 <- idades < 30
condicao_final <- condicao1 & condicao2
idades_selecionadas <- idades[condicao_final]
idades_selecionadas

## Também poderiamos incluir a condição 
## diretamente no vetor que queremos filtrar
idades_selecionadas <- idades[condicao_final]
idades_selecionadas <- idades[idades > 18 & idades < 30]

dados <- c(1, NA, 3, 4, NA)
dados_sem_na <- na.omit(dados)
dados_sem_na

dados_sem_na_exclude <- na.exclude(dados)
dados_sem_na_exclude

resultado <- 0 / 0
resultado
valor_nao_eh_numero <- is.nan(resultado)
valor_nao_eh_numero

### Matrizes:
vetor_a = c(1,2,3,4)
vetor_b = c(5,6,7,8)

matriz_linha = rbind(vetor_a, 
                     vetor_b)
matriz_linha

class(matriz_linha)

matriz_coluna= cbind(vetor_a, 
                     vetor_b)
matriz_coluna

class(matriz_coluna)

is.matrix(matriz_coluna)

A <- matrix(c(1:9), 
            ncol = 3,
            byrow = TRUE)
A

B <- matrix(c(1:9), 
            ncol = 3, 
            byrow = FALSE)
B

A <- matrix(c(2, -1, 3, 
              1, 4, 1, 
              5, -2, 7), 
            ncol = 3, 
            byrow = TRUE)
elemento_1_2 <- A[1, 2]  # Seleciona o elemento na primeira linha e segunda coluna 
elemento_1_2

elemento_3_3 <- A[3, 3]  # Seleciona o elemento na terceira linha e terceira coluna 
elemento_3_3

coluna_2 <- A[, 2]  # Seleciona a segunda coluna inteira 
coluna_2

linha_1 <- A[1, ]   # Seleciona a primeira linha inteira 
linha_1

## Exemplo 1: Seleção de Elementos Maiores que um Valor
B

elementos_maior_que_3 <- B[which(B > 3)]
elementos_maior_que_3

## Exemplo 3: Seleção de Elementos Negativos da Segunda Coluna
elementos_negativos_coluna_2 <- A[, 2][which(A[, 2] < 0)] 
elementos_negativos_coluna_2

## Exemplo 3: Seleção de Elementos Negativos da Segunda Coluna
elementos_negativos_coluna_2 <- A[, 2][which(A[, 2] < 0)] 
elementos_negativos_coluna_2

## Exenplo 4: Seleção de Elementos por Linha
elementos_linha_1_maior_que_2 <- B[1, which(B[1, ] > 2)]
elementos_linha_1_maior_que_2

A

A_sem_terceira_coluna <- A[, -3]  # Remove a terceira coluna da matriz
A_sem_terceira_coluna

A_sem_primeiras_duas_linhas <- A[-(1:2), ]  # Remove as duas primeiras linhas da matriz

A_sem_primeiras_duas_linhas

A_sem_linha_coluna <- A[-1, -2]  # Remove a primeira linha e segunda coluna

A_sem_linha_coluna

A <- matrix(c(4, -3, 7, 
              10, 1, 1, 
              -5, 2, 3), 
            ncol = 3, 
            byrow = TRUE)
A

dim(A) 

B <- matrix(c(2, -1, 3,
              1, 4, 1, 
              5, -2, 7), 
            ncol = 3, 
            byrow = TRUE)
B

dim(B)

soma <- A + B
soma

dim(soma)

subtracao <- A - B
subtracao

dim(subtracao)

k <- 2
A

multiplicacao_escalar <- k * A
multiplicacao_escalar

produto_elemento_a_elemento <- A * B
produto_elemento_a_elemento

produto_matricial <- A %*% B
produto_matricial

transposta_A <- t(A)
transposta_A

determinante_A <- det(A)
determinante_A

A
diagonal_A <- diag(A)
diagonal_A

autovalores_autovetores_A <- eigen(A) #Cria uma lista
autovalores_autovetores_A

produto_transposto <- crossprod(A, B)
produto_transposto

produto_transposto_t <- tcrossprod(A, B)
produto_transposto_t

rownames(A) <- c("Linha1", "Linha2", "Linha3")
colnames(A) <- c("Coluna1", "Coluna2", "Coluna3")

colnames(A) <- c("Coluna1", "Coluna2", "Coluna#")
A

rownames(A) <- c("Linha1", "Linha2", "linha3")

A

#Para pegar os elementos da parte superior da matriz triângular:
A <- matrix(1:9, nrow = 3)
upper_elements <- upper.tri(A)
upper_elements

A[upper_elements] <- 9
A

#Para matriz triaângular inferior:
lower_elements <- lower.tri(A, diag = T)
lower_elements
A[lower.tri(A)]
A[lower_elements] <- 9
A

# Arrays são estruturas multidimensionais (como um cubo mágico), criamos arrays assim:

# Criando um array 2x3x4
arr <- array(1:24, dim = c(2, 3, 4))
arr

elemento <- arr[2, 3, 4]
elemento

arr[, , 1]

# Tudo o que conseguimos fazer com matrizes, conseguimos fazer com arrays tabém:

# Criando dois arrays
arr1 <- array(1:12, dim = c(3, 2, 2))
arr2 <- array(13:24, dim = c(3, 2, 2))

# Soma de arrays
soma <- arr1 + arr2

# Produto element-wise
produto <- arr1 * arr2

# Média ao longo da terceira dimensão
media <- mean(arr1, dim = 3)

#Quase nunca os arrays são usados, então essa parte não é tão importante!





