# Begin subroutine
vbsme:  
    li      $v0, 0                  # reset $v0 and $V1
    li      $v1, 0

    # insert your code here

    li $s0, 1                       # variable for row;      i(row) = 1
    li $s1, 1                       # variable for column;   i(col) = 1

    lw $s2, 0($a0)                  # row size
    lw $s3, 4($a0)                  # column size

    mul $s4, $s2, $s3               # frame (row * column)

    li $s5, 0                       # temp = 0

    loop: bgeq $s5, $s4, exit       # temp >= (row * column)

    addi $sp, $sp, ?                # create space on stack pointer
    sw $ra, 0($sp)                  # save return address
    subi $a3, $t0, 1                # parameters for row (i-l)
    subi $t0, $t1, 1                # parameters for column (j-l)

    jal SAD                         # calculate SAD by calling SAD function

    lw $ra, 0($sp)                  # restore the return address
    addi $sp, $sp, ?                # restore the stack pointer

    jr $ra
   
