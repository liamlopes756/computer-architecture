# nome: Liam Vedovato Lopes
# ra: 00359597

# atribuicoes
li $t0, 1		# set x
li $t1, 2 		# set y

bne $t0, $t1, caso1	# branch if not equal 

beq $t0, $t1, caso2	# branch if equal

caso1:
li $t5, 5		# atribui 5 a $t5 caso $t1 e $t0 nao sejam iguais

j end			# pula para o final, impede a execucao do caso2

caso2:
li $t5, 6		# atribui 6 a $t5 caso $t1 e $t0 sejam iguais

end:
