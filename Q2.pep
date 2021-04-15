BR main 
msg1: .ASCII "Enter a positive integer: \x00"
msg2: .ASCII "Goodbye! \x00"
input: .BLOCK 2 
num2: .BLOCK 2 
two: .WORD 0x0002 

main:    STRO msg1,d 
         DECI input,d 
         LDA input,d 
         STA num2,d
isOdd:   SUBA two,d ;subtracts two from the accumalator until it either equals zero or -1
         BRLT odd ;if it equals -1 the number is odd therefore branches to even 'subroutine'
         BREQ even ;if it equals 0 it is even therefore branches to even 'subroutine'
         BR isOdd ;if it does not = -1 or 0 it repeats loop
odd:     LDA num2,d                
         ADDA num2,d 
         ADDA num2,d 
         ADDA 0x0001,i ;multiplies number by 3 and adds 1
         STA num2,d ;by adding the number to itself 3 times
         DECO num2,d 
         CHARO "\n",i
         BR isDone
even:    LDA num2,d         
         ASRA                ;applies arithmatic logic shift right to divide by two
         STA num2,d          ;Outputs answer and branches to isDone loop to check if the number is one
         DECO num2,d
         CHARO "\n",i 
         BR isDone        
isDone: SUBA 0x0001,i ;checks if the collatz injecture is finished by subtracting 
                      ;one from accumalator and checking if it equals zero
        BREQ complete ;if it equals zero branches to complete section of code.
        LDA num2,d 
        BR isOdd ;if it does not equal zero the process starts again
       
complete: STRO msg2,d ;outputs goodbye and stops the program
STOP 
.END 