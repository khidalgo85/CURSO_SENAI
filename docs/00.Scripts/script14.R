# Script 14 - Distancias dos metagenomas

#### Configurações ####
# Algumas configurações antes de começar

# Code < Soft Wrap Long Lines 

# Para executar o comando desde o editor de código, é Ctrl + Enter

# Para executar o comando desde o console, pode ser só Enter

#### 14.1. Bibliotecas/ pacotes ####

library(dplyr)
library(stringr)
library(tidyverse)

install.packages('pheatmap')
library(pheatmap)


#### 14.2. Importando e formatando os dados ####

data <- read_tsv("distancesOutputFinal.tsv") %>% 
  rename(samples = '#query') %>% 
  mutate(samples = str_remove_all(samples, "04.MinHash/"),
         samples = str_remove_all(samples, ".fq")) %>% 
  column_to_rownames(var = 'samples')

colnames(data) <- rownames(data)

#### 14.3. Graficando ####

pheatmap(data)


# Salve o gráfico desde a janela Plots, exportando como imagem.

# Continue no script15.R

