# Script 7 - Estrutura de objetos - Data frames

#### Configurações ####
# Algumas configurações antes de começar

# Code < Soft Wrap Long Lines 

# Para executar o comando desde o editor de código, é Ctrl + Enter

# Para executar o comando desde o console, pode ser só Enter

#### 7. Data Frames ####

# A diferença dos outras estruturas de dados, está é a primeira em dois dimensões, linhas e colunas.

# Dentro do R, assim como existem funções nativas (p.e. c(), seq(), sum(), length(), etc), também existem conjuntos de dados nativos. Um dos mais famosos é o mtcars.

df <- mtcars

View(mtcars) # Abre numa janela separa o dataframe

# Este conjunto de dados contém diversas informações sobre diversos modelos de carro. 

# Lembrando que os data frames é a união de várias listas. Isto quer dizer que todas as propriedades das listas valem para um data frame. 

as.list(df)

# com essa função cada coluna se transforma em uma lista e cada nome da coluna vira o nome de cada posição dentro da lista

# Assim como numa lista com nomes nos elementos, os data frames também nos permitem acessar usando o operador $

df$mpg

# Ao igual que cada elemento de uma lista é uma lista, também cada elemento de um data frame é um data frame
df[1]

class(df[1])

# 2D

dim(df) # retorna as dimensões do data frame, 32 linhas, 11 colunas

# Ter duas dimensões significa que devemos usar dois índices para acessar aos valores de um data frame.

# Então agora no colchete teremos dois valores [linha, coluna]

df[2,4] # O valor da linha 2, coluna4

# Se quiser todos os valores de uma linha, basta não colocar valor para a coluna dentro do colchetes

df[2,] # todas os valores da linha 2

df[,2] # todos os valores da coluna 2

# Lembrando também que cada coluna é um vetor, veja:

class(df[,2])

# Por tanto podemos usar os testes lógicos para filtrar as linhas de nosso data frame 

df$cyl > 4 # Retorna os valores lógicos do teste realizado

df[df$cyl > 4, ] # retorna todas as colunas dos carros com mais de 4 cilindros

# Volte para os slides
