# Lista 3



# Exercícios sobre Matrizes:

# Criando uma matriz a, 3 x3:

matriz_A <- matrix(c(2, 96, 49, 35, 2, 100, 42, 43, 92), nrow = 3, ncol = 3)
print(matriz_A)

# Calculando a soma dos elementos de cada coluna da matriz_A:

colSums(matriz_A)

# Calculando a média dos elementos de cada linha da matriz_A:

rowMeans(matriz_A)

# Encontrando a matriz transposta de matriz_A:

t(matriz_A)

# Multiplicando a matriz_A por 3:

matriz_A * 3

# Calculando o determinante da matriz_A:

det(matriz_A)

# Criando uma matriz identidade 4 x 4:

matriz_identidade <- diag(4)
print(matriz_identidade)

# Resolvendo um sistema de equações lineares utilizando uma matriz 3 x 3 e o método da inversa:

# Equação da matriz_A:

# 2x  +  35y + 42z = 0
# 96x +  2y = 23z = 0
# 49x + 100y + 92z = 0

matriz_B <- matriz_A
vetor <- c(0, 0, 0)

# Verificando se B é invertível:

if (det(matriz_B) != 0) {
  
  # Calculando a matriz inversa de B:
  invB <- solve(matriz_B)
  # solve = se eu tenho matriz_B * x = vetor, o solver encontra o vetor x que satisfaz essa equação.
  
  # Calculando a solução para x
   x <- invB %*% vetor
   
   # Imprimindo a solução:
   print(x)
} else {
  print("A matriz B não é invertível")
}

# Criando uma matriz 3 x 3 com números aleatórios e encontrando o maior valor nela:

matriz_C <- matrix(runif(3 * 3), nrow = 3, ncol = 3)
max(matriz_C)

# Substituindo todos os elementos negativos da matriz por zero:

matriz_C[matriz_C < 0] <- 0
print(matriz_C)



# Exercícios sobre Operações com matrizes:

# Criando duas matrizes de mesmo tamanho e somando-as:

matriz_D <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3, ncol = 3)
matriz_E <- matrix(c(9, 8, 7, 6, 5, 4, 3, 2, 1), nrow = 3, ncol = 3)
soma_matriz_D_E <- matriz_D + matriz_E
print(soma_matriz_D_E)

# Realizando a multiplicação elemento a elemento entre as duas matrizes criadas no exercícios anterior:

matriz_D %*% matriz_E

# Calculando o produto matricial entre a transposta de uma matriz e a matriz original:

matriz_transposta <- t(matriz_D)
matricial <- matriz_transposta %*% matriz_D
print(matricial)

#  Criando uma matriz diagonal 3 x 3 com números diferentes na diagonal principal:

matriz_F <- diag(c(1, 2, 3))
print(matriz_F)

# Calculando a soma de todos os elementos acima da diagonal principal da matriz_diagonal:

soma_diagonal <- sum(matriz_D[upper.tri(matriz_D)])
print(soma_diagonal)
# upper.tri = é utilizado para identificar ou extrair a parte triangular superior de uma matriz, ele retorna uma matriz lógica da mesma dimensão da matriz original. 

# Encontrando a média de todos os elementos da matriz_D:

media_matriz <- mean(matriz_D)
print(media_matriz)

# Criando uma matriz simétrica qualquer:

matriz_simetrica <- matrix(c(1, 2, 3, 2, 4, 5,3, 5, 6), nrow = 3, ncol = 3)
print(matriz_simetrica)

# Encontre os autovalores e aotovetores da matriz simétrica criada no exercício anterior:

autovalores <- eigen(matriz_simetrica)$values
autovetores <- eigen(matriz_simetrica)$vectors
print(autovalores)
print(autovetores)
# eigen = recebe uma matriz quadrada como entrada e retorna uma lista contendo os autovalores e autovetores da matriz.



# Exercícios sobre Arrays:

# Criando um array 3D com dimensões 3 x 3 x 3 com números inteiros de sua escolha:

array3d <- array(data = c(1, 2, 3, 4, 5, 6, 7, 8, 9), dim = c(3, 3, 3))
array3d

# Acesse o elemento que está na primeira linha, segunda coluna e primeira camada do array:

arrayelemento <- array3d[1, 2, 1]
arrayelemento

# Calcule a média dos elementos em cada camada do array 3D:

medias_camadas <- apply(array3d,MARGIN = 3, FUN = mean)
medias_camadas

# Substitua todos os elementos negativos do array por zero:

arraynegativo <- array3d[array3d < 0] <- 0
arraynegativo

# Encontre o valor máximo presente no array: 

max_valor <- max(array3d)
max_valor



# Manipulação de listas e data frames:

# Criando uma lista (L) contendo três vetores: nomes, idades e salários:

nomes <- c("Stefany", "Gabriel", "Leonardo", "Vitor")
idades <- c(20, 25, 26, 19)
salarios <- c(5000, 4000, 3500, 3450)

# Criando uma lista com os vetores:
lista <- list(Nomes = nomes, Idades = idades,  Salários = salarios)
print(lista)

# Convertendo essa lista em um data frame:

data <- data.frame(lista)
print(data)

# Adicionando uma nova coluna chamada gênero ao data frame:

data$genero <- c("F", "M", "M", "M")
print(data)

# Removendo a coluna idades do data frame:

data2 <- data
data2$Idades <- NULL
print(data2)

# Acessando o segundo elemento da lista original (L):

data[ , 2]

# Criando uma nova lista de pessoas com informações adicionais e combinandoas ao data frame original:

novas_pessoas <- data.frame(Nomes = c("Maria", "João", "Ana", "Thiago"), Idades = c(18, 28, 30, 22), Salários = c(3300, 700, 5500, 4000), genero = c("F", "M", "F", "M"))

# Adicionando as novas pessoas ao data frame existente:
data3 <- rbind(data, novas_pessoas)
print(data3)

# Aninhando uma lista dentro da lista original para armazenar informações de endereço (rua, cidade, país) para cada pessoa:

# Aninhando listas:
endereço <- list(Rua = c("rua1", "rua2", "rua3", "rua4"), Numero = c(1, 2, 3, 4), Cidade = c("São Paulo", "Curitiba", "Rio de Janeiro", "Bahia"))
lista$endereço <- endereço
print(lista)

# Acessando o número da casa da primeira pessoa no data frame:

data4[1, 5]
# Para acessar qualquer tipo de informação no data frame, sempre colocamos o número da linha da informação que queremos saber, e logo em seguida o número da coluna em que ela está.

# Criando um novo data frame contendo apenas as pessoas com salários acima de 5000:

salario_maior_que_5000 <- data3[data3$Salários > 5000, ]
print(salario_maior_que_5000)

# Ordenando o data frame pelo nome das pessoas em ordem alfabética:

ordem <- data3[order(data3$Nomes), ]
print(ordem)



# Manipulação de Fatores:

# Criando um vetor de fatores que represente diferentes níveis de escolaridade (fundamental, médio, superior):

grau_escolaridade <- factor(c("fundamental", "médio", "superior"))
print(grau_escolaridade)

# Convertendo o vetor de fatores para um vetor de strings:

vetor_string <- as.character(grau_escolaridade)
print(vetor_string)

# Criando um fator com níveis personalizados e aplicando-o a um vetor de idades:

q43 <- factor(c("fundamental", "médio", "superior"), levels = c("fundamental", "médio", "superior", "doutorado"))
print(q43)

# Ordenando os níveis do fator em ordem alfabética;

q43_alfabetica <- sort(q43)
print(q43_alfabetica)
# Sort = usado para organizar.

# Contando a frequência de cada nível do fator:

q43_frequencia <- table(q43)
print(q43_frequencia)



# Concatenação de Fatores com Strings:

# exemplos de fatores:
fator1 <- factor(c("A", "B", "C"))
fator2 <- factor(c("X", "Y", "Z"))

# Convertendo os fatores em strings usando as.character():
strings1 <- as.character(fator1)
strings2 <- as.character(fator2)

# Concatenando as strings com outros strings:
q44 <- paste(strings1, ",", strings2)
print(q44)

# Criando um vetor de strings que represente nomes de cidades:

nomes_cidades <- c("Bahia", "Paris", "Curitiba", "Gramado", "Joinvile")
print(nomes_cidades)

# Convertendo esse vetor em um fator:

fator_nomes_cidades <- factor(nomes_cidades)
print(fator_nomes_cidades)

# Vriando um novo vetor de strings representando países:

nomes_paises <- c("Brasil", "Itália", "Argentina", "Mexico", "Japão") 

# Concatene o fator de cidades com o vetor de países, separando-os por uma vírgula:

concatenaçao_cidade_pais <- paste(fator_nomes_cidades, ",", nomes_paises)
print(concatenaçao_cidade_pais)

# Convertendo o resultado da concatenação de volta para um vetor de strings:

resultado_strings <- strsplit(concatenaçao_cidade_pais, ",")
resultado_strings <- unlist(resultado_strings)
print(resultado_strings)



# Exercícios de Desafio:

# Crie uma lista de data frames, onde cada data frame representa dados de uma turma diferente:

# Criar data frames para turmas
turma1 <- data.frame(
  Aluno = c("Alice", "Bob", "Carol"),
  Nota = c(95, 88, 78)
)

turma2 <- data.frame(
  Aluno = c("David", "Eva", "Frank"),
  Nota = c(89, 92, 85)
)

turma3 <- data.frame(
  Aluno = c("Grace", "Hank", "Ivy"),
  Nota = c(76, 91, 83)
)

# Criar uma lista de data frames
lista_turmas <- list(turma1, turma2, turma3)

# Imprimir a lista de data frames
print(lista_turmas)

# Crie um fator a partir de um vetor lógico representando aprovação ou reprovação:

# Criar um vetor lógico representando aprovação (TRUE) e reprovação (FALSE)
aprovacao_reprovacao <- c(TRUE, FALSE, TRUE, FALSE, TRUE)

# Converter o vetor lógico em um fator
fator_aprovacao <- factor(aprovacao_reprovacao, levels = c(FALSE, TRUE), labels = c("Reprovado", "Aprovado"))

# Imprimir o fator
print(fator_aprovacao)

# Concatene o fator de aprovação com um vetor de notas como strings:

# Criar um fator de aprovação
fator_aprovacao <- factor(c("Reprovado", "Aprovado", "Reprovado", "Aprovado", "Aprovado"))

# Criar um vetor de notas como strings
notas <- c("85", "92", "78", "95", "89")

# Converter o fator de aprovação em um vetor de strings
strings_aprovacao <- as.character(fator_aprovacao)

# Concatenar o fator de aprovação com as notas
resultado <- paste(strings_aprovacao, notas, sep = ": ")

# Imprimir o resultado
print(resultado)

# Crie um data frame a partir do resultado da concatenação, com colunas “Resultado” e “Nota”:

# Resultado da concatenação
resultado <- c("Reprovado: 85", "Aprovado: 92", "Reprovado: 78", "Aprovado: 95", "Aprovado: 89")

# Separar o resultado em colunas "Resultado" e "Nota" usando strsplit
resultado_separado <- strsplit(resultado, ": ")

# Criar o data frame
data_frame_resultado <- data.frame(
  Resultado = sapply(resultado_separado, "[[", 1),
  Nota = as.numeric(sapply(resultado_separado, "[[", 2))
)
# sapply = tenta simplificar o resultado.
# lapply = seempre retorna uma lista.

# Imprimir o data frame
print(data_frame_resultado)

# Aninhe um data frame dentro de outro data frame, representando informações detalhadas sobre cada pessoa:

# Criar um data frame com informações gerais sobre as pessoas
info_pessoas <- data.frame(
  Nome = c("Alice", "Bob", "Carol"),
  Idade = c(25, 30, 28)
)

# Criar um data frame aninhado com informações detalhadas
info_detalhadas <- list(
  data.frame(
    Nome = "Alice",
    Endereco = "123 Main St",
    Telefone = "555-1234"
  ),
  data.frame(
    Nome = "Bob",
    Endereco = "456 Elm St",
    Telefone = "555-5678"
  ),
  data.frame(
    Nome = "Carol",
    Endereco = "789 Oak St",
    Telefone = "555-9876"
  )
)

# Adicionar o data frame aninhado ao data frame principal
info_pessoas$InfoDetalhada <- info_detalhadas

# Imprimir o data frame principal
print(info_pessoas)