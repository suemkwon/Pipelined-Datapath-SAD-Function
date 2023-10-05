# Begin subroutine
vbsme:  
    li      $v0, 0                  # reset $v0 and $V1
    li      $v1, 0

    # insert your code here

    li $t0, 1                       # variable for row;      i(row) = 1
    li $t1, 1                       # variable for column;   j(col) = 1

    lw $t2, 0($a0)                  # frame row size (i)
    lw $t3, 4($a0)                  # frame column size (j)

    lw $t6, 8($a0)                  # window row size (k)
    lw $t7, 12($a0)                 # window column size (l)

    mul $t4, $t2, $t3               # frame (row * column);     frame[i, j]
    mul $t8, $t6, $t7               # window (row * column);    window[k, l]

    li $t5, 0                       # nunElements = 0

    loop: slt $t4, $t5, exit        # numElements >= (row * column)

    addi $sp, $sp, -16               # create space on stack pointer
    sw $ra, 0($sp)                   # save return address
    addi $s0, $t0, -1                # parameters for row (i-l)
    addi $s1, $t1, -1                # parameters for column (j-l)

    jal SAD                         # calculate SAD by calling SAD function

    lw $ra, 0($sp)                  # restore the return address
    addi $sp, $sp, 16               # restore the stack pointer

    exit:                           # exit loop
    jr $ra
   
