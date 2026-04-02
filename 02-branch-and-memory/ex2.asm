#2) (7,0) Considere que as primeiras 10 posições da memória de dados do MIPS armazenam valores
#correspondentes a notas que os alunos da disciplina “Arquitetura de Computadores” obtiveram na P1. Faça
#um código em assembly do MIPS que deverá:
#• Armazenar a maior nota em t5;
#• Armazenar a menor nota em t6;
#• Armazenar a quantidade de notas menores que 5,0 em t7;
#OBS: O conteúdo das primeiras 10 posições da memória de dados do MIPS deverá ser inicializado com
#valores arbitrários para as notas , escolhidos por vocês, entre 0 e 10,no início do código.


# add $t0 - $t9
# depois armazenar na memoria com offset 4, partindo do 0
# $s0 = 268500992 primeiro endereço da memoria
# contador do loop  $t0
# contador do offset
# $t7 é um contador de menores que 5

li $s0, 268500992	# valor que aponta para a posição inicial da memoria

# atribuição das notas as variaveis temporarias
li $t0, 5
li $t1, 4		# atribui o valor direto na var
li $t2, 10
li $t3, 7
li $t4, 6
li $t5, 7
li $t6, 4
li $t7, 3
li $t8, 5
li $t9, 2

# gravação em memoria
sw $t0, 0($s0)		# registrar $t0 na posição da memoria apontada por $s0 com offset 0 (deslocamento)
sw $t1, 4($s0)
sw $t2, 8($s0)
sw $t3, 12($s0)
sw $t4, 16($s0)
sw $t5, 20($s0)
sw $t6, 24($s0)
sw $t7, 28($s0)
sw $t8, 32($s0)
sw $t9, 36($s0)

# atribuições
lw $t1, ($s0)		# puxa o valor da primeira nota, para armazenar em maior e menor
li $t0, 1		# inicialização contador
addi $t5, $t1, 0		# armazena a primeira nota como maior
addi $t6, $t1, 0		# armazena a primeira nota como menor

# loop (roda 9 vezes)
# 1 rodada do loop foi nas atribuições
loop:
add $s0, $s0, 4	# atribui +4 do offset para acessar a proxima possição
addi $t0, $t0, 1	# soma um no contador

bgt $t0, 10, end	# se contador maior que 10, encerra

lw $t1, ($s0)		# atribui em $t1 o valor armazenado na memoria na posição $s0 

bgt $t1, $t5, maior	# se valor tratado no loop maior que $t5 (maior ate entao), ir para label maior
blt $t1, $t6, menor

j loop

maior:
add $t5, $zero, $t1
j loop

menor:
add $t6, $zero, $t1
j loop

end:
