search()
find ("women")
find("CO2")
#usa-se "" quando você quer passar o nome do objeto, e usa-se () quando você quer passar o conteúdo do objeto.
X <- C(1, 1, 2, 3, 5, 8, 13, 21)
ls()
str(x)
x <- c(1, 1, 2, 3, 5, 8, 13, 21)
lsx(x)
ls(x)
x[6]
typeof(x)
rm(x)
x[-6]
x[-6]
str(x)
x[1:3]
1:3
x[-(1:3)]
length(X)
X[3:1]       
X[c(1, 8)]
seq()
#quando clica-se F1, em qualquer comando, vai para a aba de sequence generation.

seq(from = 2, to = length(X), by = 2)
i <- seq(from = 2, to = length(X), by = 2)
X[i]

x[c(TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, RUE)]


X > 10
X[X > 10]

#!= diferente = igual <= maior igual >= menor igual.

X <= 10
X >= 10

X <= 10 & X >= 5

X[X <= 10 & X >= 5]
10%% 3 #resto da divisão.
10 %/% 3 # Parte inteira da divisão.
notas <- c("John" = 4, "Paul" = 6, "Bob" = 10)
str(notas)
notas["john"]
notas[c("John", "Bob")]
notas["Bob"] <- 8
notas
X[length(X)] + X[length(X) - 1]
append(X, values = X[length(X)] + X[length(X) - 1])
X <- append(X, values = X[length(X)] + X[length(X) - 1])
X
(1 + sqrt(5))/2
X[2]/X[1]
X[3]/X[2]
X[19]/X[18]
X[-1]/X[-length(X)]

#O comando "for", tentamos sempre evitar de usar.
