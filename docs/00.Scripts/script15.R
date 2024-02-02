# Script 15 - Tabela final metagenômica (Anotação funcional e taxonômica)
#### Configurações ####
# Algumas configurações antes de começar

# Code < Soft Wrap Long Lines 

# Para executar o comando desde o editor de código, é Ctrl + Enter

# Para executar o comando desde o console, pode ser só Enter

#### 15.1. Bibliotecas/ pacotes ####

library(readr)
install.packages('readxl')
library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)

install.packages('remotes')
remotes::install_github("MatthewBJane/ThemePark")
library(ThemePark)


#### 15.2. Importação de dados ####

# Importando os dados e calculando a abundancia relativa

tab <- read_delim('tabela_total_final.tsv') %>% 
  mutate(Sample1 = Sample1/sum(Sample1)*100,
         Sample2 = Sample2/sum(Sample2)*100,
         Sample3 = Sample3/sum(Sample3)*100,
         Sample4 = Sample4/sum(Sample4)*100,
         Sample5 = Sample5/sum(Sample5)*100,
         Sample6 = Sample6/sum(Sample6)*100) 

# Tabela com a informação completa do KEGG

kegg <- read_tsv('kegg_sorted.tsv') %>% 
  select("KO","GenName") %>% 
  unique()

# Tabela com meus genes de intersse 

mygenes <- read_excel('DegrGenes.xlsx')

#### 15.3. Formatação de dados ####

# Juntando as tabelas

tab.kegg.total <- left_join(tab, kegg)

# Criando uma tabela só com os genes de interesse

tab.kegg.mygenes <- inner_join(tab, mygenes)

#### 15.4. Transformação de dados ####

### Tabelas totais

# Remodelando a tabela e colapsando pela taxonomia

tab.kegg.total.tax <- tab.kegg.total %>% 
  pivot_longer(cols = starts_with("Sample"), names_to = "Samples", values_to = 'Abund.Relat') %>% 
  group_by(Taxonomia, Samples) %>% 
  summarise(
    Abund.Relat = sum(Abund.Relat)) 

# Criando uma categoria para taxa pouco abundantes

tab.kegg.total.tax$Taxonomia[tab.kegg.total.tax$Abund.Relat < 0.5] <- 'Outros (< 0.5%)'

# Remodelando a tabela e colapsando pelos genes

tab.kegg.total.func <- tab.kegg.total %>% 
  pivot_longer(cols = starts_with("Sample"), names_to = "Samples", values_to = 'Abund.Relat') %>% 
  group_by(GenName, Samples) %>% 
  summarise(
    Abund.Relat = sum(Abund.Relat)) 

View(tab.kegg.total.func)

# Criando uma categoria para taxa pouco abundantes

tab.kegg.total.func$GenName[tab.kegg.total.func$Abund.Relat < 0.7] <- 'Genes < 0.7%'


#### Tabelas específicas

# Remodelando a tabela específica e colapsando pela taxonomia

tab.kegg.mygenes.tax <- tab.kegg.mygenes %>% 
  pivot_longer(cols = starts_with("Sample"), names_to = "Samples", values_to = 'Abund.Relat') %>% 
  group_by(Taxonomia, Samples) %>% 
  summarise(
    Abund.Relat = sum(Abund.Relat)) 

# Remodelando a tabela e colapsando pelos genes

tab.kegg.mygenes.func <- tab.kegg.mygenes %>% 
  pivot_longer(cols = starts_with("Sample"), names_to = "Samples", values_to = 'Abund.Relat') %>% 
  group_by(GENNAME, PATHWAY, Samples) %>% 
  summarise(
    Abund.Relat = sum(Abund.Relat)) 

View(tab.kegg.mygenes.func)

# Criando uma categoria para taxa pouco abundantes

tab.kegg.mygenes.func$GENNAME[tab.kegg.mygenes.func$Abund.Relat < 0.15] <- 'Genes < 0.15%'


#### 15.4. Visualização ####


### Gráfico com taxonomias (total)

tab.kegg.total.tax %>% 
  ggplot(aes(Samples,Abund.Relat)) + 
  geom_bar(aes(fill = Taxonomia), stat = 'identity', position = 'stack')

# Criando uma paleta de cores

colors18 <- c("#9a476b","#56b854","#b458c2", "#a4b437","#6c68c8","#d39f38",
                       "#6b93cf","#cf552a","#4cbfb2","#d4458f","#3d8b5b",
                       "#cf3c55","#9ab670","#d484bd","#63772a", "#d06f6a",
                       "#94662e", "#df9662")

tab.kegg.total.tax %>% 
  ggplot(aes(Samples,Abund.Relat)) + 
  geom_bar(aes(fill = Taxonomia), stat = 'identity', position = 'stack') +
  scale_fill_manual(values = colors18)

# hora de embelezer o plot

tab.kegg.total.tax %>% 
  ggplot(aes(Samples,Abund.Relat)) + 
  geom_bar(aes(fill = Taxonomia), stat = 'identity', position = 'stack') +
  scale_fill_manual(values = colors18) +
  theme_barbie()


tab.kegg.total.tax %>% 
  ggplot(aes(Samples,Abund.Relat)) + 
  geom_bar(aes(fill = Taxonomia), stat = 'identity', position = 'stack') +
  scale_fill_manual(values = colors18) +
  theme_nemo()
  

tab.kegg.total.tax %>% 
  ggplot(aes(Samples,Abund.Relat)) + 
  geom_bar(aes(fill = Taxonomia), stat = 'identity', position = 'stack') +
  scale_fill_manual(values = colors18) +
  theme_starwars() +
  labs(y = "Abudância Relativa (%)",
       title = "Composição taxonômica da comunidade microbiana",
       caption = 'By Kelly Hidalgo')
 

### Gráfico com todas as funções Total


tab.kegg.total.func %>% 
  ggplot(aes(Samples,Abund.Relat)) + 
  geom_bar(aes(fill = GenName), stat = 'identity', position = 'stack') +
  scale_fill_manual(values = colors18) +
  theme_alien() +
  labs(y = "Abudância Relativa (%)",
       title = "Composição funcional da comunidade microbiana",
       caption = 'By Kelly Hidalgo')

### Gráfico com taxonomias (específico)

tab.kegg.mygenes.tax %>% 
  ggplot(aes(Samples,Abund.Relat)) + 
  geom_bar(aes(fill = Taxonomia), stat = 'identity', position = 'stack') +
  scale_fill_manual(values = colors18) +
  theme_avatar() +
  labs(y = "Abudância Relativa (%)",
       title = "Composição taxonômica da comunidade microbiana específica",
       caption = 'By Kelly Hidalgo')


### Gráfico com todas as funções (específico)


tab.kegg.mygenes.func %>% 
  ggplot(aes(Samples,Abund.Relat)) + 
  geom_bar(aes(fill = GENNAME), stat = 'identity', position = 'stack') +
  scale_fill_manual(values = colors18) +
  theme_alien() +
  labs(y = "Abudância Relativa (%)",
       title = "Composição funcional da comunidade microbiana específica",
       caption = 'By Kelly Hidalgo')

##### 15.5. Outras opções ####

tab.kegg.mygenes$PATHWAY %>% unique()


tab.kegg.mygenes %>% 
  filter(PATHWAY == "Methanogenesis") %>% 
  pivot_longer(cols = starts_with("Sample"), names_to = 'Samples', values_to = 'Abund.Relat') %>% 
  group_by(Taxonomia, Samples) %>% 
  summarise(
    Abund.Relat = sum(Abund.Relat)) %>% 
  ggplot(aes(Samples,Abund.Relat)) + 
  geom_bar(aes(fill = Taxonomia), stat = 'identity', position = 'stack') +
  scale_fill_manual(values = colors18) +
  theme_economist() +
  labs(y = "Abudância Relativa (%)",
       title = "Microorganismos metanogênicos",
       caption = 'By Kelly Hidalgo')

# Continue no script16.R
