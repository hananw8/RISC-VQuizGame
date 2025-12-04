.data
msgWelcome: .string "Welcome to Hanan's Quiz Game!\n"
msgQuestion1: .string "Question 1: What is the capital of France?\n1) Berlin\n2) Madrid\n3) Paris\n4) Rome\n"
msgQuestion2: .string "Question 2: Which planet is known as the Red Planet?\n1) Earth\n2) Mars\n3) Venus\n4) Jupiter\n"
msgQuestion3: .string "Question 3: Who wrote 'Romeo and Juliet'?\n1) Shakespeare\n2) Dickens\n3) Tolstoy\n4) Hemingway\n"
msgQuestion4: .string "Question 4: What is the largest ocean on Earth?\n1) Atlantic\n2) Pacific\n3) Indian\n4) Arctic\n"
msgScore: .string "Your final score is: "
newline: .ascii "\n"
space: .ascii " "

#Answers(3, 2, 1, 2)
correctAnswers: .byte 3, 2, 1, 2

.text
.globl main

main:
li a7, 4                  
la a0, msgWelcome
ecall

#Score is 0 at the start
li t0, 0                  

#Q1
li a7, 4                  
la a0, msgQuestion1
ecall

li a7, 5                  
ecall

#Check answer
la t2, correctAnswers     
lb t1, 0(t2)              
beq a0, t1, add_score1 

question2:
#Q2
li a7, 4                  
la a0, msgQuestion2
ecall

li a7, 5                  
ecall

#Check answer
lb t1, 1(t2)              
beq a0, t1, add_score2 

question3:
#Q3
li a7, 4                  
la a0, msgQuestion3
ecall

li a7, 5                  
ecall

#Check answer
lb t1, 2(t2)              
beq a0, t1, add_score3 

question4:
#Q4
li a7, 4                  
la a0, msgQuestion4
ecall

li a7, 5                  
ecall

#Check answer
lb t1, 3(t2)              
beq a0, t1, add_score4 

end_quiz:
#Print final score message
li a7, 4
la a0, msgScore
ecall

li a7, 1                  
add a0, zero, t0          
ecall

la a0, newline
li a7, 4
ecall

li a7, 10
ecall

add_score1:
addi t0, t0, 1
j question2

add_score2:
addi t0, t0, 1
j question3

add_score3:
addi t0, t0, 1
j question4

add_score4:
addi t0, t0, 1
j end_quiz