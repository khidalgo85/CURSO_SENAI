# Script 13 - Cobertura dos metagenomas

#### Configurações ####
# Algumas configurações antes de começar

# Code < Soft Wrap Long Lines 

# Para executar o comando desde o editor de código, é Ctrl + Enter

# Para executar o comando desde o console, pode ser só Enter

#### 13.0. Diretório de trabalho #####

setwd("docs/01.Data/")

#### 13.1. Bibliotecas/ pacotes ####

# Iremos usar a biblioteca NonPareil, então o primeiro passo é a instalação

library(readr)

install.packages('Nonpareil')
library(Nonpareil)
library(writexl)
library(dplyr)
library(tibble)



#### 13.2. Importação dos dados ####

samples <- read_delim('Samples.txt') 

attach(samples) # esta função é usada para acessar as variáveis prsentes na estrutura de dados sem chamar ela
nps <- Nonpareil.set(File, col=Col, labels=Name, 
                     plot.opts=list(plot.observed=FALSE, 
                                    ylim = c(0, 1.05),
                                    legend.opts = FALSE)) #grafica as curvas

Nonpareil.legend(nps, x.intersp=0.5, y.intersp=0.7, pt.cex=0.5, cex=0.5) #coloca e personaliza a legenda

## Este gráfico não foi gerado com ggplot2, por tanto o jeito de salvar ele fora do R é um pouco diferente. O mais recomendável é usar a janela de plots e exportar como imagem 

detach(samples);

#mostra o resumo em forma de tabela
tab <- as.data.frame(summary(nps)) %>% 
  rownames_to_column('samples')

tab


# Se quiser salvar a tabela, também é possível com a biblioteca writexl

write_xlsx(x= tab, path = '../02.Results/nonpareil_table.xlsx')

# Continua no script14.R








