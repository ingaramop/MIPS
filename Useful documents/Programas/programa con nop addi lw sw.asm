addi	$t0,$t5, 100;	#  $t0 = $t5 + 100;   #coloco un 100 en el registro t0
addi	$t1,$t5, 5;	#  $t1 = $t5 + 5;   #coloco un 5 en el registro t1
nop; #(hago tiempo para que las primeras dos hagan el wb)
nop; #(hago tiempo para que las primeras dos hagan el wb)
ADD $t2,$t0,$t1 ; #hago la suma y la almaceno en t2
nop;
nop;
sw $t2, 4, $t1; # guardo en la posición de memoria (t1+4 = 9), el valor del registro t2
lw  $t3, 9, $t6; # cargo la posición de memoria (t6 +9 =9) en el registro t3