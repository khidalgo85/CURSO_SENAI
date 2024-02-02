# Script 5 - Estrutura de objetos - Vetores

#### Configurações ####
# Algumas configurações antes de começar

# Code < Soft Wrap Long Lines 

# Para executar o comando desde o editor de código, é Ctrl + Enter

# Para executar o comando desde o console, pode ser só Enter

#### 5. Vetores ####

# Função c()

vetor1 <- c(1, 5, 3, -10)
vetor1
class(vetor1) # tipo de informação contido no vetor
length(vetor1) # tamanho do vetor

vetor2 <- c('a', 'b', 'c')
vetor2
class(vetor2)
length(vetor2)

# Os vetores só guardam um tipo de informação

# Se tentamos colocar dois tipos de informações diferentes, o R vai fazer uma coerção (forçar a conversão de todo ao mesmo tipo de elemento)

vetor3 <- c('a', 2, 3, FALSE, TRUE)
vetor3
class(vetor3)
length(vetor3)

vetor4 <- c(FALSE, TRUE, T, T, F, F)
vetor4
class(vetor4)
length(vetor4)

## Outras funções para criação de vetores

# operador :

# vetor de 1 a 10
1:10

# Vetor de 10 a 1
10:1

# Vetor de -5 a 3
-5:3

# Já que os vetores são conjuntos indexados, isso quer dizer que cada valor dentro de um vetor tem uma posição. Essa posição é dada pela ordem em que os elementos foram colocados no momento em que o vetor foi criado. Isso nos permite acessar individualmente cada valor de um vetor.

#Para isso, colocamos o índice do valor que queremos acessar dentro de colchetes [].

vetor <- c('a', 'b', 'c', 'd')

vetor[1]

vetor[2]

vetor[3]

# Você também pode colocar um conjunto de índices dentro dos colchetes, para selecionar várias posições

vetor[1:3]

vetor[c(1,3)]

# Se você tentar acessar a um índice que não existe, será retornado NA

vetor[5]

# Pode usar testes lógicos para acessar aos elementos de um vetor ou criação de sub-vetores

notas <- c(6.25,8,8,4,7.6,5,8.75,3,7.5,1,0.5)
notas

length(notas)

notas < 8 # Retorna um vetor de valores lógicos, segundo o teste realizado

notas[notas >= 7] # Retorna um sub-vetor com as notas maiores ou iguais a 7 (aprovados)


aprovados <- notas[notas >= 7] 
aprovados
length(aprovados)

reprovados <- notas[notas <= 3] 
reprovados
length(reprovados)

recuperacao <- notas[notas > 3 & notas < 7 ]
recuperacao
length(reprovados)

# Como modificar elementos de um vetor

notas <- c(6.25,8,8,4,7.6,5,8.75,3,7.5,1,0.5)

notas[2] <- 10 # modificou a posição número 2 do vetor notas

notas

notas[1:4] <- c(4,7,9,1)
notas

# Função seq() para criação de vetores

seq(1,10) # por padrão vai de 1 em 1

seq(2,10, by = 0.5) # O argumento by foi modificado do padrão 1 para 0.5. Então será criada uma sequencia de números de 2 até 10, de 0.5 em 0.5

# Função rep() para criação de vetores

rep(4,times = 5) # a repetição do número 4, cinco vezes.
rep(4, 5) # se coloca na ordem correta dos argumentos, pode omitir o nome deles

rep(c(5,7), times = 3) # O vetor se repite 3 vezes

rep(c(5,7), each = 3) # s elemnetos do vetor se repetem 3 vezes


#### 5.1. Operações com vetores ####

vetor <- c(0, 5, 10, -2)

vetor + 1 # Se suma 1 a cada elemento do vetor

vetor * 10 # Se multiplica por 10 cada elemento do vetor

vetor1 <- c(1, 2, 3)

vetor2 <- c(10, 20, 30)

vetor1  + vetor2 # Se soma elemento a elemento

# Vetores de diferentes tamanhos

vetor1 <- c(1, 2)

vetor2 <- c(10, 20, 30, 40)

vetor1 + vetor2 # Reciclagem, o R converte o vetor1 em c(1,2,1,2) para ficar do mesmo tamanho que o vetor2

# Volte para os slides
