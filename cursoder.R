# Aprendizado de m�quina
#Aula de R
#Lizandra 01/02/2022

rm(list = ls()) #apaga todo conte�do da mem�ria
x <- c(1,2,3,4,5)
n <- length(x)  #comprimento do vetor
mx <- sum(x)/n #m�dia de x
vx <- t(x-mx)%*%(x-mx)/n  #variancia do x
ls() #mostra as v�riaveis que tem na mem�ria
# clt + enter � a mesma coisa que apertar run
# source executa o arquivo todo criado, tudo que tiver sido criado, ele vai executar
download.file("http://www.ufjf.br/rogerio_mattos/files/2018/05/AME-treinamento-de-R.zip")
download.file("http://www.ufjf.br/rogerio_mattos/files/2018/05/AME-treinamento-de-R.zip","arquivo.zip")
#para fazer dowload de arquivo tem q fazer o passo acima e n�o esquecer que ap�s o link tem que colocar virgula e "dar algum nome com ponto e formato desejado
unzip("arquivo.zip") #para dezipar tudo que tem na pasta

#=================================================================
#  AULA 3 - MATRIZES E FUNCOES DE CONTROLE
#=================================================================

# Removendo vari�veis e objetos da mem�ria
rm(list=ls())

# Fechando todos os gr�ficos
graphics.off()

#=================================================================
#  M A T R I Z E S
#=================================================================

# Criando Matrizes precisa dar 3 comando, o primeiro comando do matrix � o conjunto de n�meros que v�o entrar na matriz, normalmente na forma de "vetor <- matrix (c())" depois de fechado o parentese coloca virgula o n�mero de linhas virgula o n�mero de colunas e fecha parenteses para rodar
A <- matrix(c(1,2,3,4),2,2) # O default do R monta por coluna
B <- matrix(c(1,2,3,4),2,2, byrow = T) # o byron = T faz a matriz em forma de linha

C <- c(10.4, 5.6, 3.1, 6.4, 21.7, 12.9, 83.2, 69.3, 31.4)
dim(C) <- c(3,3) #forma de criar uma matriz sem usar o comando matrix, primeiro eu crio um vetor depois eu uso o comando din(C) para dimensionar a matriz e por ordem nela

# Diagonalizando vetores e matrizes (matriz diagonal � aquela que na diagonal tem pelo menos um elemento n�o nulo e os demais elementos s�o nulos)
D <- rep(1,4) # O rep faz com que se repita o primeiro numero antes da virgula, pela quatidade do n�mero ap�s a virgula
D <- diag(D) # A fun��o diag, converte o vetor criado acima em uma matriz diagonal - virou uma matriz identidade - Diag tamb�m permite tirar uma matriz diagonal de dentro de uma matriz
c_ <- diag(C) #c_ � o vetor diagonal da matriz C / O UNDERLINE QUE TEM ESSA FUN��O


# numeros de linhas, colunas e elementos
ncol(A) #para saber o n�mero de coluna da matriz
nrow(D) #para saber o n�mero de linhas da matriz
length(C) #para saber o comprimento da matriz (n�mero de linhas vezes o n�mero de coluna, da o n�mero de elementos dentro da matriz)

# Usando indexa��o para ver peda�os da matriz por meio do colchetes
C[1,1] #para ver a primeira casinha da matriz, o primeiro numero da informa��o da linha e o segundo da coluna
C[1,] #para ver os elementos da primeira linha, como n�o estou especificando a coluna
C[,2] #para ver os elementos colunas, se atentar q o R mostra o vetor coluna em forma de matriz, para fazer virar coluna, tenho qua aplicar a fun��o cbind
C[2:3,2:3] #aqui estou informando intervalos, no caso aqui dois intervalos, o primeiro � olhado pela �tica da linha e o segundo pela �tica da coluna
C[-1,] #posso excluir linhas ou colunas. no caso quero excluir a primeira linha
C[-1,-3] #excluiu a primeira linha e terceira coluna


# Opera��es Matriciais
A <- matrix(seq(1,9),3,3) #seq eu uso para criar v�rios n�meros, de maneira crescente ou decrescente - no caso, est� sendo de maneira crescente
u <- matrix(rep(1,3),3,1)


# Soma e subtracao
E <- A + 3 #somou 3 a cada elemento da matriz
F <- A + C #soma de matrizes
G <- A - diag(u) #A diag(u) � uma matriz identidade, pela forma que foi criada, ent�o vai ser a subtra��o de A pela matriz identidade

# Multiplicacao CUIDADO, N�O POSSO USAR APENAS ASTERISCO, tenho que envolver ele com dois sinais de porcentagem ****Lembrar que para multiplicar uma matriz eu preciso que o n�mero de colunas da primeira matriz coicida com o n�mero de linhas da segunda matriz****
H <- A%*%u
J <- u%*%A # <== vai dar msg de erro!! pq o numero de colunas da primeira pelo numero de linhas da segunda, o que eu posso fazer � a transposta de u multiplicada por A 
J <- t(u)%*%A #o "t" � de transposta

# Inversao precisa usar solve, mas para inverter matriz tem que seguir algumas regras, a matriz precisa ser quadrada, caso contrario, n�o h� matriz, e ela precisa ser n�o singular, ou seja precisa ter posto cheio, o determinate dela tem q ser n�o nulo
solve(A) # <= n�o inverte porque A � singular!!
solve(E) #o determinante dessa matriz n�o � zero, mas � quase igual a zero, da erro de arrendondamento, o computador n�o consegue fazer isso
solve(C)
solve(C)%*%C #a teansposta de uma matriz multiplicada por ela, da uma matriz identidade
C%*%solve(C) #tbm da pr�xima a identidade

# Determinante e Posto de matriz
det(A) #se a matriz tiver determinante igual a zero, ela n�o tem inversa, ai ela � singular
qr(C)$rank #da o posto da matriz - se a ordem da matriz for igual a posto da matriz, ent�o ela tem posto cheio e ent�o ela tem inversa