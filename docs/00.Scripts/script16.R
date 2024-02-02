# Script 16 - Qualidade dos MAGs (Saída do checkM)

#### Configurações ####
# Algumas configurações antes de começar

# Code < Soft Wrap Long Lines 

# Para executar o comando desde o editor de código, é Ctrl + Enter

# Para executar o comando desde o console, pode ser só Enter


#### 16.0 Bibliotecas ####

library(dplyr)

#### 16.1 Importação dos dados #### 

tab <- read_delim("output.txt", skip = 33)

View(tab)

#### 16.2. Formatação dos dados #####
tab1 <- tab %>% 
  na.omit() %>% 
  select(Bin.Id,Completeness,Contamination) %>% 
  mutate(Quality = case_when(Contamination < 5 & Completeness > 90 ~ "High-Quality",
                             Contamination < 10 & Completeness >= 50 ~ "Medium-Quality",
                             Completeness < 50 ~ "Low-Quality",
                             Contamination > 10 ~ "Low-Quality"))

# No código anterior, adicionamos uma coluna "Quality", baseado na contaminação e na completeza dos MAGs, para assim classificá-los como de alta, média e baixa qualidade.


#### 16.3 Transformação e sumarização de dados ##### 

tab1 %>% 
  group_by(Quality) %>% 
  summarise(
    n=n() # contador
  )

## Criando tabela só com os MAGs de alta e média qualidade

mags.filtered <- tab1 %>% 
  group_by(Quality) %>% 
  filter(Quality == "High-Quality" | Quality == "Medium-Quality") %>% 
  ungroup() %>% 
  select(Bin.Id) %>% 
  as.data.frame()

fa <- c(rep(".fa", nrow(mags.filtered))) ## add .fa a cada nome do MAG


mags <- mags.filtered$`Bin Id` %>% 
  paste0(., fa) %>% 
  write(., file="../02.Results/filt.mags.txt") # salva o arquivo com a lista dos Mags que passaram o filtro


## Continue no script17.R

