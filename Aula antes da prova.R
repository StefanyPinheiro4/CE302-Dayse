# Entrega do trabalho dia 10/12; 23h59
# Entregar um relatório escrito de análises estatísicas, (entregar um gráfico e uma tabela não faz sentido), teste qui-quadrado, uma descritiva.
# Criar um aplicativo em shynne que tenha 5 abas que apresente algum tipo de análise e que seja interativo;
# Começar pelo relatório, quais são as análises que eu fiz aqui que eu vou querer que as pessoas vejam, o que fasz sentido colocar o que sobresaltou aos olhos;
# O relatório é sobre o banco de dados, de análises estatísticas;


# ggplot funciona por camadas;


require(magrittr)
require(tidyverse)
require(data.table)

getwd()
system("ls /home/est/sp22/Documentos")

files = system("ls /home/est/sp22/Documentos/archive", intern = TRUE)
files
filmes = list()
for(i in 1:length(files)){
  nome = gsub(x = files[i], 
              pattern = ".csv", 
              replacement = "")
  
  filmes[[i]] <- fread(paste0("/home/est/sp22/Documentos/archive/",  files[i])) %>% 
    mutate(tipo = nome)
  
  filmes[[i]]$year %<>% as.integer()
  filmes[[i]]$`gross(in $)` %<>% as.numeric()
  
}


# Inicia o dispositivo gráfico PDF e define o nome do arquivo
pdf("grafico.pdf")

# Cria o gráfico
plot(1:10, main="Exemplo de Gráfico", xlab="X", ylab="Y")

# Fecha o dispositivo gráfico e salva o arquivo
dev.off()


warning()

filmes %<>% bind_rows()

filmes %>% # Carregar o banco
  ggplot() + ## Chamar o ggplot
  aes( x = year, y = `gross(in $)`) + ## aplicar a estética, isto é, quais são as variáveis e o que elas significam, x e y, neste caso
  geom_point() # Fazer o scatterplot


filmes %>% 
  ggplot() +
  aes( x = year, 
       y = `gross(in $)`, 
       color = tipo) + ## Adicionamos cor
  geom_point()

filmes %>% 
  ggplot() +
  aes( x = year, 
       y = `gross(in $)`, 
       color = tipo) + 
  geom_point() + 
  theme_minimal() ## Incluímos tema

filmes %>% 
  ggplot() +
  aes( x = year, 
       y = `gross(in $)`, 
       color = tipo) + 
  geom_point() + 
  facet_wrap(vars(tipo)) + ## Fazemos o gráfico separado por tipo
  theme_minimal()


filmes %>% 
  filter(tipo %in% "animation") %>% 
  ggplot() +
  aes( x = year, 
       y = `gross(in $)`, 
       color = tipo, 
       size = rating) + 
  geom_point() + 
  theme_minimal()

filmes %>% 
  filter(tipo %in% "animation") %>% 
  ggplot() +
  aes( x = year, 
       y = `gross(in $)`, 
       color = tipo, 
       size = rating) + 
  geom_point() + 
  scale_size_continuous(range=c(0.01, 2)) + 
  theme_minimal()

filmes %>% 
  filter(tipo %in% "animation") %>% 
  ggplot() +
  aes( x = year, 
       y = `gross(in $)`, 
       color = tipo, 
       size = rating) + 
  geom_point() + 
  scale_size_continuous(range=c(0.01, 2)) + 
  labs(x = "Ano", 
       y = "Investimento ($)") + 
  theme_minimal()

filmes %>% 
  filter(tipo %in% "animation") %>% 
  ggplot() +
  aes( x = year, 
       y = `gross(in $)`, 
       color = tipo, 
       fill = tipo) + 
  geom_point() + 
  geom_smooth(method = "loess") + # O método aqui se refere ao método utilizado para estimação da curva
  scale_size_continuous(range=c(0.01, 2)) + 
  labs(x = "Ano", 
       y = "Investimento ($)") + 
  theme_minimal()

filmes %>% 
  group_by(year, tipo) %>% 
  summarise(Valor_Gasto_Medio = mean(`gross(in $)`, na.rm = TRUE)) %>%
  ggplot() +
  aes( x = year, 
       y = Valor_Gasto_Medio, 
       color = tipo) + 
  geom_line() + 
  facet_wrap(vars(tipo)) + 
  theme_minimal()

filmes %>% 
  group_by(year) %>% 
  summarise(Valor_Gasto_Medio = mean(`gross(in $)`, na.rm = TRUE)) %>%
  ggplot() +
  aes( x = year, 
       y = Valor_Gasto_Medio) + 
  geom_line(alpha = 0.2) + ## Alteramos a transparencia da linha
  geom_point() + ## Colocamos Pontos
  theme_minimal()

filmes %>% 
  group_by(year) %>% 
  summarise(Valor_Gasto_Medio = mean(`gross(in $)`, na.rm = TRUE)) %>%
  ggplot() +
  aes( x = year, 
       y = Valor_Gasto_Medio) + 
  geom_line(alpha = 0.2) + ## Alteramos a transparencia da linha
  geom_point() + ## Colocamos Pontos
  labs(x = "Ano de Lançamento", 
       y = "Investimento ($)", 
       title = "Gráfico do investimento médio em filmes por ano") + 
  theme_minimal()

filmes %>% 
  group_by(year) %>% 
  summarise(Valor_Gasto_Medio = mean(`gross(in $)`, na.rm = TRUE)) %>%
  ggplot() +
  aes( x = year, 
       y = Valor_Gasto_Medio) + 
  geom_line(alpha = 0.2) + 
  geom_point() + 
  labs(x = "Ano de Lançamento", 
       y = "Investimento ($)", 
       title = "Gráfico do investimento médio em filmes por ano") + 
  scale_y_continuous(labels = scales::label_dollar()) + 
  theme_minimal()

filmes %>% 
  group_by(year) %>% 
  summarise(Valor_Gasto_Medio = mean(`gross(in $)`, na.rm = TRUE)) %>%
  ggplot() +
  aes( x = year, 
       y = Valor_Gasto_Medio) + 
  geom_line(alpha = 0.2) + 
  geom_point() + 
  labs(x = "Ano de Lançamento", 
       y = "Investimento ($)", 
       title = "Gráfico do investimento médio em filmes por ano") + 
  scale_y_continuous(labels = scales::label_dollar()) + ## Alterando o label dos eixos y e x
  scale_x_continuous(breaks = seq(from = 1900, to = 2020, by = 10)) + 
  theme_minimal()

filmes %>% 
  group_by(year) %>% 
  summarise(Valor_Gasto_Medio = mean(`gross(in $)`, na.rm = TRUE)) %>%
  ggplot() +
  aes( x = year, 
       y = Valor_Gasto_Medio) + 
  geom_line(alpha = 0.2) + 
  geom_point() + 
  labs(x = "Ano de Lançamento", 
       y = "Investimento ($)", 
       title = "Gráfico do investimento médio em filmes por ano") + 
  scale_y_continuous(labels = scales::label_dollar()) +
  scale_x_continuous(breaks = seq(from = 1900, to = 2020, by = 10)) + 
  theme_minimal() +
  theme(text = element_text(size = 20, 
                            hjust = 0.5, 
                            face = "bold")) # tamanho da fonte

filmes %>% 
  group_by(year) %>% 
  summarise(Valor_Gasto_Medio = mean(`gross(in $)`, na.rm = TRUE), 
            n_filmes = n()) %>%
  ggplot() +
  aes( x = year, 
       y = Valor_Gasto_Medio) + 
  geom_line(alpha = 0.2) + 
  geom_point(aes(size = n_filmes)) + 
  labs(x = "Ano de Lançamento", 
       y = "Investimento ($)", 
       title = "Gráfico do investimento médio em filmes por ano") + 
  scale_y_continuous(labels = scales::label_dollar()) +
  scale_x_continuous(breaks = seq(from = 1900, to = 2020, by = 10)) + 
  theme_minimal() +
  theme(text = element_text(size = 20, 
                            hjust = 0.5, 
                            face = "bold")) # tamanho da fonte

filmes %>% 
  group_by(year) %>% 
  summarise(Valor_Gasto_Medio = mean(`gross(in $)`, na.rm = TRUE), 
            n_filmes = n()) %>%
  ggplot() +
  aes( x = year, 
       y = Valor_Gasto_Medio) + 
  geom_line(alpha = 0.2) + 
  geom_point(aes(size = n_filmes)) + 
  labs(x = "Ano de Lançamento", 
       y = "Investimento ($)", 
       title = "Gráfico do investimento médio em filmes por ano") + 
  scale_y_continuous(labels = scales::label_dollar()) +
  scale_x_continuous(breaks = seq(from = 1900, to = 2020, by = 10)) + 
  scale_size_continuous(range = c(0.1, 10)) + 
  theme_minimal() +
  theme(text = element_text(size = 20, 
                            hjust = 0.5, 
                            face = "bold")) # tamanho da fonte

filmes %>% 
  group_by(year) %>% 
  summarise(Valor_Gasto_Medio = mean(`gross(in $)`, na.rm = TRUE), 
            n_filmes = n()) %>%
  ggplot() +
  aes( x = year, 
       y = Valor_Gasto_Medio) + 
  geom_line(alpha = 0.2) + 
  geom_point(aes(size = n_filmes)) + 
  labs(x = "Ano de Lançamento", 
       y = "Investimento ($)", 
       title = "Gráfico do investimento médio em filmes por ano") + 
  scale_y_continuous(labels = scales::label_dollar(),
                     trans = "log10") +
  scale_x_continuous(breaks = seq(from = 1900, to = 2020, by = 10)) + 
  scale_size_continuous(range = c(0.1, 10)) + 
  theme_minimal() +
  theme(text = element_text(size = 20, 
                            hjust = 0.5, 
                            face = "bold")) # tamanho da fonte

filmes %>% 
  group_by(tipo) %>% 
  summarise(Total_Investido = sum(`gross(in $)`, na.rm = TRUE)) %>%
  mutate(tipo = reorder(tipo, Total_Investido)) %>% 
  ggplot() +
  aes( x = tipo, 
       y = Total_Investido, 
       color = tipo, 
       fill = tipo) +
  geom_col() + 
  scale_y_continuous(labels = scales::label_dollar()) +
  coord_flip() +
  labs(x = "Tipo de Filme", 
       y = "Total Investido ($)") + 
  theme_minimal()

filmes %>% 
  group_by(tipo) %>% 
  summarise(Total_Investido = sum(`gross(in $)`, na.rm = TRUE)) %>%
  mutate(tipo = reorder(tipo, Total_Investido)) %>% 
  ggplot() +
  aes( x = tipo, 
       y = Total_Investido, 
       color = tipo, 
       fill = tipo) +
  geom_col(alpha = 0.2, 
           ltw = 2) + 
  scale_y_continuous(labels = scales::label_dollar()) +
  coord_flip() +
  labs(x = "Tipo de Filme", 
       y = "Total Investido ($)") + 
  theme_minimal() +
  theme(legend.position = "none")


filmes %>% 
  mutate(tipo = stringr::str_to_title(tipo)) %>% 
  mutate(ano_categorico = case_when(year < 1900 ~ "< 1900", 
                                    year < 1925 ~ "< 1925", 
                                    year < 1950 ~ "< 1950", 
                                    year < 1975 ~ "< 1975", 
                                    year < 2000 ~ "< 2000", 
                                    year < 2025 ~ "< 2025")) %>%
  group_by(tipo, ano_categorico) %>% 
  summarise(Total_Investido = sum(`gross(in $)`, na.rm = TRUE)) %>%
  ungroup() %>% 
  group_by(tipo) %>% 
  mutate(total = sum(Total_Investido, na.rm = TRUE)) %>%
  ggplot() +
  aes( x = reorder(tipo, total), 
       y = Total_Investido, 
       color = ano_categorico, 
       fill = ano_categorico) +
  geom_col() + 
  scale_y_continuous(labels = scales::label_dollar()) +
  scale_color_manual(values = colorRampPalette(c("Blue", "Pink"))(7)) + 
  scale_fill_manual(values = colorRampPalette(c("Blue", "Pink"))(7)) + 
  
  coord_flip() +
  labs(x = "Tipo de Filme", 
       y = "Total Investido ($)",
       color = "Ano", 
       fill = "Ano") + 
  theme_minimal() +
  theme(legend.position = "bottom", 
        text = element_text(size = 18))

ggplot(filmes) +
  aes(x = rating) +
  geom_histogram(bins = 100, fill = "#555555") +
  theme_minimal()

ggplot(filmes) +
  aes(x = rating, fill = tipo) +
  geom_histogram(bins = 100, na.rm = TRUE) +
  theme_minimal() +
  theme(legend.position = "bottom")

ggplot(filmes) +
  aes(x = rating) +
  geom_density() +
  theme_minimal() +
  theme(legend.position = "bottom")

ggplot(filmes) +
  aes(x = rating, fill = tipo, color = tipo) +
  geom_density(alpha = 0.1) +
  theme_minimal() +
  theme(legend.position = "bottom")

ggplot(filmes) +
  aes(x = rating, fill = tipo, color = tipo) +
  geom_density(alpha = 0.1) +
  facet_wrap(vars(tipo)) + 
  theme_minimal() +
  theme(legend.position = "none")

ggplot(filmes) +
  aes(x = rating, fill = tipo, color = tipo) +
  geom_boxplot(alpha = 0.1) +
  theme_minimal() +
  theme(legend.position = "none")

ggplot(filmes) +
  aes(x = rating, 
      y = tipo, 
      fill = tipo, 
      color = tipo) +
  geom_boxplot(alpha = 0.1, 
               outlier.shape = NA) +
  geom_jitter(size = 0.1, 
              alpha = 0.1, 
              pch = 20) + 
  theme_minimal() +
  theme(legend.position = "none")

ggplot(filmes) +
  aes(x = rating, y = tipo, color = tipo) +
  geom_violin(alpha = 0.1) +
  theme_minimal() +
  theme(legend.position = "none")

ggplot(filmes) +
  aes(x = rating, y = 1) +
  geom_violin(alpha = 0.1) +
  geom_boxplot() + 
  theme_minimal() +
  theme(legend.position = "none")

ggplot(filmes) +
  aes(x = rating, y = 1) +
  geom_violin(alpha = 0.1) +
  geom_boxplot(width = 0.4) + 
  theme_minimal() +
  theme(legend.position = "none")

filmes %>%
  filter(tipo %in% "animation") %>% 
  ggplot() + 
  aes(x = rating, y = year) + 
  geom_hex(bins = 20, 
           color = "white", 
           size = 2) +
  scale_fill_gradient(low = "#FED0BB",
                      high = "#461220", 
                      guide = FALSE) + 
  coord_flip() + 
  theme_minimal()

filmes %>%
  filter(tipo %in% "war") %>% 
  mutate(runtime_num = stringr::str_remove(runtime, "min") %>% 
           str_squish() %>% 
           as.numeric()) %>% 
  filter(!is.na(runtime_num)) %>% 
  filter(`gross(in $)` > 0 | !is.na(`gross(in $)`)) %>% 
  ggplot() + 
  aes(x = year, 
      y = runtime_num) + 
  geom_density_2d() +
  theme_minimal() + 
  theme(legend.position = "none")

filmes %>%
  filter(tipo %in% c("war", "animation", "horror")) %>%
  mutate(runtime_num = stringr::str_remove(runtime, "min") %>% 
           str_squish() %>% 
           as.numeric()) %>% 
  filter(!is.na(runtime_num)) %>% 
  filter(`gross(in $)` > 0 | !is.na(`gross(in $)`)) %>% 
  ggplot() + 
  aes(x = year, 
      y = runtime_num) + 
  geom_density_2d_filled(contour_var = "density") +
  theme_minimal() + 
  theme(legend.position = "none") +
  facet_wrap(vars(tipo), scales = "free")

filmes %>% 
  filter(tipo %in% c("animation")) %>% 
  mutate(nome = ifelse(`gross(in $)` > quantile(`gross(in $)`, 0.95, na.rm = T), movie_name, NA)) %>% 
  mutate(col = ifelse(!is.na(nome), "Importante", "Não Importante")) %>%
  ggplot() +
  aes(x = year, 
      y = rating, 
      label = nome, 
      color = col)+
  geom_point() +
  geom_label() +
  theme_minimal() +
  theme(legend.position = "bottom")

require(ggrepel)

filmes %>% 
  filter(tipo %in% c("animation")) %>% 
  mutate(nome = ifelse(`gross(in $)` > quantile(`gross(in $)`, 0.95, na.rm = T), movie_name, NA)) %>% 
  mutate(col = ifelse(!is.na(nome), "Importante", "Não Importante")) %>%
  ggplot() +
  aes(x = year, 
      y = rating, 
      label = nome, 
      color = col)+
  geom_point() +
  geom_label_repel(box.padding = 0.5, 
                   max.overlaps = 1000) +
  theme_minimal() +
  theme(legend.position = "bottom")

filmes %>% 
  filter(tipo %in% c("animation")) %>% 
  mutate(nome = ifelse(`gross(in $)` > quantile(`gross(in $)`, 0.95, na.rm = T), movie_name, NA)) %>% 
  mutate(col = ifelse(!is.na(nome), "Importante", "Não Importante")) %>%
  ggplot() +
  aes(x = year, 
      y = rating, 
      label = nome, 
      color = col)+
  geom_point() +
  geom_text_repel(box.padding = 0.5, 
                  max.overlaps = 1000, 
                  nudge_x = .15,
                  nudge_y = 1,
                  segment.curvature = -0.1,
                  segment.ncp = 3,
                  segment.angle = 20
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")

require(patchwork)

p1 = 
  filmes %>% 
  filter(tipo %in% c("animation")) %>% 
  mutate(nome = ifelse(`gross(in $)` > quantile(`gross(in $)`, 0.95, na.rm = T), movie_name, NA)) %>% 
  mutate(col = ifelse(!is.na(nome), "Importante", "Não Importante")) %>%
  ggplot() +
  aes(x = year, 
      y = rating, 
      label = nome, 
      color = col)+
  geom_point() +
  geom_text_repel(box.padding = 0.5, 
                  max.overlaps = 1000, 
                  nudge_x = .15,
                  nudge_y = 1,
                  segment.curvature = -0.1,
                  segment.ncp = 3,
                  segment.angle = 20
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")

p2 = filmes %>% 
  filter(tipo %in% c("animation")) %>% 
  ggplot() +
  aes(group = year, 
      y = rating, 
  )+
  geom_boxplot() +
  theme_minimal() +
  theme(legend.position = "bottom")

p3 = filmes %>% 
  filter(tipo %in% c("animation")) %>% 
  group_by(year) %>% 
  summarise(rate = mean(rating, na.rm = TRUE)) %>% 
  ggplot()+
  aes(x = year, 
      y = rate) + 
  geom_line() +
  geom_point() +
  theme_minimal()

p1 / p2

p1 + p2 + p3

(p1 + p2 )/(p3) + plot_annotation(tag_levels = "A")

# Salvar arquivo em um PDF:

Cairo::CairoPDF("13b5a3f3-7193-406a-84f2-da09b555dbce.png")
p1
dev.off()

# Salvar arquivo como PNG:

Cairo::CairoPNG("13b5a3f3-7193-406a-84f2-da09b555dbce.png")
p1
dev.off()

# Gráficos interativos:

require(plotly)

p3 %>%  ggplotly()

# Gráficos animados:

install.packages("gganimate")
require(gganimate)

filmes %>% 
  group_by(tipo, year) %>% 
  summarise(n = log10(n())) %>%
  group_by(year) %>% 
  mutate(Rank = rank(n)) %>%
  ggplot() + 
  aes(x = Rank, 
      y = n, 
      color = tipo, 
      fill = tipo, 
      label = tipo) +
  geom_col(show.legend = F, alpha = 0.5) + 
  geom_text(show.legend = F, nudge_y = 1 , size = 10) + 
  coord_flip() + 
  scale_y_continuous(limits  = c(0,8)) + 
  # Agora, incluimos as partes do gganimate
  labs(#title = 'Ano: {frame_time}', 
    x = 'Tipo de Filme', 
    y = 'Número de Filmes') +
  #transition_time(year) +
  ggtitle('{closest_state}') +
  transition_states(year,
                    transition_length = 5,
                    state_length = 1) +
  ease_aes('linear') + 
  theme_minimal() +  
  theme(text = element_text(size = 20)) + 
  exit_fade() +   
  enter_fade() 

# Exercícios para o final de semana:
# 1- Faça pelo menos cinco gráficos (distintos), utilizando os diferentes dados apresentados no conjunto de dados filmes.
# 2- Combine os gráficos em uma página e salve em um pdf.
# 3- Crie um gráfico animado.


# Prova: função, foi, if, else, estrutura de reperição, estrutura de formatação.