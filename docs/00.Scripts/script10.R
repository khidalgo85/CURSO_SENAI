# Script 10 - Pacotes

#### Configurações ####
# Algumas configurações antes de começar

# Code < Soft Wrap Long Lines 

# Para executar o comando desde o editor de código, é Ctrl + Enter

# Para executar o comando desde o console, pode ser só Enter

#### 10. Pacotes ####

#### 10.1. Instalação via CRAN ####

# A instalação de pacotes via CRAN é a forma mais simples de instalação, porém depende que o pacote esteja disponível aí, sendo o mais provável.

install.packages('ggplot2')  # instala o pacote ggplot2, específico para graficar

# uma vez instalado um pacote no R de seu computador, não precisará instalá-lo mais, porém toda vez que inicie uma sessão e precise de alguma(s) função(ões) dele é necessário "ativá-lo", usando a função library()

library(ggplot2) # Agora estão disponíveis todas as funções do ggplot2

#### 10.2. Instalação via GitHub ####

# A instalação de pacotes via GitHub é feita através de uma função do pacote devtools, que se encontra no CRAN. 

install.packages("devtools") # Nao precisa instalar ele cada vez que vai instalar pacotes via GitHub

devtools::install_github("benjjneb/dada2", ref="v1.16") # Quando você vai fazer uso de uma única função dentro dum pacote, não vale a pena ocupar memória da máquina para ativar o pacote inteiro. Então é melhor chamar a função com a seguinte sintaxe:

# pacote_x::função_do_pacote_x()

#### 10.3. Instalação via Bioconductor ####

# Existe outro grande repositório de pacotes especificamente volcados para a análise de dados biológicos, chamado Bioconductor

# Para instalar pacotes do Bioconductor, é necessário primeiro instalar por uma única vez o pacote BiocManager desde o CRAN

install.packages('BiocManager')

# Agora chame só a função install para instalar um pacote dentro do Bioconductor

BiocManager::install("dada2", version = "3.11")

#### 10.4. Instalação via arquivo zip ou tar.gz

# Se você for instalar um pacote zipado que está no seu computador ou num servidor, use o seguinte código:

install.packages("C:/caminho/para/o/arquivo/zipado/nome-do-pacote.zip", repos = NULL) # argumento repos = NULL, informa pro R que está sendo feita a instalação de um pacote armazenado localmente.

# Volte para os slides


