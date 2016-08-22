addi	$t2,$t8, 2;	#  $t2 = $t8 + 2   #coloco un 2 en el registro t2 (t8=0)
addi	$t5,$t8, 10;	#  $t5 = $t8 + 10   #coloco un 10 en el registro t5 (t8=0)
sw $t2, 5, $t8; # guardo en la posición de memoria (t8+5 = 5), el valor del registro t5 (t8=0)  -> Aquí debe actuar la unidad fwd para adelantar el valor de t5
lw $t3, 3($t2); # cargo la posición de memoria (t2 + 3 = 5) en el registro t3 
beq $t3, $t5, 3; #comienzo de un bucle que cuenta hasta t5 = 10 -> prueba la branch equal. Además, en el primer loop debe meter burbuja la hazard para esperar que lw lea t3
addi	$t3,$t3, 1;	#  t3 ++
j 4 # vuelvo a la instrucción 5 a ejecutar el bucle
addi	$s4,$t8, 50;	#  $s4 = $t8 + 50   #coloco un 50 en el registro s4 (t8=0)
addi	$s5,$t8, 500;	#  $s5 = $t8 + 500   #coloco un 500 en el registro s5 (t8=0)