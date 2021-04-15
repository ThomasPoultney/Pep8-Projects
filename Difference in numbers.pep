BR loop 
sum: .WORD 0x0000 
diff: .word 0x0000 
num1: .BLOCK 2 
num2: .BLOCK 2 
msg: .ASCII "Please enter two numbers or 0 to terminate: \x00"
msg1: .ASCII "The sum is: \x00"
msg2: .ASCII "The difference is \x00"
msg3: .ASCII "Goodbye! \x00"

;loops until the number 1 is entered
loop: STRO msg,d 
DECI num1,d 
LDA num1, d 
BREQ complete ;if the first number entered is 0 runs the complete loop
DECI num2,d 
ADDA num2,d
STA sum,d
STRO msg1,d
DECO sum,d
STRO msg2,d
LDA num1,d
SUBA num2,d
STA diff ,d
DECO diff,d 
BR loop ;runs loop again



complete: STRO msg3, d
STOP
.END 