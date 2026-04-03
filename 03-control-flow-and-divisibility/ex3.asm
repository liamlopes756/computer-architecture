# 3) (3,0) Faça um código em assembly do MIPS que dados dois números, A e B, inteiros e positivos, digitados
# pelo usuário, calcula o máximo divisor comum destes dois números e armazena esse valor em t5.
# Dica: É possível utilizar a instrução rem para calcular o resto da divisão.
#-------------------------------------------------------------------------------------------------------------

# dados estaticos
# diretiva do mars
.data
	# rotulo marca o inicio da string
	msg: .asciiz "CALCULADORA DE MDC\n"
	nmr1: .asciiz "Digite o primeiro numero: "
	nmr2: .asciiz "Digite o segundo numero: "
	res: .asciiz "MDC = "

# diretivas são usadas pelo mars (assembler)
# codigo executavel é usado pela cpu

# indica o inicio do codigo executavel
.text
.globl main

main:
	#--------------
	# input
	#--------------
	li $v0, 4	# $v0 var chamada de função, 4 imprime string
	la $a0, msg	# $a0 var de passagem de parametro, $a0 recebe o endereço do começo da string
	syscall		# syscall chama a função com os parametros
	
	li $v0, 4	# $v0 var chamada de função, 4 imprime string
	la $a0, nmr1	# $a0 var de passagem de parametro, $a0 recebe o endereço do começo da string
	syscall		# syscall chama a função com os parametros
	
	li $v0, 5		# chama função 5, ler int
	syscall			# recebe int
	addi $t0, $v0, 0	# guarda o valor do retorno
	
	li $v0, 4	# $v0 var chamada de função, 4 imprime string
	la $a0, nmr2	# $a0 var de passagem de parametro, $a0 recebe o endereço do começo da string
	syscall		# syscall chama a função com os parametros
	
	li $v0, 5		# chama função 5, ler int
	syscall			# recebe int
	addi $t1, $v0, 0	# guarda o valor do retorno
	
	#---------
	# loop
	#---------
	loop:
		div $t0, $t1		# divide a/b
		mfhi $t9		# aux guarda resto
		addi $t0, $t1, 0	# guarda b em a
		addi $t1, $t9, 0	# guarda o resto em b
		beq $t1, 0, end		# se b == 0, end, a == mdc == $t0
		j loop
	
end:	
	li $v0, 4	# função 4, print sting
	la, $a0, res 	# load adress do começo da string
	syscall
	
	li $v0, 1	# função 1, print int
	addi $a0, $t0, 0	# load immediatly do int
	syscall		# imprime o int
	
	li $v0, 10	# função 10 encerra o programa
	syscall		# fim do programa








