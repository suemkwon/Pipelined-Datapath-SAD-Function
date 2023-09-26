#please read this 
#this basically does task 2 for the lab and a little bit of task 3 
#I was trying to get window0 and frame0 to work but i couldnt
#This code is poorly written


.text
.globl  vbsme

# Your program must follow the required search pattern.  

# Preconditions:
#   1st parameter (a0) address of the first element of the dimension info (address of asize[0])
#   2nd parameter (a1) address of the first element of the frame array (address of frame[0][0])
#   3rd parameter (a2) address of the first element of the window array (address of window[0][0])
# Postconditions:	
#   result (v0) x coordinate of the block in the frame with the minimum SAD
#          (v1) y coordinate of the block in the frame with the minimum SAD


# Begin subroutine
# Begin subroutine
vbsme:  
    li      $v0, 0                  # reset $v0 and $V1
    li      $v1, 0

    # insert your code here

    #li $t0, 1                       # variable for row;      i(row) = 1
    la $t0, window0
    la $t1, frame0
    la $t2, window5 #Change $t2 right now because this is very incorrect
    #li $t1, 1                       # variable for column;   i(col) = 1

    addi $t5, $zero, 0                # parameters for row (i-l) for loop
    #addi $t6, $t1, -1                # parameters for column (j-l) for loop

    lw $s2, 0($a0)                  # frame row size
    lw $s3, 4($a0)                  # frame column size

    lw $s4, 8($a0)                  # window row size
    lw $s5, 12($a0)                 # window column size 

    mul $s1, $s2, $s3               # frame (row * column)
    mul $s0, $t4, $s5               # window total size (row * column)

    #li $t5, 0                       # nunElements = 0


#    loop: beq $t5, $t4, exit       # numElements >= (row * column)


    loopi:
    addi   $t6, $zero, 0     # parameters for column (j-l) for loop
    jal    loopj                 # starts inner loopj
    addi   $t5, $t5, 1           # i++
    bne    $s4, $t5, loopi      # continue loopi if i < window row size

    #Before printing original box move window over and repeat loops
    #increase the address of loops? how? I think its t9 and t4
    #why does c address always throw error? 
    #  li  $t7, 0              # reset t7 to 0 and increase address?
    # # addi $t7, $t7, 2
    #  li  $t4, 0              # reset t4 to 0 and increase address?
    # # addi $t4, $t4, 2
    #  li  $t5, 0             # reset t5 to 0 and increase address?
    # li $t6, 0
    # # addi $t5, $t5, 0
    #  #addi $t6, $t6, 0
    #  #la $t1, frame0
    #  #addi $t1, $t1, 2 


    # addi $s7, $s7, 1    #If the frame has not reached every spot loop again
    #  bne $s7, 4, loopi

    j      print_result            
    j exit

    loopj:
      
    sll    $t7, $t5, 1       #16 for columns (Change this to to use $a whatever register length, I just used 1 to test a0)
    add    $t7, $t7, $t6     #(i*16) + j
    sll    $t7, $t7, 2       # 4 * ((i * 16) + j)  datasize of 4
    add    $t9, $t7, $t0     # address of A[i][j] A is window 
    lw     $t9, 0($t9)       # value of A[i][j]

    sll    $t4, $t6, 2         #change this to the column size of frame?? (B is frame)      
    add    $t4, $t4, $t5
    sll    $t4, $t4, 2       # 4 * ((j * 16) + i)
    add    $t4, $t4, $t1     # address of B[j][i]
    lw     $t4, 0($t4)       # value of B[j][i]
# put sum of differences into c and store stuff? ??  ? ?? ? ? ? 
    sub    $t4, $t4, $t9     # A[i][j] - B[j][i] 
    #absolute value delete this below
    sra $t3,$t4,31   
    xor $t4,$t4,$t3   #I have not used t3? t4 is output
    sub $t4,$t4,$t3 
    #absolute value delete this above (cant use sra?)
#t4 stores total sum of differences of window - frame, now move frame and repeat on right side of window
    add    $t7, $t7, $t2     # address of C[i][j]
    sw     $t4, 0($t7)       # store answer into C[i][j] 
    add    $v0, $v0, $t4 #stores total sum of difference for a window size of a, compare this val with other windows in a different spot
        #add code somewhere, if new v0 < old v0 then get index of top left address, dont use v0 either
    addi   $t6, $t6, 1       # j++
    bne    $s5, $t6, loopj   # continue loopj if j < window columns
    #returns back to i
    jr $ra


    #jal SAD                         # calculate SAD by calling SAD function

    #i dont think the code gets here
    lw $ra, 0($sp)                  # restore the return address
    addi $sp, $sp, 4                # restore the stack pointer

    exit:                            #exit loop
    jr $ra
   

# // C program to find sum of absolute differences
# // in all pairs in a sorted array of distinct numbers
# #include <stdio.h>
# 
# // Function to calculate sum of absolute difference
# // of all pairs in array
# // arr[]  --> array of elements
# int sumPairs(int arr[], int n)
# {
#     // final result
#     int sum = 0;
#     for (int i = n - 1; i >= 0; i--)
#         sum += i * arr[i] - (n - 1 - i) * arr[i];
#     return sum;
# }
# 
# // Driver program to run the case
# int main()
# {
#     int arr[] = { 1, 8, 9, 15, 16 };
#     int n = sizeof(arr) / sizeof(arr[0]);
#     printf("%d", sumPairs(arr, n));
#     return 0;
# }
 



#  minimum:        
#      lw      $t0, 0($a0)     # min=V[0]
#      addi    $t1,$0, 1       # i=1
#      add     $t3,$0, 0       # $t3=0

#  loop:
#      bge     $t1,$a1,done    # i>=n ?
#      mul     $t2, $t1, 4     # $t2 = $t1 * 4
#      add     $t2,$t2,$a0
#      lw      $t2, 0($t2)     # $t2 = V[i]
#      bge     $t2,$t0,next    # V[i] >= min ?
#      add     $t0,$t2,$0      # min=V[i]
#      add     $t3,$t1,$0      # max_index=max
#  next:
#      addi    $t1,$t1,1       # i++
#      j       loop            # Loop back
#  done: 
#      add     $v0,$t3,$0      # return min
#      jr      $ra
