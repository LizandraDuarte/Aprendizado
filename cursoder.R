# Aprendizado de máquina
#Aula de R
#Lizandra 01/02/2022

rm(list = ls()) #apaga todo conteúdo da memória
x <- c(1,2,3,4,5)
n <- length(x)  #comprimento do vetor
mx <- sum(x)/n #média de x
vx <- t(x-mx)%*%(x-mx)/n  #variancia do x
ls() #mostra as váriaveis que tem na memória
# clt + enter é a mesma coisa que apertar run
# source executa o arquivo todo criado, tudo que tiver sido criado, ele vai executar
download.file("http://www.ufjf.br/rogerio_mattos/files/2018/05/AME-treinamento-de-R.zip")
download.file("http://www.ufjf.br/rogerio_mattos/files/2018/05/AME-treinamento-de-R.zip","arquivo.zip")
#para fazer dowload de arquivo tem q fazer o passo acima e não esquecer que após o link tem que colocar virgula e "dar algum nome com ponto e formato desejado
unzip("arquivo.zip") #para dezipar tudo que tem na pasta

#=================================================================
#  AULA 3 - MATRIZES E FUNCOES DE CONTROLE
#=================================================================

# Removendo variáveis e objetos da memória
rm(list=ls())

# Fechando todos os gráficos
graphics.off()

#=================================================================
#  M A T R I Z E S
#=================================================================

# Criando Matrizes precisa dar 3 comando, o primeiro comando do matrix é o conjunto de números que vão entrar na matriz, normalmente na forma de "vetor <- matrix (c())" depois de fechado o parentese coloca virgula o número de linhas virgula o número de colunas e fecha parenteses para rodar
A <- matrix(c(1,2,3,4),2,2) # O default do R monta por coluna
B <- matrix(c(1,2,3,4),2,2, byrow = T) # o byron = T faz a matriz em forma de linha

C <- c(10.4, 5.6, 3.1, 6.4, 21.7, 12.9, 83.2, 69.3, 31.4)
dim(C) <- c(3,3) #forma de criar uma matriz sem usar o comando matrix, primeiro eu crio um vetor depois eu uso o comando din(C) para dimensionar a matriz e por ordem nela

# Diagonalizando vetores e matrizes (matriz diagonal é aquela que na diagonal tem pelo menos um elemento não nulo e os demais elementos são nulos)
D <- rep(1,4) # O rep faz com que se repita o primeiro numero antes da virgula, pela quatidade do número após a virgula
D <- diag(D) # A função diag, converte o vetor criado acima em uma matriz diagonal - virou uma matriz identidade - Diag também permite tirar uma matriz diagonal de dentro de uma matriz
c_ <- diag(C) #c_ é o vetor diagonal da matriz C / O UNDERLINE QUE TEM ESSA FUNÇÃO


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


# Soma e subtracao
E <- A + 3 #somou 3 a cada elemento da matriz
F <- A + C #soma de matrizes
G <- A - diag(u) #A diag(u) é uma matriz identidade, pela forma que foi criada, então vai ser a subtração de A pela matriz identidade

# Multiplicacao CUIDADO, NÃO POSSO USAR APENAS ASTERISCO, tenho que envolver ele com dois sinais de porcentagem ****Lembrar que para multiplicar uma matriz eu preciso que o número de colunas da primeira matriz coicida com o número de linhas da segunda matriz****
H <- A%*%u
J <- u%*%A # <== vai dar msg de erro!! pq o numero de colunas da primeira pelo numero de linhas da segunda, o que eu posso fazer é a transposta de u multiplicada por A 
J <- t(u)%*%A #o "t" é de transposta

# Inversao precisa usar solve, mas para inverter matriz tem que seguir algumas regras, a matriz precisa ser quadrada, caso contrario, não há matriz, e ela precisa ser não singular, ou seja precisa ter posto cheio, o determinate dela tem q ser não nulo
solve(A) # <= não inverte porque A é singular!!
solve(E) #o determinante dessa matriz não é zero, mas é quase igual a zero, da erro de arrendondamento, o computador não consegue fazer isso
solve(C)
solve(C)%*%C #a teansposta de uma matriz multiplicada por ela, da uma matriz identidade
C%*%solve(C) #tbm da próxima a identidade

# Determinante e Posto de matriz
det(A) #se a matriz tiver determinante igual a zero, ela não tem inversa, ai ela é singular
qr(C)$rank #da o posto da matriz - se a ordem da matriz for igual a posto da matriz, então ela tem posto cheio e então ela tem inversa
