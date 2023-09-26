# Begin subroutine
vbsme:  
    li      $v0, 0                     # reset $v0 and $v1
    li      $v1, 0
    # insert your code here
    addi    $sp, $sp, -4               # creating space on the stack pointer
    sw     $ra, 0($sp)                 # save return address
    ori    $s0, $zero, 0
    ori    $s1, $zero, 0
    jal    calcRightEdge
    jal    calcBottomEdge
    ori    $s4, $zero, 4000
    jal    SAD
    jal    checkEnd
    j    ShiftRight

main:
    addi    $sp, $sp, -4               # creating space on the stack pointer
    sw    $ra, 0($sp)                  # save return address
    ori    $a0, $zero, 0
    ori    $a1, $zero, 16
    ori    $a2, $zero, 1040
    jal    vbsme

calcRightEdge:
    lw    $t0, 4($a0)
    lw    $t1, 12($a0)
    sub    $s2, $t0, $t1
    nop

calcBottomEdge:
    lw    $t0, 0($a0)
    lw    $t1, 8($a0)
    sub    $s3, $t0, $t1
    nop

SAD:
    addi    $s5, $s0, 0
    addi    $s6, $s1, 0
    ori    $s7, $zero, 0
    addi    $sp, $sp, -4
    sw    $ra, 0($sp)
    jal    calcSAD
    j    shiftRightSAD

calcSAD:    
    sub    $t0, $s5, $s0
    sub    $t1, $s6, $s1
    lw    $t2, 12($a0)
    mul    $t2, $t2, $t1
    add    $t0, $t2, $t0
    sll    $t0, $t0, 2
    add    $t0, $t0, $a2
    lw    $t9, 0($t0)
    lw    $t0, 4($a0)
    mul    $t0, $t0, $s6
    add    $t0, $t0, $s5
    sll    $t0, $t0, 2
    add    $t0, $t0, $a1
    lw    $t8, 0($t0)
    slt    $t0, $t8, $t9
    beq    $t0, $zero, SUM
    sub    $t0, $t9, $t8
    add    $s7, $s7, $t0
    nop

SUM:        
    sub    $t0, $t8, $t9
    add    $s7, $s7, $t0
    nop

shiftRightSAD:    
    addi    $s5, $s5, 1
    jal    calcSAD
    j    checkRightSAD

checkEnd:    
    bne    $s0, $s2, notEnd
    bne    $s1, $s3, notEnd
    lw    $ra, 0($sp)
    addi    $sp, $sp, 4
    jr    $ra

checkRightSAD:    
    lw    $t0, 12($a0)
    add    $t0, $s0, $t0
    addi    $t0, $t0, -1
    beq    $t0, $s5, checkBottomSAD
    j    shiftRightSAD

checkBottomSAD:    
    lw    $t0, 8($a0)
    add    $t0, $s1, $t0
    addi    $t0, $t0, -1
    beq    $t0, $s6, EndSAD
    addi    $s6, $s6, 1
    addi    $s5, $s0, 0
    jal    calcSAD
    j    shiftRightSAD

ShiftUpRight:    
    addi    $s0, $s0, 1
    addi    $s1, $s1, -1
    jal    SAD
    beq    $s0, $s2, ShiftDown
    beq    $s1, $zero, ShiftRight
    j    ShiftUpRight

ShiftDownLeft:    
    addi    $s0, $s0, -1
    addi    $s1, $s1, 1
    jal    SAD
    beq    $s1, $s3, ShiftRight
    beq    $s0, $zero, ShiftDown
    j    ShiftDownLeft

ShiftDown:
    addi    $s1, $s1, 1
    jal    SAD
    jal    checkEnd
    nop
    j    ShiftDownLeft

ShiftRight:    
    addi    $s0, $s0, 1
    jal    SAD
    jal    checkEnd
    nop
    j    ShiftUpRight

notEnd:        
    nop

EndSAD:        
    lw    $ra, 0($sp)
    addi    $sp, $sp, 4
    slt    $t0, $s4, $s7
    beq    $t0, $zero, updateSAD
    nop

updateSAD:    
    add    $s4, $s7, $zero
    add    $v0, $s1, $zero
    add    $v1, $s0, $zero
    nop

 print_result:    
    add    $a0, $v0, $zero
    ori    $v0, $zero, 1
    nop
    ori    $a0, $zero, 1104
    ori    $v0, $zero, 4
    nop
    add    $a0, $v1, $zero
    ori    $v0, $zero, 1
    nop
    ori    $a0, $zero, 1104
    ori    $v0, $zero, 4
    nop
    ori    $a0, $zero, 1104
    ori    $v0, $zero, 4
    nop
    jr    $ra











