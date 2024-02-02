# Script 2 - Tipos e conversão de dados

#### Configurações ####
# Algumas configurações antes de começar

# Code < Soft Wrap Long Lines 

# Para executar o comando desde o editor de código, é Ctrl + Enter

# Para executar o comando desde o console, pode ser só Enter

##### 2. Tipos de dados #####

#### 2.1. Funções de classe ####

a <- 150
a
class(a) # Imprime a classe de informação que recebeu a variável 'a', númerica, string, lógica com poucos detalhes.

x <- 'Senai'
x
typeof(x) # Imprime o tipo de dado de 'x', double (dupla precisão, precisão alta), characeter. Forma mais detalhada

z <- 0.625 # Para decimais é usado o PONTO
z
class(z)
typeof(z) # Viu a diferença?

#### 2.2. Funções de conversão ####

a <- 38

class(a)

# De númerico para carácter

as.character(a) # Se você não associar o resultado a nenhuma variável, ele só será mostrado no console mas não ficará disponível para usá-lo depois

c <- as.character(a)

c

class(c)

# De carácter para númerico

as.numeric(c) # Desta vez deu certo porque o texto que estava armazenado na variável 'c' era um número. E se não fosse assim?

x <- 'Senai'

as.numeric(x) # Não apresenta um erro, porém transforma o valor para NA, usado para representar valores ausentes

# De decimal a inteiro

y <- 5.25

as.integer(y)

# De númerico ou string para valores lógicos

f <- as.logical(1) # Por padrão 1 sempre equivale a TRUE
f

g <- as.logical(0) # Por padrão 0 sempre equivale a FALSE
g

# E se fosse outro valor?

k <- as.logical(3) # Qualquer valor diferente de zero é equivalente a TRUE
k

# Atenção

# O R é case sensitive, ou seja ele reconhece a diferença entre maiúsculo e minúsculo

h <- 3

class(H)

x <- 'Senai'

y <- 'SENAI'

x == y

## Ufa! Segundo script superado. Agora você sabe usar o R como calculadora e armazenar valores em variáveis. Também saber o tipo de dado armazenado e converté-lo se for o caso.

# Volte aos slides para mais uma explicação
