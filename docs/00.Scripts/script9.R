# Script 9 - Controle de fluxo

#### Configurações ####
# Algumas configurações antes de começar

# Code < Soft Wrap Long Lines 

# Para executar o comando desde o editor de código, é Ctrl + Enter

# Para executar o comando desde o console, pode ser só Enter

#### 9. Controle de fluxo ####

#### 9.1. Condicionamento if e else ####

# Estrutura

'''
if(condição){
  Bloco de comandos
}
''' 
# Se a condição for verdadeira, então o R executará os comandos

nota <- 8

if(nota >= 7){
  
  cat('Parabéns você foi aprovado')
  
}

n <- 6
if(n %% 2 == 0){
  
  cat(n, 'é um número par')
}


# Seleção Composta

'''
if(condição){
    Bloco de comandos do if
}else{
    bloco de comandos do else
  }
''' 

# Se a condição for verdadeira, então o R executará os comandos do if, senão o R executará os comando do else
  

nota <- 6

if(nota >= 7){
  
  cat('Parabéns você foi aprovado')
  
}else{
  cat('Sinto muito você foi reprovado')
}




n <- 7
if(n %% 2 == 0){
  
  cat(n, 'é um número par')
}else{
  cat(n, 'é um número impar')
}

# Seleção Encaedada ou Aninhada

''' 
if(condição){
    Bloco de comandos do if
}else{
  if(Condição){
    bloco de comandos do if
  }else{
    bloco de comandos do else
    }
  }
''' 

nota <- 2.5

if(nota >= 7){
  
  cat('Parabéns você foi aprovado')
  
}else{
  if(nota > 3){
    cat('Estude para recuperação')
  }else{
    cat('Sinto muito você foi reprovado')
  }
}



# Declaraçãp else if

''' 
if(condição){
  Bloco de comandos do if
}else if(Condição){
  bloco de comandos do else if
}else{
  bloco de comandos do else
}
}
'''

nota <- 7.1

if(nota >= 7){
  
  cat('Parabéns você foi aprovado')
  
}else if(nota > 3){
  cat('Estude para recuperação')
}else{
  cat('Sinto muito você foi reprovado')
}


##Algoritmo para o cálculo do IMC 
  
# 1. Receber os valores de peso e altura
# 2. Determinar o IMC
# 3. Se IMC < 18.5, escreva "você está abaixo do peso"
# 4. Caso contrário, se IMC <= 18.5 e IMC < 25, escreva "Seu peso está normal"
# 5. Caso contrário, se IMC >= 25 e IMC <= 30, escreva "Você esta acima do peso"
# 6. casó contrário, escreva "você está obeso"


peso <- 65 #kg
altura <- 1.62 #m
imc <- peso/altura^2

if(imc < 18.5){
  pr("você está abaixo do peso")
}else if(imc >= 18.5 & imc < 25 ){
  print("seu peso está normal")
}else if(imc >= 25 & imc <= 30){
  print("Você está acima do peso")
}else{
  print("você está obeso(a)")
}


# Exemplos com vetores

x <- c(1, 3, 10, 15)

if (class(x) == "numeric") {
  sum(x)
}


x <- c("a", "b", "c")

if (class(x) == "numeric") {
  sum(x)
}

# Devolvendo um resultado antecipadamente

minha_soma_NA <- function(x, y) {
  if (class(x) == "numeric" & class(y) == "numeric") {
    soma <- x + y
    return(soma)
  }
  
  NA
}

# Retorna a soma
minha_soma_NA(1, 2)


# Retorna NA
minha_soma_NA("a", "b")


# Retorna NA
minha_soma_NA(1, "b")


# Agora, devolvendo um erro
minha_soma_erro <- function(x, y) {
  if (class(x) != "numeric" | class(y) != "numeric") {
    stop("A classe dos objetos x e y deve ser numérica.")
  }
  
  x + y
}

# Retorna a soma
minha_soma_erro(1, 2)


# Retorna erro
minha_soma_erro("a", "b")


# Retorna erro
minha_soma_erro(1, "b")

#### 9.1. Iteradores: for e while ####

# for loop

numero_de_colunas <- ncol(mtcars)

for (coluna in 1:numero_de_colunas) {
  media <- mean(mtcars[,coluna])
  
  print(media)
}


numero_de_colunas <- ncol(mtcars)

# Antes, criamos um vetor vazio.
medias <- c()

for (coluna in 1:numero_de_colunas) {
  medias[coluna] <- mean(mtcars[,coluna])
}

medias

# while

i <- 1

while (i < 3){
  print(i)
  i <-  i + 1
}

# Volte para os slides
