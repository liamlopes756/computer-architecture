# 2) (3,0) Faça um código em assembly do MIPS que dado um número digitado pelo usuário, verifica se esse
# número é primo. Caso o número seja primo, deverá ser apresentada na tela a mensagem “Primo”, caso
# contrário, deverá ser apresentada na tela a mensagem “Não é Primo”. Considere que o usuário irá digitar
# um número inteiro e maior que 1.
#===============================================================================================


.data
	prompt: .asciiz "Digite um numero: "
	msg_p: .asciiz " e primo"
	msg_np: .asciiz " nao e primo"

.text
.globl main

main:
	li $v0, 4		# $v0 recebe valor 4, chama imprimir string
	la $a0, prompt		# load adress carrega o endereço onde começa a string como parametro
	syscall			# imprime a string
	
	# input
	li $v0, 5		# registra em $v0 o valor 5
	syscall			# chama a função 5, receber int
	addi $t2, $v0, 0	# registra em $t2 o retorno da funçao
	
	# inicialização das vars
	li $t1, 2		# registra o primeiro inteiro para fazer a divisão
	div $t2, $t1		# divide input por 2
	mflo $t0		# var controle, metade do imput, acaba o loop
	
	loop:
		div $t2, $t1	# divisão do input pelo dividendo
		mfhi $t9	# resto para a verificação
		
		beq $t1, $t0, primo		# se divisor for igual a metade do input, primo
		addi $t1, $t1, 1		# incrementa 1 no divisor		
		beqz $t9, nao_primo		# se resto = 0, não primo
		
		j loop
		
primo:
	li $v0, 1		# add $v0 função 0
	addi $a0, $t2, 0	# add o input como parametro $a0
	syscall			# imprime inteiro
	
	li $v0, 4		# $v0 recebe função 4
	la $a0, msg_p		# parametro $a0 recebe endereço da string
	syscall			# imprime string
	
	j end

nao_primo:
	li $v0, 1		# add $v0 função 0
	addi $a0, $t2, 0	# add o input como parametro $a0
	syscall			# imprime inteiro
	
	li $v0, 4		# $v0 recebe função 4
	la $a0, msg_np		# parametro $a0 recebe endereço da string
	syscall			# imprime string

end:
	li $v0, 10
	syscall





