         BR      loop        
sum:     .WORD   0x0000      
diff:    .WORD   0x0000      
num1:    .BLOCK  2           
num2:    .BLOCK  2           
msg:     .ASCII  "Please enter two numbers or 0 to terminate: \x00"
msg1:    .ASCII  "The sum is: \x00"
msg2:    .ASCII  "The difference is \x00"
msg3:    .ASCII  "Goodbye! \x00"
;loops until the number 1 is entered
loop:    STRO    msg,d   
         CHARO "\n",i     
         DECI    num1,d      
         LDA     num1,d      
         BREQ    complete    ;if the first number entered is 0 runs the complete loop
         DECI    num2,d      
         ADDA    num2,d      ;adds num2 to num1
         STA     sum,d       
         STRO    msg1,d      
         DECO    sum,d     
         CHARO "\n",i   
         STRO    msg2,d    
         LDA     num1,d      ;loads num1 into the accumulator
         SUBA    num2,d      ;subtracts num2 from the accumulater
         STA     diff,d      ;stores the differece between two numbers from accumulator.
         DECO    diff,d
         CHARO "\n",i       
         BR      loop        ;runs loop again to ask user for two new numbers
complete:STRO    msg3,d      
         STOP                
         .END                  