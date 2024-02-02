# Script 12 - Tabela anotação funcional Leclercia adecarboxylata

#### Configurações ####
# Algumas configurações antes de começar

# Code < Soft Wrap Long Lines 

# Para executar o comando desde o editor de código, é Ctrl + Enter

# Para executar o comando desde o console, pode ser só Enter

#### 12.1. Bibliotecas/ pacotes ####

library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)



#### 12.2. Importação dos dados ####

# readr() lê o arquivo .csv separado por ; 
anot <- read_csv2('docs/01.Data/genoma_kegg.csv')

# Menú de ajuda para conhecer os argumentos da função
help("read_csv2")

# Que classe de objeto é anot
class(anot)

# Quais são as dimensões?
dim(anot)

# Visualizar 
View(anot)

# Algo de errado não está certo, né?
# O arquivo não tinha nome das colunas, e o a função read_csv2() por padrão acha que a primeira linha sempre é o nome das colunas. Na função read_csv2(), o argumento col_names por padrão é TRUE, ou seja ele coloca a primeira linha como nome das colunas. Porém no caso de nosso arquivo, não temos esses nomes, então é necessário trocar esse argumento para FALSE.
anot <- read_csv2('docs/01.Data/genoma_kegg.csv', col_names = F)

# Visualizando de novo
View(anot)

# Agora as colunas ficaram nomeadas como X1, X2, X3 .... X15.

# Lembra do ciclo da ciência de dados? a primeira atividade é importação, que foi o que acabamos de fazer. Agora passaremos para a seguinte atividade que é formatação/ arrumar
# Basicamente, iremos limpar o nosso data frame, eliminando colunas que não precisamos, arrumando colunas que tem duas informações (split), e colocaremos nomes para as colunas.

##### 12.3. Formatação #####

## Eliminando colunas
anot1 <- select(.data = anot, X1, X2, X3, X15)

## Ou sem tidyverse
anot1 <- anot[,c(1:3,15)]

## Split (dividindo a coluna 3 em duas)
anot2 <- separate(data = anot1, col = X3, into = c('X3', 'X4'), sep = '\\|')

## Nomeando as colunas

anot3 <- rename(.data = anot2, "ID" = "X1",
                "Tamanho" = "X2", "GenBankID" = "X3",
                "KO" = "X4" , 'Cobertura' = "X15")

## Pronto! a nossa tabela está limpa e formatada. A seguinte etapa do ciclo é a de transformação. Esta etapa inclui criação de novas variáveis, agrupação de variáveis, sumarização, etc. Neste caso não precisamos fazer grandes transformações de nossos dados, porém podemos fazer uma sumarização para já ter uma ideia sobre os nossa base de dados.

summary(anot3)


# Volte para os slides


#### 12.4. Visualização ####

# Camada 1: Dados e o mapeamento em coordenadas

ggplot(data = anot3, mapping = aes(x=Cobertura, y=Tamanho))

# Camada 2: Forma geométrica usada para representar os dados
# Existem diversas formas geométricas (pontos, linhas, área, etc), a escolha depende do tipo de dados e do que se quer apresentar
# Perceba que as camadas se vão unindo usando o símbolo +

ggplot(data = anot3, mapping = aes(x=Cobertura, y=Tamanho)) +
  geom_point(color = 'salmon')

# o gráfico está apresentando a distribuição do tamanho dos genes e a cobertura deles. Podemos observar que a grande maioria dos genes tem uma cobertura > 95%, isso é bom!

# Mais ainda o gráfico está feio!

# Camada 3: A partir desta camada é indiferente a ordem delas. Uma coisa bem importante nos gráficos é que os eixos estejam corretamente nomeados. Vamos arrumar os nomes dos eixos e formatar eles (tamanho, cor de letra)


  
ggplot(data = anot3, mapping = aes(x=Cobertura, y=Tamanho)) +
  geom_point(color = 'salmon') +
  theme(axis.title.x = element_text(size = 12, color = 'blue', face = 'italic'),
        axis.title.y = element_text(size = 12, color = 'green', face = 'bold')) +
  labs(x = 'Cobertura (%)',
       y = 'Tamanho (bp)')

# Dentro da função theme(), existem muitos argumentos para formatação dos gráficos, especificamente a parte estética.

# Camada 4: Esse fundo cinza está feio demais! Além de fazer modificações em elemento por elemento, o ggplot tem também temas predefinidos, que podemos usar e modificar a vontade!

ggplot(data = anot3, mapping = aes(x=Cobertura, y=Tamanho)) +
  geom_point(color = 'salmon') +
  theme(axis.title.x = element_text(size = 12, color = 'blue', face = 'italic'),
        axis.title.y = element_text(size = 12, color = 'green', face = 'bold')) +
  theme_light() +
  labs(x = 'Cobertura (%)',
       y = 'Tamanho (bp)')

# Perceba que as mudanças nas cores e o tipo de letra dos eixos foi ignorada, isso porque como colocamos o tema predefinido depois dessas modificações, o R "sobreescreveu" elas. Então é melhor colocar o tema predefinido primeiro e depois ir fazendo as customizações que precisar.

ggplot(data = anot3, mapping = aes(x=Cobertura, y=Tamanho)) +
  geom_point(color = 'salmon') +
  theme_light() +
  theme(axis.title.x = element_text(size = 12, color = 'blue', face = 'italic'),
        axis.title.y = element_text(size = 12, color = 'green', face = 'bold')) +
    labs(x = 'Cobertura (%)',
       y = 'Tamanho (bp)')


# Os números nos eixos estão pequenos, vamos colocar eles maiores

ggplot(data = anot3, mapping = aes(x=Cobertura, y=Tamanho)) +
  geom_point(color = 'salmon') +
  theme_light() +
  theme(axis.title.x = element_text(size = 12, color = 'blue', face = 'italic'),
        axis.title.y = element_text(size = 12, color = 'green', face = 'bold'),
        axis.text = element_text(size = 14)) +
  labs(x = 'Cobertura (%)',
       y = 'Tamanho (bp)')

# Sempre é bom colocar título para os nossos gráficos

ggplot(data = anot3, mapping = aes(x=Cobertura, y=Tamanho)) +
  geom_point(color = 'salmon') +
  theme_light() +
  ggtitle('Tamanho vs % de cobertura dos genes', subtitle = "Leclercia adecarboxilata") +
  theme(axis.title.x = element_text(size = 12, color = 'blue', face = 'italic'),
        axis.title.y = element_text(size = 12, color = 'green', face = 'bold'),
        axis.text = element_text(size = 14)) +
  labs(x = 'Cobertura (%)',
       y = 'Tamanho (bp)') 

# O nomes científicos das espécies deve ir em itálico

ggplot(data = anot3, mapping = aes(x=Cobertura, y=Tamanho)) +
  geom_point(color = 'salmon') +
  theme_light() +
  ggtitle('Tamanho vs % de cobertura dos genes', subtitle = "Leclercia adecarboxilata") +
  theme(axis.title.x = element_text(size = 12, color = 'blue', face = 'italic'),
        axis.title.y = element_text(size = 12, color = 'green', face = 'bold'),
        axis.text = element_text(size = 14),
        plot.subtitle = element_text(face = 'italic')) +
  labs(x = 'Cobertura (%)',
       y = 'Tamanho (bp)',
       caption = 'By Kelly Hidalgo') 

# Até agora o gráfico não foi armazenado em nenhum objeto, mas é simples, basta só colocar o nome do objeto no ínicio do código e usar o símbolo de atribuição <-

plot <- ggplot(data = anot3, mapping = aes(x=Cobertura, y=Tamanho)) +
  geom_point(color = 'salmon') +
  theme_light() +
  ggtitle('Tamanho vs % de cobertura dos genes', subtitle = "Leclercia adecarboxilata") +
  theme(axis.title.x = element_text(size = 12, color = 'blue', face = 'italic'),
        axis.title.y = element_text(size = 12, color = 'green', face = 'bold'),
        axis.text = element_text(size = 14),
        plot.subtitle = element_text(face = 'italic')) +
  labs(x = 'Cobertura (%)',
       y = 'Tamanho (bp)',
       caption = 'By Kelly Hidalgo'); plot

# E se quisermos salvar o gráfico além do R, como uma imagem:

ggsave(plot = plot,
       filename = 'docs/02.Results/tamanho_vs_cobertura.png',
       width = 13,
       height = 10,
       units = 'cm',
       dpi = 400)

# PRONTO!

## Mas ainda pode ficar tudo muito mais fluido e sucinto usando o pipe (%>%). Este operador é específico do tidyverse e foi criado para economizar linhas de comando, também para que o código fique mais "clean" e por último também economiza espaço na memória da máquina, porque não é necessária a criação de tantos objetos intermediarios.

# Repare!

read_csv2('docs/01.Data/genoma_kegg.csv', col_names = F) %>% 
  select(X1, X2, X3, X15) %>% 
  separate(col = X3, into = c('X3', 'X4'), sep = '\\|') %>% 
  rename("ID" = "X1",
         "Tamanho" = "X2", "GenBankID" = "X3",
         "KO" = "X4" , 'Cobertura' = "X15") %>% 
  ggplot(mapping = aes(x=Cobertura, y=Tamanho)) +
  geom_point(color = 'salmon') +
  theme_light() +
  ggtitle('Tamanho vs % de cobertura dos genes', subtitle = "Leclercia adecarboxilata") +
  theme(axis.title.x = element_text(size = 12, color = 'blue', face = 'italic'),
        axis.title.y = element_text(size = 12, color = 'green', face = 'bold'),
        axis.text = element_text(size = 14),
        plot.subtitle = element_text(face = 'italic')) +
  labs(x = 'Cobertura (%)',
       y = 'Tamanho (bp)',
       caption = 'By Kelly Hidalgo')
  
  
### Continue no script13.R

