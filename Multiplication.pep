         BR      main        
sum:     .WORD   0x0000      
num1:    .BLOCK  2           ;
num2:    .BLOCK  2           ;
msg:     .ASCII  "Please enter first number to multiply \x00"
msg1:    .ASCII  "Please enter another number to multiply \x00"
msg2:    .ASCII  "The Answer is: \x00"



main:    STRO    msg,d       
         DECI    num1,d      
         STRO    msg1,d      
         DECI    num2,d      
         
loop:    LDA num1 , d
         BREQ complete
         LDA sum, d
         ADDA num2, d
         STA sum , d
         LDA num1, d
         SUBA 0x0001, i
         STA num1, d
         BR loop 



complete:        STRO msg2, d
                 DECO sum, d                          
                 STOP
                 .END                                    