# Script 6 - Estrutura de objetos - Listas

#### Configurações ####
# Algumas configurações antes de começar

# Code < Soft Wrap Long Lines 

# Para executar o comando desde o editor de código, é Ctrl + Enter

# Para executar o comando desde o console, pode ser só Enter


#### 6. Listas ####

# A função padrão para criar listas é list()

list('a', T, 5) # Não houve coerção apesar de serem diferentesa classes de dados, porque as listas permitem isto.

# INFORMAÇÃO IMPORTANTE #

# Cada elemento de uma lista é uma lista

# Isso é importante para acessar aos elementos, o qual vai ser diferente aos vetores

lista <- list('a', T, 5)

lista[1]

class(lista[1])

# Que cada elemento de uma lista ser uma lista é importante pois isso nos permite colocar vetores de tamanhos diferentes em cada posição. Isso faz das listas uma estrutura bem flexível para guardar dados.

lista <- list(1:15, "z", c(F, F, T, T))

lista

lista[1] # O elemento na posição 1 da lista chamada lista, é um vetor de 1 até 15

# É muito útil e comúm dar nomes a cada posição dentro da lista

dados_aluno <- list(aluno = 'Camila Andrade', idade = 30, nota = 7.2)

dados_aluno

# Agora que os elementos da lista tem nomes, podemos usá-los para accessar aos elementos usando o operador $

dados_aluno$aluno

# Ou

dados_aluno[[1]]

dados_aluno$idade

# Volte aos slides
