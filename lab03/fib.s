.data # global variable are declared under the .data directive
n: .word 9 # n is the name of the variable .word means that the size of the data is one word 9 is the value assigned to n

.text
main:
    add t0, x0, x0 # curr_fib = 0 this is a comment
    addi t1, x0, 1 # next_fib = 1
    la t3, n # load the address of the label n      t3 = &n
    lw t3, 0(t3) # get the value that is stored at the address denoted by the label n t3 = *n
fib:
    beq t3, x0, finish # exit loop once we have completed n iterations
    add t2, t1, t0 # new_fib = curr_fib + next_fib;
    mv t0, t1 # curr_fib = next_fib;
    mv t1, t2 # next_fib = new_fib;
    addi t3, t3, -1 # decrement counter
    j fib # loop
finish:
    addi a0, x0, 1 # argument to ecall to execute print integer
    addi a1, t0, 0 # argument to ecall, the value to be printed
    ecall # print integer ecall
    addi a0, x0, 10 # argument to ecall to terminate
    ecall # terminate ecall
