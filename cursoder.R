
######################################################################## AULA DE R ##############################################################################
######################################################################################################
#############################COMANDOS BÁSICOS E SUAS RESPECTIVAS EXPLLICAÇÃO MATEMÁTICAS/ESTATÍSTISCAS DE FORMAS PRÁTICAS########################################
############# ESTRUTURADO POR LIZANDRA DUARTE DA SILVA - DOUTORANDA EM ECONOMIA, PELA UNIVERSIDADE FEDERAL DE JUIZ DE FORA ######################################
#################################################################################################################################################################

#<- Usar esse simbolo para atribuir valor
L <- 5 #>>> agora o valor de L vai ser lido como 5
# <- Esse simbolo indica comentário, ou seja, sempre que usar ele antes, não vai ser lido pelo R
getwd() #<- mostra a pasta onde estou localizado no R
dir() #<- mosta o conteúdo da pasta
setwd("~/") <- #eu entro na pasta que eu quero usar -PRECISA DO "~/"

rm(list = ls()) #apaga todo conteúdo da memória
# c() <- cria vetores, como o exemplo abaixo - obs: o vetor (apenas uma linha ou apenas uma coluna) na maioria das vezes vem no formato de linha, mesmo que seja uma coluna
#se quiser apresentar em formato coluna <- c(cbind)
x <- c(1,2,3,4,5)
n <- length(x)  #comprimento do vetor
mx <- sum(x)/n #média de x
vx <- t(x-mx)%*%(x-mx)/n  #variancia do x
ls() #mostra as váriaveis que tem na memória
# clt + enter é a mesma coisa que apertar run
# source executa o arquivo todo criado, tudo que tiver sido criado, ele vai executar
download.file("http://www.ufjf.br/rogerio_mattos/files/2018/05/AME-treinamento-de-R.zip","arquivo.zip")
#para fazer dowload de arquivo tem q fazer o passo acima e não esquecer que após o link tem que colocar virgula e dar algum nome com ponto e formato desejado
unzip("arquivo.zip") #para dezipar tudo que tem na pasta

# Removendo variáveis e objetos da memória
rm(list=ls())

# Fechando todos os gráficos
graphics.off()

#########################################################
#########      MATRIZES E VETORES #######################
#########################################################

# Para criar Matrizes precisa dar 3 comando, o primeiro comando do matrix é o conjunto de números que vão entrar na matriz, normalmente na forma de "vetor <- matrix (c())" #
#depois de fechado o parentese coloca virgula o número de linhas, virgula o número de colunas e fecha parenteses para rodar
A <- matrix(c(1,2,3,4),2,2) # O default do R monta por coluna
B <- matrix(c(1,2,3,4),2,2, byrow = T) # o byron = T faz a matriz em forma de linha

#forma de criar uma matriz sem usar o comando matrix, primeiro eu crio um vetor e depois eu uso o comando din(C) para dimensionar a matriz e por ordem nela
C <- c(10.4, 5.6, 3.1, 6.4, 21.7, 12.9, 83.2, 69.3, 31.4)
dim(C) <- c(3,3)
### Na multiplicação de vetores, quando a matriz guia é uma coluna, faz o produto normal, se a matriz guia for uma linha, se comportam como um escalar na subratação e adição.


# Diagonalizando vetores e matrizes (matriz diagonal é aquela que na diagonal tem pelo menos um elemento não nulo e os demais elementos são nulos)
#um elemento nulo é  zero
D <- rep(1,4) # O rep faz com que se repita o primeiro numero antes da virgula, pela quatidade do número após a virgula
D <- diag(D) # A função diag, converte o vetor criado acima em uma matriz diagonal - virou uma matriz identidade - Diag também permite tirar uma matriz diagonal de dentro de uma matriz
c_ <- diag(C) #c_ é o vetor diagonal da matriz C  - O UNDERLINE QUE TEM ESSA FUNÇÃO!!!


# numeros de linhas, colunas e elementos
ncol(A) #para saber o número de coluna da matriz
nrow(D) #para saber o número de linhas da matriz
length(C) #para saber o comprimento da matriz (número de linhas vezes o número de coluna, da o número de elementos dentro da matriz)

# Usando indexação para ver pedaços da matriz por meio do colchetes
C[1,1] #para ver a primeira casinha da matriz, o primeiro numero da informação da linha e o segundo da coluna
C[1,] #para ver os elementos da primeira linha, como não estou especificando a coluna
C[,2] #para ver os elementos colunas, se atentar q o R mostra o vetor coluna em forma de matriz, para fazer virar coluna, tenho qua aplicar a função cbind
C[2:3,2:3] #aqui estou informando intervalos, no caso aqui dois intervalos, o primeiro é olhado pela ótica da linha e o segundo pela ótica da coluna
C[-1,] #posso excluir linhas ou colunas. no caso quero excluir a primeira linha
C[-1,-3] #excluiu a primeira linha e terceira coluna


# Operações Matriciais 
A <- matrix(seq(1,9),3,3) #seq eu uso para criar vários números, de maneira crescente ou decrescente - no caso, está sendo de maneira crescente
u <- matrix(rep(1,3),3,1)


# Soma e subtracao -> Só pode ser feita se Aij = Bij, ou seja o número de linhas e colunas forem iguais nas duas matrizes!!!
E <- A + 3 #somou 3 a cada elemento da matriz
F <- A + C #soma de matrizes
G <- A - diag(u) #A diag(u) é uma matriz identidade, pela forma que foi criada, então vai ser a subtração de A pela matriz identidade

# Multiplicacao CUIDADO, NÃO POSSO USAR APENAS ASTERISCO, tenho que envolver ele com dois sinais de porcentagem #
#****Lembrar que para multiplicar uma matriz eu preciso que o número de colunas da primeira matriz coicida com o número de linhas da segunda matriz****
H <- A%*%u
J <- u%*%A # <== (pelo que foi desenvolvido no  propositalmente no R deu erro) aparece msg de erro!! pq o numero de colunas da primeira pelo numero de linhas da segunda são diferente, o que eu posso fazer, no caso em específico, é a transposta de u multiplicada por A 
J <- t(u)%*%A #o "t" é de transposta

#Não há divisão de matrizes, com a inversão não consegue assegurar que as duas matrizes seja definidas, então não há divisão de matrizes, só soma, subtração e multiplicação

#Dependecia Linear <- Um conjunto de vetores é linearmente dependente se e somente se, qualquer um deles puder ser expressos como uma combinação linear dos vetores restantes, portanto, seu resultado seria zero (vetor nulo)
#se há dependencia linear (multiplo um do outro), o resultado é zero.

#É LINEARMENTE INDEPENDENTE, quando é impossível expressar um vetor como multiplo do outro, no plano cartesiano, sua setas NÃO estão sobre uma UNICA linha reta. A independencia liner garante que a soluçãoa é única.

#Matriz transpostas <- A' -> 
#a linhas e colunas são intercambiadas, ou seja, se uma matriz A é (mxn) então sua transposta é (nxm). Uma matriz quadrada (nxn), entretanto, possui transposta com a mesma dimensão.
#Propriedade das transpostas
#1º)A transposta, da transposta é a matriz original (A')'=A
#2º) A transposta de uma soma é a soma das transposta <- (A+B)' = A'+B'
#3º) A transposta de um produto é o produto das transpostas na ordem inversa <- (AB)'= B'A' ->

# Inversao de matrizes
#precisa usar solve, mas para inverter matriz tem que seguir algumas regras:
# 1-)a matriz precisa ser quadrada (nº de linhas = nº de colunas), condição necessária para invertibilidade. Obs: nem toda matriz quadrada tem uma inversa!como por exemplo uma matriz quadrada singular 
# 2º)precisa ser não singular, ou seja precisa ter posto cheio, o determinate dela tem q ser não nulo
#matrizes singulares contém uma linha que é multipla de outra linha, tornando ela nula.
## Uma matriz nula tem seus elementos todos iguais a zero, não precisa ser quadrada, mas quando for se torna uma matriz idempotente. Mas se não for quadrada pode gerar dimensões diferentes.
#Matriz identidade - faz o papel de um escalar é quadrada 1 - tem números 1 em sua diagonal principal e números zero em todos os outros lugares <- IA=AI=A -> é especial pois possibilita inserir ou remover uma matriz identidade durante o processo de multiplicação sem afetar o produto de matrizes
#pela lei associativa <- A(mxn) * I(nxn) * B(nxp) =(AI)B = A(mxn) * B(nxp) <- o que mostra que presença ou ausência de I não afeta o produto #! Uma matriz identidade ao quadrado, ou multiplicada por ela mesma n vezes é igual a ela mesma, o que é chamado de matriz idempotente.
#3º) Se existir uma inversa, ela será única (o único modo para que a solução de uma matriz seja única é que suas linhas/colunas sejam linearmente independente).
#se as linhas e/ou colunas da matriz forem linearmente independente é uma condição suficiente (o que impede a inconsistência). Quando a matriz for quadrada e linearmente independente, será constituida uma matriz que atende a condição necessária e suficiente para invertibilidade.

#exemplos feitos no R e seus respectivos resultados
solve(A) # <= não inverte porque A é singular!!
solve(E) #o determinante dessa matriz não é zero, mas é quase igual a zero, da erro de arrendondamento, o computador não consegue fazer isso
solve(C)
solve(C)%*%C #a transposta de uma matriz multiplicada por ela, da uma matriz identidade
C%*%solve(C) #tbm da próxima a identidade

# Determinante 
# O determinante é uma matriz quadrada denotada por |A| e é um ESCALAR (número) unicamente definido, pode ter valor positivo ou negativo, o símbolo || não expressa valor absoluto.
# também é usado para verificação de dependencia linear, pois quando o determinante de uma matriz for igual a zero, é pq há dependência linear entre as linhas.
#Propriedades do determinante:
#1º) O determinante de uma matriz tem o mesmo valor de sua transposta
#2º) A troca de quaisquer duas linhas/colunas alterará o sinal, mas não o valor númerico do determinante
#3º) A multiplicação de uma linha/coluna por um escalar "k" multiplicará o valor do determinante por "k"
#4º) A adição  ou subtração de um multiplo de qualquer linha/coluna não altera o valor do determinante
#5º) Se uma linha/coluna for multiplo de qualquer outra linha/coluna, o determinante será zero. Logo, se o determinante for não nulo, as linhas/colunas serão linearmente independente

det(A) #se a matriz tiver determinante igual a zero, ela não tem inversa, ai ela é singular

#Posto da matriz

# O posto da matriz, seja ela quadrada ou não, mostra o número máximo (o menor de mxn, ex: uma matriz 3x5, os maiores determinantes possíveis, seja ele nulo ou não serão de ordem 3)de linhas linearmente independente (ou seja, não nula) que pode ser encontrado, se esse valor for "r" diz-se que o posto da matriz é "r".
#Ela terá posto cheio, se a ordem da matriz for igual ao posto.
#se o posto da matriz for igual a sua ordem, então haverá inversa, caso contrário, não há inversa.
qr(C)$rank #da o posto da matriz - se a ordem da matriz for igual a posto da matriz, então ela tem posto cheio e então ela tem inversa

#=================================================================

#  OPERADORES LOGICOS: <, <=, >, >=, == e != (desigualdade) em geral após o uso de um operador lógico, haverá uma resposta lógica: TRUE OR FALSE
#=================================================================
1 < 2 #true
2 == 2 
3 >= 4 #false,pq é falso, 3 não é maior e nem menor que 4
A != C #Podeos usar operadores lógicos para as Matrizes
A < 5


#=================================================================

#  FUNCOES DE CONTROLE ###toda função de controle eu abro e fecho a operação com sinal de colchetes###
#=================================================================

# Funçao 'if-else' :primeiro ela testa uma condição e se ela for verdadeira, ela executa uma certa operação, senão, vai executar outra operação que é a função else
opcao <- 0
if (opcao == 1) {print("Menino")} else {print("Menina")} #imprimiu "Menina" pois opção é zero, se fosse 1 seria menino

# Funçao 'if-elseif-else': Posso aliar varias opções alternativas #se mais/se mais
idade <- 70
if (idade < 18) {
  grupo <- 1
} else if (idade < 35) {
  grupo <- 2
} else if (idade < 65) {
  grupo <- 3
} else {
  grupo <- 4
}

# Funçao 'while' (enquanto) #repete varias vezes o mesmo procedimento até que essa função seja satisfeita, é um looping
w <- 0
while (w < 10) {
  w <- w + 1
  print(w)
} 

##enquanto w for menor que 10, ele vai aparecendo (no caso eu somei um ao próprio valor)

}
# Funcao 'for': faz o mesmo que o while, só que na while eu não defino um defino um limite superior para controlar valores e na função for sim
for (i in 1:10) {
  print(i)
}

# Criando uma matriz identidade com 'for'
I <- matrix(rep(0,9),3,3)
for (i in 1:3) {
  I[i,i] <- 1
}
print(I)

#I[i,i] <- 1 nesse caso ele entendeu que na matriz I para eu pegar nas casas que tem indices iguais, vamos atribuir o valor 1

######################################################13/02/2022

# LENDO DADOS 
# data() mostra os dados embutidos no próprio R
data()

# Dados Estaduais para as seguintes variáveis:
#  - PIB 2018 - Fonte IBGE
#  - População 2018 - Fonte IBGE
#  - Temperatura Média da Capital do Estado - Fonte Wikipédia
#    (acesso em 2/3/2021)
# função "read.table ()" vai ler o arquivo que vc inserir dentro do parenteses em aspas.
# head é sobre a primeira linha, se for ler a primeira linha como título <- head =T que quer dizer verdadeiro.
#sep <-para dizer qual separador vai ser utilizado 
#dec <- para mostrar qual caracter representa o separador de casa decimal
estados <- read.table("estados.csv", head=T, sep=";",dec=",")
estados

# Informações sobre o objeto de dados lido
mode(estados) #informa qual tipo de objeto <- ex: list é combinado varias coisas, como palavra e número, no vetor já não pode.
class(estados) #informa a estrutura de dados, no caso é um data. frame que tem formato tabela, se fosse matriz só poderia ter numero, na tabela pode ter número e letras.
str(estados) #dá o tipo de dado que é cada coluna, se é número, letra...  se tiver como letra aparece com aspas

# Vendo os dados
estados$Estado #  o cifrlão faz com que mostre apenas a primeira coluna

# vendo os dados de várias outras formas
cbind(estados$PIB) #função cbind faz linha virAR coluna e o mostra qual coluna eu quero
head(estados) #mostra só o comecinho da base de dados 6 primeiras 
tail(estados) #mostra o finalzinho da tabela 6 ultimas
estados[3,4] #o colchetes para encontrar a coordenada que eu quero
estados[10:15,4:5] #uma subregião
estados$POP[10:15]


# Nomes de variáveis na tabela de dados (data.frame)
names(estados) #mostra os titulos de cada coluna
colnames(estados) #tbm mostra titulos da colua
colnames(estados)[1] #titulos apenas da primeira coluna, pq ta indexado no colchetes
colnames(estados)[2]
rownames(estados) #titulos das linhas
rownames(estados)[5:10]

# Mudando o nome de uma variável na tabela de dados (data.frame)
colnames(estados)[4] <- "PIB2018" #colnames pode ser usado para mudar o número do titulo dessa forma, colocando o novo titulo em aspasn

# Analise basica dos dados
summary(estados) #da estatisticas descritivas basicas dos dados

# Filtrando os dados
subset(estados,estados$POP>5000000) #subset é para fazer o subconjunto, primeira informação é qual tabela eu quero extrair o subconjunto, depois informo uma condição, nesse caso, foi de a pop(que está com cifrão) maior que 5 milhões
subset(estados,estados$POP>5000000 & estados$PIB2018 <280000) #o & da a função de "e" na condição
estados[estados$POP>5000000,] #da para fazer a mesma coisa que o subset, TERMINO COM VIRGULA
estados[estados$POP>5000000 & estados$PIB2018 <280000,]
subset(estados,estados$POP>5000000 & estados$PIB2018 <280000, c(PIB2018,TMCAP))

# Simbolos comparativos < <= > >= 

# Simbolos logicos: & ("e") | ("ou")

 GRAFICOS

# Ver mais detalhes no capítulo 12 (Graphical Procedures) de: 
#     Venables and Smith. An Introduction to R. 
#     em https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf
#   
#======================================================================
download.file("https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf","arquivo.pdf")

plot(estados) #para plotar uma matriz de graficos, no caso por ser uma tabela, ela posta os dados de cada coluna de 2 a2 para vermos se tem correlações
plot(estados[4:6]) # aqui, estados[4:6] = estados[,4:6]

x <- estados$PIB2018 #to dando nome as variaveis
y <- estados$POP
w <- estados$TMCAP
sg <- estados$Sigla


plot(x,y)
barplot(x)
graphics.off() #apaga todos os gráficos

# Customizando um gráfico
plot(x,y,  type = "p", col = 2, cex = 0.4, main = "PIB vs POP") #type <o "p" é para dizer que pe para plotar pontos; col é a abreviatura de cor, 2 é o numero da cor vermelha, o cex é o tamanho do ponto e o main é o titulo
plot(x,y,  type = "l", col = 4, cex = 0.3, main = "PIB vs POP")
plot(x,y,  type = "c", col = 4, cex = 0.3, main = "PIB vs POP")
plot(x,y,  type = "b", col = 4, cex = 0.9, main = "PIB vs POP",
     sub = "Dados para o ano de 2018", xlab = "PIB", ylab = "POP") #

barplot(x, names.arg = sg, col = 2, main = "PIB de 2018",
        xlab = "Estados", ylab = "R$ Milhões", space = 1) #barplot é um gráfico de barra. names.arg é o nome dos argumentos, xlab é o nome dos dados para x e o msm para y, space é o espaçamento.
box() #colocar uma porta no grafico

pie(y,sg,main = "Distribuição Estadual da População Brasileira - 2018")#grafico de pizza


  




###################################################### REFERÊNCIAS BIBLIOGRÁFICAS ##################################################################################
#https://www.ufjf.br/rogerio_mattos/ensino/cursosrsm/
#CHIANG, A. C.; WAINWRIGHT, K. Matemática para economistas. 4ª. São Paulo: Elsevier, 2005.
