# Script 11 - Universo Tidyverse

#### Configurações ####
# Algumas configurações antes de começar

# Code < Soft Wrap Long Lines 

# Para executar o comando desde o editor de código, é Ctrl + Enter

# Para executar o comando desde o console, pode ser só Enter

#### 11. Tidyverse ####

# O tidyverse pode ser instalado via CRAN
install.packages('tidyverse') # instala todos os pacotes que fazem parte do universo tidyverse

# Para ativar 
library(tidyverse) # Embora o tidyverse seja composto por mais pacotes, a função library ativa os mais usados. 

# Algumas mensagens de conflito aparecem quando se carrega o tidyverse, falam que algumas funções anteriormente carregadas foram "mascaradas" por novas funções. Por exemplo a função filter(), existe tanto no dplyr como no stats. Nesse caso se quiséssemos usar a função filter do pacote stats, teriamos que chamar a função assim:

# stats::filter()

#### 11.1. Pacotes mais importantes ####

# ggplot2: visualização de dados, ou produção de gráficos.

# dplyr: verbos para manipulação de tabelas.

# readr: importação e exportação de dados em arquivos de texto.

# tibble: data.frame’s modernos.

# stringr: manipulação de texto (character).

# forcats: trabalhando com fatores (factor).

# tidyr: formatar e limpar os seus dados.

# purrr: repita você mesmo com functional programming.

# Volte para os slides
