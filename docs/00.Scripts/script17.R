# Script 17 - Anotação Taxonômica dos MAGs (Saída do GTDBtk)

#### Configurações ####
# Algumas configurações antes de começar

# Code < Soft Wrap Long Lines 

# Para executar o comando desde o editor de código, é Ctrl + Enter

# Para executar o comando desde o console, pode ser só Enter

#### 17.0. Bibliotecas #####

library(dplyr)
library(tidyr)
library(writexl)
library(ggplot2)
install.packages('ggthemes')
library(ggthemes)

#### 17.1. Importação de dados ####

## Construindo tabela com taxonomia e qualidade dos mags

## Lendo e formatando a tabela saída do CheckM com a qualidade dos MAGs
quality <- read_delim("output.txt", skip = 33) %>% 
  select(Bin.Id, Completeness, Contamination) %>% 
  na.omit() %>% 
  as_tibble() %>% 
  rename(Genome = Bin.Id) %>% 
  mutate(Quality = case_when(Contamination < 5 & Completeness > 90 ~ "High-Quality",
                             Contamination < 10 & Completeness >= 50 ~ "Medium-Quality",
                             Completeness < 50 & Contamination > 10 ~ "Low-Quality"))

View(quality)

## Lendo a tabela de anotação taxonômica de bactérias
bact.taxa <- read.delim("gtdbtk.bac120.summary.tsv",
                        sep = '\t') %>% 
  select(user_genome, classification) %>% 
  rename(Genome = user_genome) %>% 
  as_tibble() %>% 
  separate(col = classification, into = c("Kingdom", "Phylum", "Class", "Order",
                                          "Family", "Genus", "Species"), sep = ';')

View(bact.taxa)

## Lendo a tabela de anotação taxonômica de Arqueas
arc.taxa <- read.delim("gtdbtk.ar53.summary.tsv",
                       sep = '\t') %>% 
  select(user_genome, classification) %>% 
  rename(Genome = user_genome) %>% 
  as_tibble() %>% 
  separate(col = classification, into = c("Kingdom", "Phylum", "Class", "Order",
                                          "Family", "Genus", "Species"), sep = ';')

View(arc.taxa)

#### 17.2. Formatação dos dados ####

## No seguinte bloco de código, serão feitas várias modificações nos dados. Primeiro é feita a união entre as tabelas de taxonomia de bacterias e de arqueias, depois é feita uma limpeza nas taxonomias, e por último é feito um merge com a tabela de qualidade

tab.total <- union(bact.taxa, arc.taxa) %>% 
  mutate(Kingdom = str_remove_all(Kingdom, "d__"),
         Phylum = str_remove_all(Phylum, "p__"),
         Class = str_remove_all(Class, 'c__'),
         Order = str_remove_all(Order, 'o__'),
         Family = str_remove_all(Family, 'f__'),
         Genus = str_remove_all(Genus, 'g__'),
         Species = str_remove_all(Species, 's__')) %>% 
  full_join(quality) 

tab.total[tab.total == "" | is.na(tab.total)] <- 'Unassigned'

# Agora você quer filtrar os MAGs de baixa qualidade

tab.total <- tab.total %>% 
  filter(Quality != 'Low-Quality')

View(tab.total)

# Você pode salvar o objeto em formato .RData, e assim, se precisar dele em outro script não precisa rodar de novo todos os códigos para obter ele.

save(tab.total, file = '../02.Results/tab.total.RData')

#### 17.3. Visualização ####

# Se você quiser salvar a nova tabela com todas as informações de taxonomia e qualidade dos MAGs...

write_xlsx(tab.total, path = "../02.Results/tabela_tax_quality.xlsx")

# Vamos fazer alguns gráficos que podem ser construidos apartir da tabela

# Distribuição da qualidade dos MAGs

tab.total %>% 
  ggplot(mapping = aes(x = Completeness, y = Contamination)) +
  geom_point(mapping = aes(shape = Quality, color = Phylum), size = 2) 

# A escala de cores é a padrão do R, até você não falar o contrário. Então se você quiser uma escala customizada, use a função scale_color_manual para colocar sua própria paleta de cores. Porém primeiro é recomendável criar uma

colors19 <- c("#52c25c","#b356c1","#91ba35", "#6d69ce","#cfa535","#6c8aca",
                       "#e27f40", "#46bfc9", "#d5413e","#65c18c","#cf4485",
                       "#4a8b35","#c178b1","#aab061","#bf606a","#36845f",
                       "#a7552d","#6d7027","#b88850")

tab.total %>% 
  ggplot(mapping = aes(x = Completeness, y = Contamination)) +
  geom_point(mapping = aes(shape = Quality, color = Phylum), size = 2) +
  scale_color_manual(values = colors19)


# A escala no eixo x não está muito boa para representar os cortes dependendo da completeza, então vamos mexer nessa escala

tab.total %>% 
  ggplot(mapping = aes(x = Completeness, y = Contamination)) +
  geom_point(mapping = aes(shape = Quality, color = Phylum), size = 2) +
  scale_color_manual(values = colors19) +
  scale_x_continuous(breaks = seq(from = 50, to = 100, by = 5)) 

# Também existe escala de shapes, se você quiser customizar é possível também.

tab.total %>% 
  ggplot(mapping = aes(x = Completeness, y = Contamination)) +
  geom_point(mapping = aes(shape = Quality, color = Phylum), size = 2) +
  scale_color_manual(values = colors19) +
  scale_x_continuous(breaks = seq(from = 50, to = 100, by = 5)) +
  scale_shape_manual(values = c(17,18,19))


# Vamos supor que você quer mapear na cor a qualidade ao invés do phylum

tab.total %>% 
  ggplot(mapping = aes(x = Completeness, y = Contamination)) +
  geom_point(mapping = aes(color = Quality), size = 2) +
  scale_x_continuous(breaks = seq(from = 50, to = 100, by = 5)) +
  scale_shape_manual(values = c(17,18,19))

# Ainda para ficar mais claros os limites de qualidade vamos trazar umas linhas no gráfico separando as categorias

tab.total %>% 
  ggplot(mapping = aes(x = Completeness, y = Contamination)) +
  geom_point(mapping = aes(color = Quality), size = 2) +
  scale_x_continuous(breaks = seq(from = 50, to = 100, by = 5)) +
  scale_shape_manual(values = c(17,18,19)) +
  scale_color_manual(values = c('darkgreen', 'salmon')) +
  geom_vline(xintercept=90, linetype="dashed", colour="Dark green") + 
  geom_hline(yintercept=5, linetype="dashed", colour="Dark green") +
  geom_vline(xintercept=50, linetype="dashed", colour="orange") + 
  geom_hline(yintercept=10, linetype="dashed", colour="Orange")

# Hora de embelezer o gráfico com os temas!

tab.total %>% 
  ggplot(mapping = aes(x = Completeness, y = Contamination)) +
  geom_point(mapping = aes(color = Quality), size = 2) +
  scale_x_continuous(breaks = seq(from = 50, to = 100, by = 5)) +
  scale_shape_manual(values = c(17,18,19)) +
  scale_color_manual(values = c('darkgreen', 'salmon')) +
  geom_vline(xintercept=90, linetype="dashed", colour="Dark green") + 
  geom_hline(yintercept=5, linetype="dashed", colour="Dark green") +
  geom_vline(xintercept=50, linetype="dashed", colour="orange") + 
  geom_hline(yintercept=10, linetype="dashed", colour="Orange") +
  theme_minimal() +
  theme(axis.text = element_text(size = 10, color = 'darkblue', face = 'bold'),
        axis.title = element_text(size = 12, face = 'bold')) +
  labs(title = "Dispersão da qualidade dos MAGs",
       x = 'Completeness (%)',
       y = 'Contamination (%)',
       caption = 'By Kelly Hidalgo')


### Outro gráfico

# Agora vamos gráficar dados de taxonômia

tab.total %>% 
  group_by(Kingdom, Phylum, Quality) %>% 
  summarise(
    count = n()
  ) %>% 
  ggplot(aes(Quality, Phylum)) +
  geom_point(aes(size = count, color = Kingdom), alpha = 0.5) +
  geom_text(aes(label = count), size = 3.5) + 
  theme_par() +
  labs(x = "",
       y = "",
       size = 'No. de MAGs',
       title = 'Número de MAGs por Filum',
       caption = 'By Kelly Hidalgo')

# Vamos supor que você tem especial interesse no filum 'Firmicutes' e que saber quais espécies recuperou deste filum

tab.total %>% 
  filter(Phylum == 'Firmicutes') %>% 
  group_by(Genus) %>% 
  summarise(
    Generos = n()
  )

# Você tem interesse em fazer um box plot da distrubuição da completeza e da contaminação, para saber os valores mínimos, maximos e os quartís

tab.total %>% 
  pivot_longer(cols = c(Contamination, Completeness), names_to = 'Categoria', values_to = 'Valores') %>% 
  ggplot(aes(Categoria, Valores)) +
  geom_boxplot(width=0.2, aes(fill = Categoria))+
  geom_jitter(col="darkslateblue", alpha = 0.3)+
  stat_summary(fun=mean, geom="point", col="black", 
               size=2) +
  theme_clean() +
  theme(legend.position = 'none') +
  labs(x = '',
       y = 'Porcentagem')


# As opções são quase infinitas!

# Continue no script18.R