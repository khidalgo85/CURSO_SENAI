# Script 4 - Operadores

#### Configurações ####
# Algumas configurações antes de começar

# Code < Soft Wrap Long Lines 

# Para executar o comando desde o editor de código, é Ctrl + Enter

# Para executar o comando desde o console, pode ser só Enter

#### 4. Operadores #####

#### 4.1. Operadores matemáticos ####

a <- 80
b <- 25

# Adição +

a + b

# Substração

a - b

# Multiplicação

a * b

# Divisão exata

c <- 10
d <- 3

c / d

# Resto da divisão

c %% d

# Parte inteira da divisão

c %/% d

# Potenciação

c ** d

#### 4.2. Funções matemáticas ####

# Raiz quadrada

sqrt(c)

# Número absoluto

abs(-45)

# Logarítmo natural

log(2)

# Logarítmo em base 10

log10(10)

# Logarítmo em qualquer base

log(2,2) # Logaritmo de 2 em base 2

log(10,2) # Logarítmo de 10 em base 2

# Exponencial

exp(1)

# A função round(), arredonda números

round(pi, digits = 0) # nunhum decimal

round(8.24, digits = 1) # um decimal

round(8.24, 1) # se você mantém a ordem dos argumentos da função, não é necessario escrever cada argumento.

# Outras funções de arredondamento

ceiling(pi) # arredonda ao inteiro de cima

floor(pi) # arredonda ao inteiro de baixo

#### 4.3. Operadores relacionais ####

# Menor que

54 < 90

90 < 54

# Menor ou igual a

5 <= 5

90 <= 5

# Maior que

89 > 76

79 > 89

# Maior que ou igual a

78 >= 78

78 >= 45

45 >= 78

# Igualdade

78 == 78

78 == 79

'Kelly' == 'Kelly'

'Kelly' == 'kelly'

# Desigualdade

'Kelly' != 'Kelly'

'Kelly' != 'kelly'

#### 4.4. Operadores lógicos ####

# CONJUNÇÃO (Operador & - E)

#Exemplo1: Eu só quero sorvete se for de morango e do grande. O atendente da sorveteria, confirma que tem de morango (primeiro TRUE) e que tem do grande também (segundo TRUE). Por tanto sim vou comprar sorvete porque cumpriu as duas condições.

TRUE & TRUE

# Exemplo2: Eu só quero sorvete se for de morango e do grande. O atendente da sorveteria, confirma que tem de morango (TRUE) mas que só tem do pequeno (FALSE). Por tanto **não** vou comprar sorvete porque **não** cumpriu as duas condições.

TRUE & FALSE

# Exemplo3: Eu só quero sorvete se for de morango e do grande. O atendente da sorveteria, confirma que tem do grande mas não de morango. Por tanto **não** vou comprar sorvete porque **não** cumpriu as duas condições.

FALSE & TRUE

# DISJUNÇÃO (operador | - ou)

#Exemplo1: Eu quero um sorvete que seja de morango **ou** de chocolate. O atendente confirma que tem sorvete de morango e de chocolate. Por tanto vou comprar porque tem dos dois sabores.

TRUE | TRUE

# Exemplo2: Eu quero um sorvete que seja de morango **ou** de chocolate. O atendente confirma que tem sorvete de morango mas não tem de chocolate. Por tanto vou comprar porque tem pelo menos um dos sabores.

TRUE | FALSE

# Exemplo3: Eu quero um sorvete que seja de morango **ou** de chocolate. O atendente confirma que **não** tem sorvete nem de morango nem de chocolate. Por tanto **não** vou comprar porque **não** tem nemhum dos sabores.

FALSE | FALSE

## Exemplos númericos


# Conjunção


# TRUE    &        TRUE     =       TRUE
# TRUE    &        FALSE    =       FALSE
# FALSE   &        TRUE     =       FALSE
# FALSE   &        FALSE    =      FALSE

2 < 6 & 5 > 9


# Disjunção

# TRUE     |       TRUE      =      TRUE
# TRUE     |       FALSE     =      TRUE
# FALSE    |       TRUE      =      TRUE
# FALSE    |       FALSE     =      FALSE

2 < 6 | 5 > 9


## Exercício

#1. Dada a hora em decimal, obter o resultado no formato HH:mm

# Passos
# a. Atribuir o valor da hora
# b. Separar o valor em parte inteira e decimal
# c. Converter parte decimal para minutos
# d. Extrair a parte inteira dos minutos
# e. Mostrar o resultado na tela


# a
hora <- 4.7333
# b
int.hora <- hora %/% 1
int.hora

dec.hora <- hora %% 1
dec.hora
# c
minutos <- dec.hora * 60
# d
int.minutos <- minutos %/% 1
# e
cat('A hora atual é ' , int.hora,':',int.minutos, sep = '')

# 2. O número de ocorrências registradas das 12 às 18 horas em um dia do mês de janeiro, em uma delegacia é dada por n(t) = -t^2 + 30t - 216, em que 12 <= t <= 18. Faça um programa para determinar o número de ocorrências em função da hora

#Passos
  
# a. Atribuir o valor da hora
# b. Determinar o número de ocorrências
# c. Apresentar o resultado na tela

t <- 
n <- -t^2 + 30*t - 216

cat('O número de ocorrências equivale a', n)

# 3. Calcule a cobertura (C) de um genoma atraves da formula:
# C = (n)*(l*p) / (g); onde n é igual ao número de reads sequenciadas, l é igual ao tamanho das reads, p pode ter o valor 1 se o protocolo usado for single-end e 2 se for paired-end, e g é igual ao tamanho aproximado do genoma.
# Foi sequenciado 20 milhoes de reads paired-end de 150bp para um genoma
# de bacteria estimado em 2Mb. Qual a cobertura da montagem?

## Resposta




# Volte para os slides






