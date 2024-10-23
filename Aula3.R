#---------Exercícios Aritmérica---------
(32 / 2) + 2
((3^2) * 5) + 2
2 + (5 * (3^2))
(39 - (4^2)) / 5
(39 - (4^2)) / (5 * 6)
((39 - (4^2)) / 5) * 6
1 - ((20 / 20) * (19 / 20) * (18 / 20) * (17 / 20) * (16 / 20))
exp(sum(log((16:20)/20)))
exp(sum(log(16:20)) - 5*log(20))
exp(-2) * 2^3/factorial(3)


#Criar vetores:

A <- c(12, 14, 16, 11, 12, 18, 15, 12, 15)
B <- c(3, 7, 11, 15, 19, 23)
C <- c(1, 2, 4, 7, 11, 16, 22, 29, 37, 46, 56, 67)

#Quantos valores únicos há em A?

unique(A)
names(table(A))
A[!duplicated(A)]

#Quais os valores em A maiores que 13?

length(unique(A))
A[A > 13]
sum(A > 13)

#Qual o resultado em somar o vetor em B com em C?

B + C

#Quantos são os valores de A são divisíveis por 3? Quais são eles?

