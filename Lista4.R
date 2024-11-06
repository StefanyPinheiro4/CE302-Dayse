# Lista 4

# Utilizando o banco de dados queimadas, crie uma tabela com a contagem de incêndios por estado:
knitr::opts_chunk$set(echo = TRUE)
require(tibble)
require(magrittr)
require(dplyr)
data <- rbind(read.csv("C:\\Users\\Stefany\\Desktop\\Faculdade\\Estat.comp1\\Dataset_FireWatch_Brazil_Q1_2024.csv"), 
              read.csv("C:\\Users\\Stefany\\Desktop\\Faculdade\\Estat.comp1\\Dataset_FireWatch_Brazil_Q2_2024.csv"), 
              read.csv("C:\\Users\\Stefany\\Desktop\\Faculdade\\Estat.comp1\\Dataset_FireWatch_Brazil_Q3_2024.csv"))
head(data)

# Imprima na tela as 9 primeiras observações:
tail(data)
# Qual o número de queimadas por região?

norte <- c("ACRE","AMAPA","AMAZONAS","PARA","RONDONIA",
           "RORAIMA","TOCANTINS")
nordeste <- c("ALAGOAS","BAHIA","CEARA","MARANHAO",
              "PARAIBA","PERNAMBUCO","PIAUI",
              "RIO GRANDE DO NORTE","SERGIPE")
centro_oeste <- c("DISTRITO FEDERAL","GOIAS","MATO GROSSO",
                  "MATO GROSSO DO SUL")
sudeste <- c("ESPIRITO SANTO","MINAS GERAIS",
             "RIO DE JANEIRO","SAO PAULO")
sul <- c("PARANA","RIO GRANDE DO SUL","SANTA CATARINA")
regioes = list("norte" = norte, "nordeste" = nordeste,
               "centro oeste" = centro_oeste, "sudeste" = 
                 sudeste, "sul" = sul)

