#Luis Augusto Coelho de Souza RA00331675
#Pedro Henrique Vianna Carvalho RA00333196

.data 
  Dividendo:.asciiz "Digite o dividendo:"
  Divisor: .asciiz "Digite o divisor: "
  MsgResto: .asciiz "O resto da divisao eh: "
.text

#Envia a mensagem para que o usuario digite o dividendo
addi $v0, $zero, 4
la $a0, Dividendo
syscall

#recebe o dividendo
addi $v0, $zero,  5
syscall

#armazena o dividendo em t0
add  $t0, $v0, $zero

#Envia a mensagem para que o usuario digite o divisor
addi $v0, $zero, 4
la $a0, Divisor
syscall

#recebe o divisor
addi $v0, $zero,  5
syscall

#armazena o divisor em t1
add  $t1, $v0, $zero

#compara o dividendo e o divisor, se o dividendo for menor que o divisor, t3 recebe 1 e nao havera processo de subtracao sucessiva pois o resto eh o proprio dividendo
slt $t3, $t0, $t1 

#se t3 for igual a 1, ou seja, dividendo menor que divisor, pula para o label resto que ja ira apresentar o resto
beq $t3, 1, resto

loop: #inicia o loop
	sub $t0, $t0, $t1 #faz a subtracao do dividendo pelo divisor
	slt $t2, $t0, $t1 #se t0 for menor que t1, isto eh, se nao houver mais como dividir o dividendo, t2 recebe 1
	beq $t2, 1, resto #se t2 for igual a 1 o resto foi encontrado e esta armazenado em t0
j loop #reinicia o loop caso t2 seja igual a 0 (resto nao encontrado)

resto: #label para sair do loop

#t5 recebe o resto armazenado em t0
add $t5, $zero, $t0

#apresenta a mensagem que vai preceder o resto
addi $v0, $zero, 4
la $a0, MsgResto
syscall

#apresenta o resto (valor armazenado em t5)
addi $v0, $zero, 1	
add $a0, $zero, $t5	
syscall 

