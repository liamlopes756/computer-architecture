#1) Para este exercício criaremos um medidor imaginário de radiação.
#Serão feitas três classificações:
#• Tipo 1: Caso o valor de radiação esteja entre 1 e 30 (1 e 30 inclusos)
#• Tipo 2: Caso o valor de radiação esteja entre 31 e 79 (31 e 79 inclusos)
#• Tipo 3: Caso o valor de radiação seja maior ou igual a 80.
#Considere que o usuário irá digitar um valor de radiação, sendo ele um número inteiro positivo.
#Escreva um código em assembly do MIPS que implemente esse medidor. O programa deverá receber o
#número inteiro do usuário, e com base no valor deste número, tomar diferentes decisões.
#• Se o número estiver na classificação "Tipo 1", deverá ser armazenado o número 1 em t5.
#• Se o número estiver na classificação "Tipo 2", deverá ser armazenado o número 2 em t5.
#• Se o número estiver na classificação "Tipo 3", deverá ser armazenado o número 3 em t5.
# ==========================================================================================

# diretivas
# usada pelo mars

.data	# define dados estaticos usados pelo sistema

	# rotulo/label que define a posição de inicio da string na memoria 
	prompt: .asciiz "Digite o valor do nivel de radiacao: "
	msg: .asciiz "Radiação tipo: "

.text			# indica o começo do codigo executável
.globl main		# indica que a função principal é o main

main:
	# mensagem
	li $v0, 4		# função 4 exibir string
	la $a0, prompt		# la load adress da string
	syscall
	
	# input
	li $v0, 5	# $v0 recebe o codigo do syscall, 5 é receber int
	syscall 	# syscall chama a função 5, puxa o codigo diretamente de $v0, var especial
	add $t0, $v0, $zero	# $v0 recebe o retorno da função e move para $t0

	ble $t0, 30, tipo1	# se menor ou igual a 30 tipo 1
	ble $t0, 79, tipo2	# se menor ou igual a 79 e maior que 30 tipo 2
	bge $t0, 80, tipo3	# se maior ouu igual a 80 tipo 3

tipo1:
	li $t5, 1
	j end

tipo2:
	li $t5, 2
	j end

tipo3:
	li $t5, 3

end:	
	# imprimir string (codigo 4)
	li $v0, 4
	la $a0, msg
	syscall
	
	# imprime inteiro (codigo 1)
	li $v0, 1
	addi $a0, $t5, 0
	syscall 
	
	li $v0, 10		# comando 10 finaliza o programa
	syscall			# chama a função armazenada em $v








