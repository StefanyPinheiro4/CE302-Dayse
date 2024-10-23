#Aula 09/10/2024

library(tidyverse)

library(tidyverse)

dados <- readr::read_csv("~/Downloads/Mental Health Dataset.csv")

(dados)

class(dados)

dados

glimpse(dados)

Poland <- subset(dados, Country == "Poland")

Colunas <- dados[,c("Country", "Gender")]

#Pipe

x <- seq(1:10)
y <- sqrt(x)
z <- log(y)

tan(
  cos(
  log(
  sqrt(x))))

# \>

x %>% 
  sqrt() %>%
  log() %>% 
  cos() %>% 
  tan()


  
require(magrittr)
  set.seed(123)

rnorm(10)    %>%
  multiply_by(5) %>%
  add(5)       

rnorm(10) * 5 + 5

require(dplyr)
## Atribuição explicita
meu_data_frame <- data.frame(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta'))

meu_data_frame = meu_data_frame %>%
  mutate(idade_25 = idade > 25)

glimpse(meu_data_frame)

meu_data_frame = meu_data_frame %>% 
  mutate(idade_25 = idade > 25)

meu_data_frame %<>%
  mutate(idade_50 = idade > 50) %>% 
  mutate(idade_30 = idade > 30)



glimpse(meu_data_frame)


require(dplyr)
require(tidyr)
require(readr)
help(fread)
car_crash = readr::read_csv("/home/est/sp22/Downloads/Brazil Total highway crashes 2010 - 2023.csv")
head(car_crash, 5)
car_crash
view(car_crash)
# Dados extraídos de https://www.kaggle.com/datasets/liamarguedas/brazil-total-highway-crashes-2010-2023

glimpse(car_crash)


car_crash %>% 
  select(data, tipo_de_acidente) %>% 
  head()

car_crash %>% 
  select(starts_with("tr")) %>% 
  head()

car_crash %>% 
  select(ends_with("feridos"))


car_crash %>% 
  select(contains("_"))

car_crash %>% 
  select(where(is.numeric)) %>% 
  glimpse()

vars_interesse = c("automovel", "bicicleta", "onibus")
car_crash %>% 
  select(all_of(vars_interesse)) %>% 
  glimpse()

car_crash %>% 
  select(automovel, bicicleta, onibus)

car_crash %>% 
  select(all_of(vars_interesse))

car_crash %>% 
  select(any_of(vars_interesse)) %>% 
  glimpse()

