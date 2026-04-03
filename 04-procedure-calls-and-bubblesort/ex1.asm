# 1) Com base no código fornecido no Teams que realiza uma chamada de procedimento no MIPS, faça
# o seguinte exercício. Faça um código em assembly do MIPS que dado um número, armazenado em t0, realiza
# uma chamada de procedimento que verifica se o número é maior que 100. Caso o número seja, após o
# retorno da função (procedimento) deve ser armazenado o valor 999 em t5. Caso contrário, deve ser
# armazenado o valor 100 em t5. 
#--------------------------------------------------------------------------------------------------------

# definição dos dados estaticos
.data
	msg: .asciiz "VERIFICA MAIOR QUE CEM\n"
	prompt: .asciiz "Digite um número: "
	msg_maior: .asciiz "Verdadeiro\n$t5 = "
	msg_menor: .asciiz "Falso\n$t5 = "

# inicio do codigo executavel
.text

main:
	# titulo do programa
	li $v0, 4		# funçao 4, imprimir string
	la $a0, msg		# load adress da string
	syscall
	
	# prompt
	li $v0, 4		# funçao 4, imprimir string
	la $a0, prompt		# load adress da string
	syscall
	
	# input
	li $v0, 5		# função 5, receber int
	syscall
	addi, $t0, $v0, 0	# guarda o valor de int retornado em $v0
	
	# chamada de procedimento
	jal verifica_maior_que_cem	# jump and link, guarda o valor de pc em $ra e pula para o rotulo
	
	# if statement
	beq $t9, $zero, maior 
	j menor	
	
	
maior:
	li $t5, 999	# atribuição de 999 para o caso de maior que 100
	
	# print string
	li $v0, 4
	la $a0, msg_maior
	syscall
	
	# print int
	li $v0, 1
	addi $a0, $t5, 0
	syscall
	
	j end
	

menor:
	li $t5, 100	# atribuição de 100 para o caso de menor ou igual a 100
	
	# print string
	li $v0, 4
	la $a0, msg_menor
	syscall
	
	# print int
	li $v0, 1
	addi $a0, $t5, 0
	syscall
	
	j end
	
	
verifica_maior_que_cem:
	# set if less than immediate
	slti $t9, $t0, 101		# se $t0 for menor que 101 $t9 recebe 1	
	jr $ra				# retorna para o registrador que pulou, $ra guarda valor do pc antes do pulo
	
	
end:
	li $v0, 10	# comando para encerrar o programa
	syscall










