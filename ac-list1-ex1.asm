# nome: Liam Vedovato Lopes
# ra: 00359597

# atribuição de variaveis
li $t0, 3				
li $t1, 5	# carrega na variavel $t1 o valor 5
li $t2, 9	# li - load immediately
li $t3, 5
li $t4, 9
li $t5, 7

# soma
addi $t6, $t0, 0 	# soma em $t6, $t1 + 0
add $t6, $t6, $t1	# add - guarda em uma variavel a soma os dois proximos valores
add $t6, $t6, $t2	# addi - add immediately
add $t6, $t6, $t3
add $t6, $t6, $t4
add $t6, $t6, $t5

