# Script 8 - Funções

#### Configurações ####
# Algumas configurações antes de começar

# Code < Soft Wrap Long Lines 

# Para executar o comando desde o editor de código, é Ctrl + Enter

# Para executar o comando desde o console, pode ser só Enter


#### 8. Funções ####

sum(2, 5) # Soma os dois valores

mean(c(1, 5, 8, 12)) # a função mean() precisa de um vetor para calcular o valor da média

mean(df$disp) # Cada coluna de um data frame é um vetor

mean(c(1, 3, NA)) # Retorna NA porque a função não sabe o valor do elemento NA

mean(c(1, 3, NA), na.rm = T) # Com o argumento na.rm, a função primeiro eliminar os valores faltantes (NAs) e calcula a média com os valores restantes.

seq(from = 5, to = 25, by = 5) # Na maioria das vezes, or argumentos podem ser colocados com os nomes

seq(5, 25, 5) # ou usar a ordem deles e não colocar os nomes

# Outras funções para trabalhar com data frames

head(df) # Mostra as primeiras 6 linhas.
tail(df) # Mostra as últimas 6 linhas.
names(df) # Os nomes das colunas (variáveis).
str(df) # Estrutura do data frame. Mostra, entre outras coisas, as classes de cada coluna.
cbind(df) # Acopla duas tabelas lado a lado.
rbind(df) # Empilha duas tabelas.
summary(df) #apresenta um resumo do df, com estatisticas básicas

# Ao igual que nos programas de bioinformática, existe sempre o menú de ajuda de cada função
help(head) # abre na aba help o manual da função

# Além de funções prontas, o usuário também pode criar as próprias funções. Porém este tema não será abordado neste curso. Só um exemplo

# Sintaxe 

nome_da_funcao <- function(argumento_1, argumento_2) {
  
  # Código que a função irá executar
  
}

# Exemplo

minha_soma <- function(x, y) {
  soma <- x + y
  
  soma  # resultado retornado
}

minha_soma(2,4)
