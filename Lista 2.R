# Lista 2

# Atribuição de Variáveis:

idade <- 25
nome <- "Maria"
notas <- c(8, 9, 7, 6)
frutas <- c("maçã", "banan", "laranja")
idades <- c(30, 40, 50)
vetor_logico <- c(TRUE, FALSE, TRUE)
vetor_1_a_10 <- c(1:10)

# Crie um vetor chamado alturas com 100 alturas, variando de 1.50 a 2.00.

alturas <- seq(from = 1.50, to = 2.00, length.out = 100)

# seq = sequencia.
# from = define o início da sequência.
# to = define o final da sequência.
# length.out = especifica o número de elementos da sequência.

# Criando um vetor com os números pares de 2 a 200:

vetor_par_2_a_200 <- seq(from = 2, to = 200, by = 2)

# by = incrementa a sequência em 2 unidades, gerando apenas números pares.

# Criando um vetor com cinco repetições dos números pares de 1 a 10.

vetor_numeros_pares_repetidos <- rep(seq(2, 10, by = 2), times = 5)

# rep(... , times = 5) = repete o vetor cinco vezes.

# Criando um vetor chamado pesos com 100 pesos, seguindo uma distribuição normal com média 70 e desvio padrão 10:

pesos <- rnorm( n = 100, mean = 70, sd = 10)

# n = especifica que queremos 100 valores.
# mean = define a média da distribuição.
# sd = define o desvio padrão da distribuição.

# Criando um vetor chamado notas com 100 notas, com uma distribuição normal, média 7 e desvio padrão 1:

notas_distribuiçao_normal <-rnorm(n = 100, mean = 7, sd = 1)

# Criando um vetor de números inteiros de 1 a 100 gerados a partir de uma distrbuição uniforme:

vetor_distribuiçao_uniforme <- floor(runif(100, min = 1, max = 101))

# floor = arredonda cada número para o menor inteiro mais próximo.
# transformando assim os valores contínuos em inteiros entre 1 a 100.
# runif(100) = gera 100 números aleatórios de uma distribuição uniforme contínua.
# variando entre 1 e 101. 
# Colocamos max = 101 para garantir que o valor máximo 100 possa ser incluído após a arredondamento.

# Simulando uma jogada de loteria criando um vetor com 6 números inteiroa aleatórios de 1 a 60:

jogada_loteria <- sample(1:60, size = 6, replace = FALSE)

# sample = gera uma amostra de valores sem reposição. 
# 1:60 = define o intervalo dos números possíveis de 1 a 60. 
# size = especifica que queremos selecionar 6 números. 
# replace = FALSE = garante que a amostra seja sem reposição.



# Operações Aritméticas;

idade_mul_2 <- (idade * 2)

# Calculando a média dos valores do vetor notas:

mean(notas)

# Resultado 7.5

# Elevando os valores do vetor idades ao quadrado:

idades_ao_quadrado <- (idades^2)

# Realizando a divisão inteira de 15 por 4:

divisao_inteira <- 15 %% 4

# calculando o resto da divisão de 15 por 4:

resto_divisao <- 15 %% 4



# Operações lógicas e condicionais:

# verificando se a variável idade é maior que 18:

idade > 18

# Determinando se o primeiro elemento do vetor notas é igual a 8:

notas[1] == 8

# Verificando se algum valor do vetor idades é menos que 35:

idades_menor_que <-  idades < 35

# Ou

idades < 35

# Selecionando as alturas menores que 1.85 do vetor altura:

alturas[alturas < 1.85]

# Selecionando os pesos maiores que 80 do vetor pesos:

pesos[pesos > 80]

# Contando quantos valores no vetor notas são maiores que 7:

sum(notas > 7)




# Funções matemáticas:

# Calculando a raiz quadrada de 16:

sqrt(16)

## Arredondando o valor 3.78 para o inteiro mais próximo:

ceiling(3.78)

# Arredondando para cima os valores do vetor alturas:

ceiling(alturas)

# Arredondando para baixo o vetor de alturas:

floor(alturas)

# Calculando o valor absoluto da diferença entre 10 e 7;

abs(10 - 7)



# Vetores nomeados:

# Criando um vetor chamado salarios e nomeando os elementos:

salarios <- c(2000, 3000, 1500, 4000)
names(salarios) <- c("joão", "Maria", "Carlos", "Ana")

print(salarios)

# Acessando o valor do salário de "Maria" no vetor salarios:

salarios["Maria"]

# Atualizando o salário de "Carlos" para 1800:

salarios["Carlos"] <- 1800

print(salarios)

# Adicionando um novo elemento ao vetor salarios com o nome "Paulo" e o salário 2500:

salarios["Paulo"] <- 2500

print(salarios)

# Removendo o salário de "Ana" do vetor salários:

salarios <- salarios[!names(salarios) %in% "Ana"]

print(salarios)

# Verificando se existe algum elemento no vetor salarios com o valor superior a 3500:

salarios > 3500

# Ordenando os salarios em ordem crescente e mantendo os nomes associados aos valores:

salarios[order(salarios)]

# Criando um vetor de notas nomeado, onde os nomes dãoo "Pedro", "Lucas" e "Carla", e as notas são 8, 8, e 9, respectivamente:

notas_nomeadas <- c(8, 7, 9)
names(notas_nomeadas) <- c("Pedro", "Lucas", "Carla")
print(notas_nomeadas)

# Selecionando as notas dos alunos "Pedro" e "Carla" do vetor de notas nomeado:

notas_nomeadas[c("Pedro", "Carla")]

# Calculando a média das notas dos alunos no vetor nomeado:

mean(notas_nomeadas)



# Manipulação de Strings:

# Criando uma string com o texto "Análise de Dados":

string_1 <- "Análise de Dados"

# Extraindo os primeiros 5 caracteres da string_1:

substr(x = string_1[1], start = 1, stop = 5)

# Convertendo a string_1 #R é uma linguagem de programação" para maiúsculo:

string_2 <- "R é uma linguagem de programação"
toupper(string_2)

# Convertendo para minúsculo:

tolower(string_2)

# Substituindo a palavra "linguagem" por "software" na string_2:

string_3 <- gsub(pattern = "linguagem", replacement = "software", x = string_2)
print(string_3)



# Expressões regulares:

# Encontrando todos os dígitos na string "Texto1234":

string_4 <- "Texto1234"
regmatches(string_4, gregexpr("\\d", string_4, perl = TRUE))

# Extraindo as palavrass que começam com a letra "C" na string "Casa, carro, frutas, animais e cidade":

library(stringr)
string_5 <- c("Casa", "carro", "frutas", "animais", "cidade")
palavras_c <- str_subset(string_5, pattern = "^(?![cC])")
print(palavras_c)
