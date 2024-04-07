#Luis Augusto Coelho de Souza RA00331675
#Pedro Henrique Vianna Carvalho RA00333196

.data 
  prompt:	.asciiz "Digite um numero inteiro:"
  Msgquadrado: .asciiz "Quadrado Perfeito"
  Msgnehquadrado: .asciiz "Nao eh Quadrado Perfeito"
.text

#Envia a mensagem do prompt (Digite um numero inteiro
addi $v0, $zero, 4
la $a0, prompt
syscall

#recolhe o numero inteiro enviado e armazena-o em v0
addi $v0, $zero,  5
syscall

#armazena o numero inteiro enviado em t0
add  $t0, $v0, $zero

#se o numero recebido for 1 eh quadrado perfeito (a logica abaixo usa slt, nao permitindo comparar o caso menor igual, assim abrindo essa excecao)
beq $t0, 1, quadrado

loop: #inicia o loop
beq $t0, $t2, quadrado #se o numero recebido for igual a t2 eh quadrado perfeito. t2 armazenara as multiplicacoes sucessivas de inteiros (1x1,2x2,...), assim se t2 for igual a t0, t0 eh quadrado perfeito
	mul $t2, $t1, $t1 #t2 recebe a multiplicacao de dois inteiros iguais (0x0, 1x1, ...)
	addi $t1, $t1, 1 #t1 recebe o inteiro a ser multiplicado por si mesmo e nesta instrucao acumula em 1 para aumentar seu valor (t1 = t1 + 1)
	slt $t3, $t1, $t0 #se t1<t0, ou seja, se os numeros multiplicados forem menores que o recebido, t3 recebe 1 e o codigo retorna ao inicio do loop para procurar novamente
	beq $t3, 0, nehquadrado #se t3 for igual a 0, entao os numeros multiplicados ja sao maiores que o numero recebido, portanto este nao eh quadrado perfeito
j loop #caso o ultimo beq nao seja executado retorna ao comeco do loop para procurar novamente
	
quadrado: #se o numero for quadrado perfeito envia a mensagem correspondente
addi $v0, $zero, 4 	
la $a0, Msgquadrado		
syscall
j fim

nehquadrado: #se o numero nao for quadrado perfeito envia a mensagem correspondente
addi $v0, $zero, 4 	
la $a0, Msgnehquadrado		
syscall
j fim

fim: #label para finalizar o programa

	 
