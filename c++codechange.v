# Begin subroutine
vbsme:  
    li      $v0, 0                  # reset $v0 and $V1
    li      $v1, 0

    # insert your code here

    # c++ -> mips for Main()
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
