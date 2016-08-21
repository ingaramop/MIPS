addi	$t5,$t8, 3;	#  $t5 = $t8 + 3   #coloco un 3 en el registro t5 (t8=0)
addi	$t6,$t8, 3;	#  $t5 = $t8 + 3;   #coloco un 3en el registro t6 (t8=0)
addi	$t7,$t8, 1;	#  $t7 = $t8 + 1;   #coloco un 1 en el registro t7 (t8=0)
beq $t6, $t5, 2;
sw $t7, 5, $t8; # guardo en la posición de memoria (t8+5 = 5), el valor del registro t7 (t8=0)
lw $t2, 5($t8); # cargo la posición de memoria (t8 + 5 = 5) en el registro t2 (la suma del offset queda 5, porque  t8=0)
and $t4, $t6, $t7;# t4 = t2 AND t5
add $t9, $t6, $t7; #t4 = t4 + t2
j 0;
