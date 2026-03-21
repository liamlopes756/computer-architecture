# nome: Liam Vedovato Lopes
# ra: 00359597

# carrega as variaveis
li $t0, 2
li $t1, 1

ble $t0, $t1, menor	# branch if less or equal

bgt $t0, $t1, maior	# branch if greater than

menor:
add $t5, $t0, 0		# atribui $t0 ao $t5 se $t0 for menor que $t1
add $t6, $t1, 0

j end			# jump - pula para o final para nao executar o proximo caso em sequencia

maior:
add $t6, $t0, 0		# atribui $t0 ao $t6 se $t0 for maior que $t1
add $t5, $t1, 0

end:
