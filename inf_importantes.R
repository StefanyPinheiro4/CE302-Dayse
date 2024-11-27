library(usethis)
use_git_config(user.name = "StefanyPinheiro4", 
               user.email = "stefany.pinheiro@ufpr.br")
usethis::create_github_token()
gitcreds::gitcreds_set()
?mean
help("mean")
vignette("ggplot2")
meu_nome_eh_stefany <- 0
x <- 0
X <- 10
y <- X +
  x
if <- 0
else <- 10
#NÃO FAZER

rm(meu_nome_eh_stefany)
ls()


# Sistema de arredondamento, importante para a prova:
round(pi, digits = 2) # Arredondamento
ceiling(pi) # Teto
floor(pi) # Piso
trunc(pi) # Truncamento
