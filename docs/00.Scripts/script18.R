# Script 18 - Anotação funcional dos MAGs 

#### Configurações ####
# Algumas configurações antes de começar

# Code < Soft Wrap Long Lines 

# Para executar o comando desde o editor de código, é Ctrl + Enter

# Para executar o comando desde o console, pode ser só Enter

#### 17.0. Bibliotecas #####

library(dplyr)
library(stringr)
library(tidyr)


#### 18.1. Importação e formatação de dados ###

# Carregando a tabela obtida no script 17 (anotação taxonômica e qualidade dos mags)

load('../02.Results/tab.total.RData')

# Tabela de anotações funcionais dos Mags

func <- read_delim("anotacaoFuncional_mags.txt.txt", col_names = F) %>% 
  select(X1,X5) %>% 
  rename(Genome = X1, KO = X5) 


# Tabela com a informação completa do KEGG

kegg <- read_tsv('kegg_sorted.tsv') %>% 
  select("KO","GenName") %>% 
  unique()

# Tabela com meus genes de intersse 

mygenes <- read_excel('DegrGenes.xlsx')

#### 18.3. Formatação de dados ####

# Juntando as tabelas

tab.func.total <- left_join(func, kegg) %>% 
  left_join(tab.total)

# Criando uma tabela só com os genes de interesse

tab.func.mygenes <- inner_join(func, mygenes) %>% 
  mutate(valor = "1") %>% 
  left_join(tab.total)

# Filtrando uma via de interesse

tab.func.mygenes %>% 
 ggplot(aes(Genus, GENNAME)) +
  geom_tile(aes(fill = valor)) +
  scale_fill_manual(values = 'purple') +
  facet_wrap(~Metabolism, scales = 'free_y', ncol = 1) +
  theme_light() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5),
        strip.background.x = element_rect(fill = 'black', color = "red"),
        strip.text.x = element_text(color = 'white', face = 'bold'),
        legend.position = 'none') +
  labs(x = '',
       y = '',
       title = 'Potencial funcional dos MAGs',
       subtitle = 'Metabolismos associados a degradação de HC',
       caption = 'By Kelly Hidalgo')

# FIM!


