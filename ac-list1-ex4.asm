# nome: Liam Vedovato Lopes
# ra: 00359597

# atribuiçoes
# li - load immediately
li $t0, 8	# x
li $t1, 4	# y
li $t2, 0 	# i

loop:
add $t1, $t1, $t0	# soma x + y e guarda em y
addi $t2, $t2, 1	# soma +1 em i

blt $t2, 3, loop	# branch if less than

bgt $t2, 2, end		# branch if greater than

end:
add $t5, $t0, $t1	# z = x + y
