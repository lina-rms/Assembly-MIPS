#Nome: Aline Ramos Lima
#Matricula: 22152297


.data
boasvindas:		.asciiz " ***   Olá :)   ***\n|  SEJA BEM VINDO  |\n\n"
opcao:			.asciiz "O que você deseja?\n1 - Somar, 2 - Subtrair, 3 - Multiplicar, 4 - Dividir\n"
msg:			.asciiz "Digite um numero: "
txt:  			.asciiz "\nDeseja fazer algum cálculo? \n| 1 |  -> Sim \n| 0 |  -> Nao\n"
finaliza:		.asciiz "O programa está sendo finalizado... \n\n TCHAU :)"
impossivel:     	.asciiz "Não é possível dividir por zero ;-; \n"
resultDivisao:  	.asciiz "O resultado da sua divisão é: "
resultMultiplicacao:  	.asciiz "O resultado da sua multiplicação é: " 
resultSubtracao:  	.asciiz "O resultado da sua subtração é: " 
resultSoma:  		.asciiz "O resultado da sua soma é: "

                                                              
                                                                                                                                                                                          
.text
main: 		  
		#Atribuindo valores aos registradores para serem utilizados como parâmetro de comando   	
		addi $s1, $zero, 1 #comando (1) para soma
		addi $s2, $zero, 2 #comando (2) para subtração
		addi $s3, $zero, 3 #comando (3) para multiplicação
  		addi $s4, $zero, 4 #comando (4) para divisão
  					
   		#Mostra para o usuário a mensagem de boas vindas
		li $v0, 4 #instrução para impressão de char ou String
   		la $a0, boasvindas #indica o endereço da mensagem
   		syscall #chama o sistema para executar o comando
   		
		#Confirmação se deseja iniciar a calculadora
while:		li $v0, 4 #instrução para impressão de char ou String
   		la $a0, txt #indica o endereço da mensagem
   		syscall #chama o sistema para executar o comando
   		
   		#Leitura de um inteiro do teclado
		li $v0, 5 #instrução para leitura de inteiros
   		syscall #chama o sistema para 
   		
		#Comparação  do valor informado
	 	beq $v0, $zero, fim #se o valor lido for igual a zero, pular para fim.
	 	
		#Impressão de mensagem com as opções
		li $v0, 4 #instrução para impressão de char ou String
   		la $a0, opcao #indica o endereço da mensagem
   		syscall #chama o sistema para executar o comando 
   		
		#Leitura de um inteiro do teclado
   		li $v0,5 #instrução para leitura de inteiros
   		syscall #chama o sistema para executar o comando
   		
		#Comparando o valor informado com o valor dos registradores de comando
		beq $v0, $s1, soma #se for igual a 1, soma
   	        beq $v0, $s2, subtrair #se for igual a 2, subtrai  
   		beq $v0, $s3, multiplicar #se for igual a 3, multiplica 
  	        beq $v0, $s4, dividir #se for igual a 4, divide
		j while  #retorno para o while
		        
		#Definição da mensagem de encerramento      
fim: 		li $v0, 4 #instrução para impressão de char ou String
   		la $a0, finaliza #indica o endereço da mensagem
   		syscall #chama o sistema para executar o comando
   		
   		#finalização do sistema
   		li $v0, 10 #instrução para encerrar o programa diretamente
 		syscall #chama o sistema para executar o comando
 		
 		
                #Zerando os temporários
soma:	        addi $t5, $zero, 0 #atribui o valor 0 para t5
   		addi $t6, $zero, 0 #...
   		addi $t7, $zero, 0 #...
   		
   		
		#Exibição de mensagem na tela (solicita numero ao usuário)
   		li $v0, 4 #instrução para impressão de char ou String
  	        la $a0, msg #indica o endereço da mensagem
   		syscall	#chama o sistema para executar o comando
   		
		#Leitura de um inteiro do teclado
   		li $v0,5 #instrução para leitura de inteiros
   		syscall #chama o sistema para executar o comando
   		
   		
		#Adicionando o valor lido no temporário
   		add $t5, $v0, $zero #t5 agora tem o valor digitado pelo usuário
   		
   		
		#Exibição de mensagem na tela (solicita numero ao usuário)
   		li $v0, 4 #instrução para impressão de char ou String
  	        la $a0, msg #indica o endereço da mensagem
   		syscall	#chama o sistema para executar o comando
   		
   		
   		#Leitura de um inteiro do teclado
   		li $v0,5 #instrução para leitura de inteiros
   		syscall #chama o sistema para executar o comando
   		
   		
		#Adicionando o valor no temporário  
   		add $t6, $v0, $zero #t6 agora tem o valor digitado pelo usuário
   		
   		
		#Soma dos valores
   		add $t7, $t5, $t6 #realiza a operação e armazena o resultado em t7
   		
   		#Mostrando mensagem na tela
   		li $v0, 4 #instrução para impressão de char ou String
   		la $a0, resultSoma #indica o endereço da mensagem
   		syscall #chama o sistema para executar o comando
   		
		#Mostrando o resultado na tela
   		li $v0, 1 #instrução para impressão de inteiros (imprime o que está em a0)
   		move $a0, $t7 #coloca o valor de t7 (resultado da operação) em a0
   		syscall #chama o sistema para executar o comando
   		
   		
   		
   		j while #retorno para o while 


		#Zerando os temporários
subtrair:       addi $t5, $zero, 0 #atribui o valor 0 para t5
   		addi $t6, $zero, 0 #...
   		addi $t7, $zero, 0 #...
   		
   		
		#Exibição de mensagem na tela (solicita numero ao usuário)
   		li $v0, 4 #instrução para impressão de char ou String
  	        la $a0, msg #indica o endereço da mensagem
   		syscall	#chama o sistema para executar o comando
   		
   		
		#Leitura de um inteiro do teclado
   		li $v0,5 #instrução para leitura de inteiros
   		syscall #chama o sistema para executar o comando
   		
   		
		#Adicionando o valor lido no temporário
   		add $t5, $v0, $zero #t5 agora tem o valor digitado pelo usuário
   		
   		
		#Exibição de mensagem na tela (solicita numero ao usuário)
   		li $v0, 4 #instrução para impressão de char ou String
  	        la $a0, msg #indica o endereço da mensagem
   		syscall	#chama o sistema para executar o comando
   		
   		
		#Leitura de um inteiro do teclado
   		li $v0,5 #instrução para leitura de inteiros
   		syscall #chama o sistema para executar o comando
   		
   		
		#Adicionando o valor lido no temporário
   		add $t6, $v0, $zero #t5 agora tem o valor digitado pelo usuário
   		
   		
		#Subtração dos valores
   		sub $t7, $t5, $t6 #realiza a operação e armazena o resultado em t7
   		
   		#Mostrando mensagem na tela
   		li $v0, 4 #instrução para impressão de char ou String
   		la $a0, resultSubtracao #indica o endereço da mensagem
   		syscall #chama o sistema para executar o comando
   		
   		#Mostrando o resultado na tela
   		li $v0, 1 #instrução para impressão de inteiros (imprime o que está em a0)
   		move $a0, $t7 #coloca o valor de t7 (resultado da operação) em a0
   		syscall	#chama o sistema para executar o comando
   		
   		
		
		j while ##Voltando para o While

   
		#Zerando os temporários
dividir:	addi $t5, $zero, 0 #atribui o valor 0 para t5
   		addi $t6, $zero, 0 #...
   		addi $t7, $zero, 0 #...
   		
   		
		#Exibição de mensagem na tela (solicita numero ao usuário)
   		li $v0, 4 #instrução para impressão de char ou String
  	        la $a0, msg #indica o endereço da mensagem
   		syscall	#chama o sistema para executar o comando
   		
   		
		#Leitura do inteiro do teclado
   		li $v0, 5 #instrução para leitura de inteiro
   		syscall #chama o sistema para executar o comando
   		
		#Adicionando o valor no temporário
   		add $t5,$v0,$zero #t5 agora tem o valor digitado pelo usuário
   		
   		
		#Exibição de mensagem na tela (solicita numero ao usuário)
   		li $v0, 4 #instrução para impressão de char ou String
  	        la $a0, msg #indica o endereço da mensagem
   		syscall	#chama o sistema para executar o comando
   		
   		
		#Leitura do inteiro do teclado
   		li $v0, 5 #instrução para leitura de inteiro
   		syscall #chama o sistema para executar o comando
   		
   		  
		#Adicionando o valor no temporário
   		add $t6, $v0, $zero #t6 agora tem o valor digitado pelo usuário
   		
   		
		#Dividindo os valores
		
		#tratamento de erro:
		beq $t6, $zero, imprimeImpossivel #se o valor de t6 (correspondente ao denominador) for igual a 0, pular para imprimeImpossivel
   		div $t7, $t5, $t6 #divisão dos números informados se t6 for diferente de 0, armazena o resultado em t7
   		
   		#Mostra ao usuário mensagem do resultado da operação
   		li $v0, 4 #instrução para impressão de char ou String
   		la $a0, resultDivisao #indica o endereço da mensagem
   		syscall #chama o sistema para executar o comando
   		
   		#Mostrando o resultado na tela
   		li $v0, 1 #instrução para impressão de inteiros (imprime o que está em a0)
   		move $a0, $t7 #coloca o valor de t7 (resultado da operação) em a0
   		syscall #chama o sistema para executar o comando	
	
		j while #Voltando para o While	
   		
   		
   		#mensagem do tramamento de erro
   		imprimeImpossivel:
   			#Imprimindo na tela mensagem de impossibilidade
			li $v0, 4 #instrução para impressão de char ou String
   			la $a0, impossivel #indica o endereço da mensagem
   			syscall #chama o sistema para executar o comando
   			
   			#Voltando para o While	
			j while
			
			      
		#Zerando os temporários
multiplicar:	addi $t5, $zero, 0 #atribui o valor 0 para t5
   		addi $t6, $zero, 0 #...
   		addi $t7, $zero, 0 #...
   		
		#Exibição de mensagem na tela (solicita numero ao usuário)
   		li $v0, 4 #instrução para impressão de char ou String
  	        la $a0, msg #indica o endereço da mensagem
   		syscall	#chama o sistema para executar o comando
   		
   		
		#Leitura do inteiro do teclado
   		li $v0, 5 #instrução para leitura de inteiro
   		syscall #chama o sistema para executar o comando
   		
		#Adicionando o valor lido no temporário
   		add $t5,$v0,$zero #t5 agora tem o valor digitado pelo usuário
   		
		#Exibição de mensagem na tela (solicita numero ao usuário)
   		li $v0, 4 #instrução para impressão de char ou String
  	        la $a0, msg #indica o endereço da mensagem
   		syscall	#chama o sistema para executar o comando
   		
		#Leitura do inteiro do teclado
   		li $v0, 5 #instrução para leitura de inteiro
   		syscall #chama o sistema para executar o comando
   		
		#Adicionando o valor lido no temporário 
   		add $t6, $v0, $zero #t6 agora tem o valor digitado pelo usuário
   		
		#Multiplicação dos valores
   		mul $t7, $t5, $t6 #realiza a opreção e armazena o resultado em t7
   		
   		#Mostrando mensagem na tela
   		li $v0, 4 #instrução para impressão de char ou String 
   		la $a0, resultMultiplicacao #indica o endereço da mensagem
   		syscall #chama o sistema para executar o comando
   		
   		#Mostrando o resultado na tela
   		li $v0, 1 #instrução para impressão de inteiros (imprime o que está em a0)
   		move $a0, $t7 #coloca o valor de t7 (resultado da operação) em a0
   		syscall #chama o sistema para executar o comando
   		
   				
		j while #Voltando para o While