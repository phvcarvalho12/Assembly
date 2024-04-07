#Luis Augusto Coelho de Souza RA00331675
#Pedro Henrique Vianna Carvalho RA00333196

.data 
  prompt:	.asciiz "Digite um valor de radiacao (entre 1 e 100):"
.text

#envia a mensagem do prompt (Digite um valor de radiacao (entre 1 e 100))
addi $v0, $zero, 4
la $a0, prompt
syscall

#recebe o valor digitado
addi $v0, $zero,  5
syscall

#transfere o valor digitado de v0 para t0
add  $t0, $v0, $zero

#compara o valor recebido com 51, se for menor que 51, t1 recebe 1, se nao t1 recebe 0
slti $t1, $t0, 51

#se t1 for igual a 1, ou seja, o numero digitado eh menor que 51 pula para o label tipo 1 
beq $t1, 1, tipo1 

#se t0 for igual a 100 pula para o label tipo 3 
beq $t0, 100, tipo3

#se nenhum beq for executado, entao t5 recebe 2 para indicar o tipo 2
li $t5, 2
j fim #pula para finalizar o programa

tipo1: #se o numero digitado for menor que 51, o codigo vai para esse label e entao t5 recebe 1 para indicar o tipo 1
li $t5, 1
j fim #pula para finalizar o programa

tipo3: #se o numero digitado for 100  o codigo vai para esse label e entao t5 recebe 3 para indicar o tipo 3
li $t5, 3
j fim #pula para finalizar o programa

fim: #label para finalizar o programa
