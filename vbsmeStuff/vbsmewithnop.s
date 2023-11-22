#  Fall 2022
#  Team Members:    
#  % Effort    :   
#
# ECE369A,  
# 

########################################################################################################################
### data
########################################################################################################################
.data
# test input
# asize : dimensions of the frame [i, j] and window [k, l]
#         i: number of rows,  j: number of cols
#         k: number of rows,  l: number of cols  
# frame : frame data with i*j number of pixel values
# window: search window with k*l number of pixel values
#
# $v0 is for row / $v1 is for column


# test 1 For the 16X16 frame size and a 8X4 window size
# The result should be 3, 2
asize1:  .word    16, 16, 8, 4    #i, j, k, l
frame1:  .word    7, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
         .word    7, 8, 8, 8, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 
         .word    7, 8, 8, 8, 2, 8, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 
         .word    7, 8, 8, 8, 8, 8, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 
         .word    0, 4, 8, 8, 8, 8, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 
         .word    0, 5, 8, 8, 8, 8, 30, 35, 40, 45, 50, 55, 60, 65, 70,  75, 
         .word    0, 6, 8, 8, 8, 8, 36, 42, 48, 54, 60, 66, 72, 78, 84, 90, 
         .word    0, 4, 8, 8, 8, 8, 42, 49, 56, 63, 70, 77, 84, 91, 98, 105, 
         .word    0, 1, 8, 8, 8, 8, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 
         .word    0, 1, 8, 8, 8, 8, 54, 63, 72, 81, 90, 99, 108, 117, 126, 135, 
         .word    0, 10, 8, 8, 8, 8, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 
         .word    0, 11, 22, 33, 44, 55, 66, 77, 88, 99, 110, 121, 132, 143, 154, 165, 
         .word    9, 9, 9, 9, 48, 60, 72, 84, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    9, 9, 9, 9, 52, 65, 78, 91, 104, 114, 130, 143, 1, 2, 3, 4, 
         .word    9, 9, 9, 9, 56, 70, 84, 98, 112, 126, 140, 154, 2, 3, 4, 5, 
         .word    9, 9, 9, 9, 60, 75, 90, 105, 120, 135, 150, 165, 3, 4, 5, 6 
window1: .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8 


# test 2 For the 32X32 frame and a 8X16 window size
# The result should be 16, 0
asize2:  .word    32, 32, 8, 16    #i, j, k, l
frame2:  .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8
         
window2: .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         

# test 3 For the 16X16 frame and a 4X8 window size
# The result should be 12, 0
asize3:  .word    16, 16, 4, 8    #i, j, k, l
frame3:  .word    9, 9, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 6, 7, 7, 7, 
         .word    9, 7, 7, 7, 7, 5, 6, 7, 8, 9, 10, 11, 6, 7, 7, 7, 
         .word    9, 7, 7, 7, 7, 3, 12, 14, 16, 18, 20, 6, 6, 7, 7, 7, 
         .word    9, 7, 7, 7, 7, 4, 18, 21, 24, 27, 30, 33, 6, 7, 7, 7, 
         .word    0, 7, 7, 7, 7, 5, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 
         .word    0, 5, 3, 4, 5, 6, 30, 35, 40, 45, 50, 55, 60, 65, 70,  75, 
         .word    0, 6, 12, 18, 24, 30, 36, 42, 48, 54, 60, 66, 72, 78, 84, 90, 
         .word    0, 4, 14, 21, 28, 35, 42, 49, 56, 63, 70, 77, 84, 91, 98, 105, 
         .word    0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 
         .word    0, 9, 18, 27, 36, 45, 54, 63, 72, 81, 90, 99, 108, 117, 126, 135, 
         .word    0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 
         .word    0, 11, 22, 33, 44, 55, 66, 77, 88, 99, 110, 121, 132, 143, 154, 165, 
         .word    9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3
         
window3: .word    9, 9, 9, 9, 9, 9, 9, 9, 
         .word    9, 9, 9, 9, 9, 9, 9, 9, 
         .word    9, 9, 9, 9, 9, 9, 9, 9, 
         .word    9, 9, 9, 9, 9, 9, 9, 9


                  
# test 4 For the 16X16 frame and a 8X8 window size
# The result should be 8, 3
asize4: .word    16, 16, 8, 8    #i, j, k, l
frame4: .word    9, 19, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    9, 91, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    9, 9, 19, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    9, 9, 91, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    91, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    9, 19, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    9, 91, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    1, 2, 3, 9, 9, 19, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 
         .word    1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 
         .word    1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 
         .word    1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 
         .word    1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 
         .word    1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 
         .word    1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 
         .word    1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 
         .word    1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0
                  
window4:   .word    9, 9, 9, 9, 9, 9, 9, 9, 
            .word    9, 9, 9, 9, 9, 9, 9, 9, 
            .word    9, 9, 9, 9, 9, 9, 9, 9, 
            .word    9, 9, 9, 9, 9, 9, 9, 9, 
            .word    9, 9, 9, 9, 9, 9, 9, 9, 
            .word    9, 9, 9, 9, 9, 9, 9, 9, 
            .word    9, 9, 9, 9, 9, 9, 9, 9, 
            .word    9, 9, 9, 9, 9, 9, 9, 9
   

# test 5 For the 32X32 frame and a 4X4 window size
# The result should be 17, 16 since the updated SAD location condition is SAD <= currentMinimum (less OR EQUAL)
asize5: .word    32, 32, 4, 4    #i, j, k, l
frame5: .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
                  
window5:   .word    10, 10, 10, 10, 
            .word    10, 10, 10, 10, 
            .word    10, 10, 10, 10, 
            .word    10, 10, 10, 10




         
newline: .asciiz     "\n" 


########################################################################################################################
### main
########################################################################################################################

.text

.globl main

main: 
nop
nop
nop
nop
nop
    addi    $sp, $sp, -4    # Make space on stack
    nop
nop
nop
nop
nop
    sw      $ra, 0($sp)     # Save return address
    nop
nop
nop
nop
nop
         
    # Start test 1 
    ############################################################
    la      $a0, asize1     # 1st parameter: address of asize1[0]
    nop
nop
nop
nop
nop
    la      $a1, frame1     # 2nd parameter: address of frame1[0]
    nop
nop
nop
nop
nop
    la      $a2, window1    # 3rd parameter: address of window1[0] 
    nop
nop
nop
nop
nop
   
    jal     vbsme           # call function
    nop
nop
nop
nop
nop
    #jal     print_result    # print results to console
    
    ############################################################
    # End of test 1   

   
    # Start test 2 
    ############################################################
    nop
nop
nop
nop
nop
    la      $a0, asize2     # 1st parameter: address of asize2[0]
    nop
nop
nop
nop
nop
    la      $a1, frame2     # 2nd parameter: address of frame2[0]
    la      $a2, window2    # 3rd parameter: address of window2[0] 
    nop
nop
nop
nop
nop
   
    jal     vbsme           # call function
    nop
nop
nop
nop
nop
    #jal     print_result    # print results to console
    ############################################################
    # End of test 2   
                    
               
    # Start test 3
    ############################################################
    nop
nop
nop
nop
nop
    la      $a0, asize3     # 1st parameter: address of asize3[0]
    nop
nop
nop
nop
nop
    la      $a1, frame3     # 2nd parameter: address of frame3[0]
    nop
nop
nop
nop
nop
    la      $a2, window3    # 3rd parameter: address of window3[0] 
    nop
nop
nop
nop
nop

    jal     vbsme           # call function
    nop
nop
nop
nop
nop
    #jal     print_result    # print results to console 
    ############################################################
    # End of test 3   
      
      
    # Start test 4 
    ############################################################
    nop
nop
nop
nop
nop
    la      $a0, asize4     # 1st parameter: address of asize4[0]
    nop
nop
nop
nop
nop
    la      $a1, frame4     # 2nd parameter: address of frame4[0]
    nop
nop
nop
nop
nop
    la      $a2, window4    # 3rd parameter: address of window4[0] 
    nop
nop
nop
nop
nop

    jal     vbsme           # call function
    nop
nop
nop
nop
nop
    #jal     print_result    # print results to console
    ############################################################
    # End of test 4   
   
   
    # Start test 5
    ############################################################
    nop
nop
nop
nop
nop
    la      $a0, asize5     # 1st parameter: address of asize5[0]
    nop
nop
nop
nop
nop
    la      $a1, frame5     # 2nd parameter: address of frame5[0]
    nop
nop
nop
nop
nop
    la      $a2, window5    # 3rd parameter: address of window5[0] 
    nop
nop
nop
nop
nop

    jal     vbsme           # call function
    nop
nop
nop
nop
nop
    #jal     print_result    # print results to console
    ############################################################
    # End of test 5
nop
nop
nop
nop
nop
    lw      $ra, 0($sp)         # Restore return address
    nop
nop
nop
nop
nop
    addi    $sp, $sp, 4         # Restore stack pointer
    nop
nop
nop
nop
nop
    j       end_program                 # Return
    nop
nop
nop
nop
nop

end_program:                    # remain in infinite loop
nop
nop
nop
nop
nop
	j end_program
    nop
nop
nop
nop
nop
# ################### Print Result ####################################
# print_result:
#     #Printing $v0
#    add     $a0, $v0, $zero     # Load $v0 for printing
#    li      $v0, 1              # Load the system call numbers
#    syscall
   
#     #Print newline.
#    la      $a0, newline          # Load value for printing
#    li      $v0, 4                # Load the system call numbers
#    syscall
   
#    # Printing $v1
#    add     $a0, $v1, $zero      # Load $v1 for printing
#    li      $v0, 1                # Load the system call numbers
#    syscall

#    # Print newline.
#    la      $a0, newline          # Load value for printing
#    li      $v0, 4                # Load the system call numbers
#    syscall
   
#    # Print newline.
#    la      $a0, newline          # Load value for printing
#    li      $v0, 4                # Load the system call numbers
#    syscall
   
#    jr      $ra                   #function return

# #####################################################################
### vbsme
#####################################################################


# vbsme.s 
# motion estimation is a routine in h.264 video codec that 
# takes about 80% of the execution time of the whole code
# given a frame(2d array, x and y dimensions can be any integer 
# between 16 and 64) where "frame data" is stored under "frame"  
# and a window (2d array of size 4x4, 4x8, 8x4, 8x8, 8x16, 16x8 or 16x16) 
# where "window data" is stored under "window" 
# and size of "window" and "frame" arrays are stored under "asize"

# - initially current sum of difference is set to a very large value
# - move "window" over the "frame" one cell at a time starting with location (0,0)
# - moves are based circular pattern 
# - for each move, function calculates  the sum of absolute difference (SAD) 
#   between the window and the overlapping block on the frame.
# - if the calculated sum of difference is LESS THAN the current sum of difference
#   then the current sum of difference is updated and the coordinate of the top left corner 
#   for that matching block in the frame is recorded. 

# for example SAD of two 4x4 arrays "window" and "block" shown below is 3  
# window         block
# -------       --------
# 1 2 2 3       1 4 2 3  
# 0 0 3 2       0 0 3 2
# 0 0 0 0       0 0 0 0 
# 1 0 0 5       1 0 0 4

# program keeps track of the window position that results 
# with the minimum sum of absolute difference. 
# after scannig the whole frame
# program returns the coordinates of the block with the minimum SAD
# in $v0 (row) and $v1 (col) 


# Sample Inputs and Output shown below:
# Frame:
#
#  0   1   2   3   0   0   0   0   0   0   0   0   0   0   0   0 
#  1   2   3   4   4   5   6   7   8   9  10  11  12  13  14  15 
#  2   3  32   1   2   3  12  14  16  18  20  22  24  26  28  30 
#  3   4   1   2   3   4  18  21  24  27  30  33  36  39  42  45 
#  0   4   2   3   4   5  24  28  32  36  40  44  48  52  56  60 
#  0   5   3   4   5   6  30  35  40  45  50  55  60  65  70  75 
#  0   6  12  18  24  30  36  42  48  54  60  66  72  78  84  90 
#  0   7  14  21  28  35  42  49  56  63  70  77  84  91  98 105 
#  0   8  16  24  32  40  48  56  64  72  80  88  96 104 112 120 
#  0   9  18  27  36  45  54  63  72  81  90  99 108 117 126 135 
#  0  10  20  30  40  50  60  70  80  90 100 110 120 130 140 150 
#  0  11  22  33  44  55  66  77  88  99 110 121 132 143 154 165 
#  0  12  24  36  48  60  72  84  96 108 120 132   0   1   2   3 
#  0  13  26  39  52  65  78  91 104 117 130 143   1   2   3   4 
#  0  14  28  42  56  70  84  98 112 126 140 154   2   3   4   5 
#  0  15  30  45  60  75  90 105 120 135 150 165   3   4   5   6 

# Window:
#  0   1   2   3 
#  1   2   3   4 
#  2   3   4   5 
#  3   4   5   6 

# cord x = 12, cord y = 12 returned in $v0 and $v1 registers

.text
.globl  vbsme

# Your program must follow circular search pattern.  

# Preconditions:
#   1st parameter (a0) address of the first element of the dimension info (address of asize[0])
#   2nd parameter (a1) address of the first element of the frame array (address of frame[0][0])
#   3rd parameter (a2) address of the first element of the window array (address of window[0][0])
# Postconditions:	
#   result (v0) x coordinate of the block in the frame with the minimum SAD
#          (v1) y coordinate of the block in the frame with the minimum SAD


# Begin subroutine
vbsme:  
nop
nop
nop
nop
nop
    addi      $v0, $zero, 0              # reset $v0 and $V1
    addi      $v1,$zero, 0
nop
nop
nop
nop
nop
    # insert your code here
   
    # insert your code here
    addi    $sp, $sp, -4        # create space on the stack pointer
    nop
nop
nop
nop
nop
    sw      $ra, 0($sp)         # store the return address

    # define variables
nop
nop
nop
nop
nop
    lw      $s0, 0($a0)         # frame row in $s0
    
    nop
nop
nop
nop
nop
    lw      $s1, 4($a0)         # frame column in $s1
    nop
nop
nop
nop
nop
    lw      $s2, 8($a0)         # window row in $s2
    nop
nop
nop
nop
nop
    lw      $s3, 12($a0)        # window column in $s3
    nop
nop
nop
nop
nop

    # set variables
nop
nop
nop
nop
nop
    add		$s4, $zero, $zero   # top (0 in $s4)
    sub     $s6, $s0, $s2       # bottom (frame row - window row in $s5)
    sub     $s7, $s1, $s3       # right (frame column - window column in $s7)
nop
nop
nop
nop
nop
    li      $t0, 255            # (window row * window column * 255)
    nop
nop
nop
nop
nop
    li      $t1, 0              # direction is set to 0
    nop
nop
nop
nop
nop

    #mult    $t0, $s2            # mininum sum starts at maximum possible value 
    #mult    $t0, $s3            # minimum sum satrts at maximum possible value
	

#use t5 as temp in main

nop
nop
nop
nop
nop
# jumpBack
j start
nop
nop
nop
nop
nop
jumpBack:

right:
   nop
nop
nop
nop
nop
rightLoop:
    add     $t3, $t3, $zero     # $t3 = x
    addi     $t4, $t4, 1     # $t4 = y
    nop
nop
nop
nop
nop
    add         $s4, $t3, $zero #set s4 as t3
    add         $s5, $t4, $zero #set s5 as t4

nop
nop
nop
nop
nop
#check if done
addi $t4, $t4, 1
addi $t3, $t3, 1
#blt, $t4, $s1
slt $t5, $t4, $s1,      #checks sizes
nop
nop
nop
nop
nop
bne $t5, $zero, keepGoing
nop
nop
nop
nop
nop
beq $t3, $s0, exit
nop
nop
nop
nop
nop
keepGoing:
nop
nop
nop
nop
nop
addi $t4, $t4, -1
addi $t3, $t3, -1

nop
nop
nop
nop
nop
jal     sad                 # jump and link sad
 nop
nop
nop
nop
nop
    # bgt     $t9, $t0, rightSkip #if new sad is bigger than old/out of bounds skip $v
    # bgt     $s5, $s7, rightSkip # 
    # bgt     $s4, $s7, rightSkip #
    nop
nop
nop
nop
nop
    slt $t5, $t0, $t9
    nop
nop
nop
nop
nop
    bne $t5, $zero, rightSkip
    nop
nop
nop
nop
nop
    slt $t5, $s7, $s5
    nop
nop
nop
nop
nop
    bne $t5, $zero, rightSkip
    nop
nop
nop
nop
nop
    slt $t5, $s7, $s4
    nop
nop
nop
nop
nop
    bne $t5, $zero, rightSkip
    nop
nop
nop
nop
nop



    add     $t0, $t9, $zero     # minSum is tempSum
    add     $v0, $s4, $zero     # row value
    add     $v1, $s5, $zero     # column value
nop
nop
nop
nop
nop
rightSkip:
nop
nop
nop
nop
nop
exitRight:
    add     $t3, $s4, $zero
    add     $t4, $s5, $zero 
    addi    $s0, $s0, -1
    #bge     $s4, $s0, goToUpLoop #go up if at bottom
    slt $t5, $s4, $s0
    nop
nop
nop
nop
nop
    beq $t5, $zero, goToUpLoop
   nop
nop
nop
nop
nop
    addi    $s0, $s0, 1
    nop
nop
nop
nop
nop
    j       left
nop
nop
nop
nop
nop
goToUpLoop:
nop
nop
nop
nop
nop
add         $t3, $s4, $zero     #restore t3 and t4 to pre sad values
add         $t4, $s5, $zero
addi        $s0, $s0, 1
nop
nop
nop
nop
nop
j       upLoop


nop
nop
nop
nop
nop


leftLoop2:
nop
nop
nop
nop
nop
addi $s1, $s1, 1 #restore s1

left:
leftLoop:
nop
nop
nop
nop
nop
    add     $t3, $zero, $t3     # why did I keep this line in here?
    nop
nop
nop
nop
nop
    addi     $t3, $t3, 1     # row goes down 1
    nop
nop
nop
nop
nop
    add     $t4, $zero, $t4   
    addi     $t4, $t4, -1     # columns go left 1
    add         $s4, $t3, $zero
    add         $s5, $t4, $zero
nop
nop
nop
nop
nop
    bltz     $t4, leftExit2   #go down if at left wall
nop
nop
nop
nop
nop
    #bge     $t3, $s0, rightBottom   #go right if at floor
    slt      $t5, $t3, $s0
    nop
nop
nop
nop
nop
    beq $t5, $zero, rightBottom
nop
nop
nop
nop
nop
    jal     sad                 # jump and link sad
nop
nop
nop
nop
nop

    #bgt     $t9, $t0, leftSkip  #if new sad is bigger than old/out of bounds skip $v
    #bgt     $s4, $s6, leftSkip #if out of bounds/too far down then skip v
    #bgt     $s4, $s0, upPass # ok
    nop
nop
nop
nop
nop
    slt $t5, $t0, $t9
    nop
nop
nop
nop
nop
    bne $t5, $zero, leftSkip
    nop
nop
nop
nop
nop
    slt $t5, $s6, $s4
    nop
nop
nop
nop
nop
    bne $t5, $zero, leftSkip
    nop
nop
nop
nop
nop
    slt $t5, $s0, $s4
    nop
nop
nop
nop
nop
    bne $t5, $zero, upPass
    
    nop
nop
nop
nop
nop
    
    
    add     $t0, $t9, $zero     # minSum is tempSum
    add     $v0, $s4, $zero     # row value
    add     $v1, $s5, $zero     # column value
leftSkip:
   add         $t3, $s4, $zero      #reset t3 and t4 to values before sad
    add         $t4, $s5, $zero
    nop
nop
nop
nop
nop
    j       leftLoop        
    nop
nop
nop
nop
nop    
leftExit:
nop
nop
nop
nop
nop
j       down    #go down
nop
nop
nop
nop
nop
leftExit2:
nop
nop
nop
nop
nop
j leftExit  #why would I put this here?
nop
nop
nop
nop
nop

rightBottom:
nop
nop
nop
nop
nop
    addi     $t3, $t3, -1     # makes these variables work correctly
     addi     $t4, $t4, 1     # 
     nop
nop
nop
nop
nop
     j right
     nop
nop
nop
nop
nop



# instructions for down
down:
downLoop:
nop
nop
nop
nop
nop
    add     $t3, $t3, $zero     # why
    addi     $t4, $t4, 1    # go 1 row down
    #bge        $t3, $s0, right3 #if frame is bigger than bottom row size exit to the right
    nop
nop
nop
nop
nop
    slt $t5, $t3, $s0
    nop
nop
nop
nop
nop
    beq $t5, $zero, right3
    nop
nop
nop
nop
nop
    
    add         $s4, $t3, $zero #make s4 and s5 into t3 and t4 respectively
    add         $s5, $t4, $zero
    nop
nop
nop
nop
nop
    jal     sad                 # jump and link sad
    nop
nop
nop
nop
nop
    add         $t3, $s4, $zero     #reset t3 and t4
    add         $t4, $s5, $zero


    #bgt     $t9, $t0, downSkip  #if new sad is bigger than old/out of bounds skip $v
    #bgt     $s5, $s3, downSkip2  #
    #bgt     $s5, $s7, downSkip #
    #bgt     $s4, $s6, downSkip #
    nop
nop
nop
nop
nop
    slt $t5, $t0, $t9
    nop
nop
nop
nop
nop
    bne $t5, $zero, downSkip
    nop
nop
nop
nop
nop
    slt $t5, $s3, $s5
    nop
nop
nop
nop
nop
    bne $t5, $zero, downSkip2
    nop
nop
nop
nop
nop
    slt $t5, $s7, $s5
    nop
nop
nop
nop
nop
    bne $t5, $zero, downSkip
    nop
nop
nop
nop
nop
    slt $t5, $s6, $s4
    nop
nop
nop
nop
nop
    bne $t5, $zero, downSkip
nop
nop
nop
nop
nop




    add     $t0, $t9, $zero     # minSum is tempSum
    add     $v0, $s4, $zero     # row value
    add     $v1, $s5, $zero     # column value
downSkip:
nop
nop
nop
nop
nop
j downExit
nop
nop
nop
nop
nop
#why did I make the same loop twice again?
downExit2:
j downExit
nop
nop
nop
nop
nop
    #only need to go down once  

downSkip2:
add         $t3, $s4, $zero     #reset t3 and t4
add        $t4, $s5, $zero
nop
nop
nop
nop
nop
j left

right3:
addi $t3, $t3, -1 
nop
nop
nop
nop
nop      #make code work properly
j right    
nop
nop
nop
nop
nop

downExit:
nop
nop
nop
nop
nop
add         $t3, $s4, $zero #reset t3 and t4
    add         $t4, $s5, $zero
nop
nop
nop
nop
nop
    addi $s1, $s1, -1       #check if at right wall then go left
    #bge $s5, $s1, leftLoop2
    nop
nop
nop
nop
nop
    slt $t5, $s5, $s1
    nop
nop
nop
nop
nop
    beq $t5, $zero, leftLoop2
nop
nop
nop
nop
nop

    addi $s1, $s1, 1
    nop
nop
nop
nop
nop
    j       up


nop
nop
nop
nop
nop
# instructions for up

up:
upLoop:
nop
nop
nop
nop
nop
    add     $t3, $zero, $t3     # $t3 = row
    nop
nop
nop
nop
nop
    addi     $t3, $t3, -1     # $t3 = row
    nop
nop
nop
nop
nop
    add     $t4, $zero, $t4     # $t4 = column
    nop
nop
nop
nop
nop
    addi     $t4, $t4, 1     # $t3 = column
    add         $s4, $t3, $zero
    add         $s5, $t4, $zero
    nop
nop
nop
nop
nop
    bltz       $t3, upExit    #if above ceiling exit up
    nop
nop
nop
nop
nop
    #bge        $t4, $s1, downCheck #if frame is bigger than bottom row size exit
    slt $t5, $t4, $s1
    nop
nop
nop
nop
nop
    beq $t5, $zero, downCheck
nop
nop
nop
nop
nop

    jal     sad                 # jump and link sad

nop
nop
nop
nop
nop

    # bgt     $t9, $t0, upPass    #if new sad is bigger than old/out of bounds skip $v
    # bgt     $s4, $s6, upPass # 
    # bgt     $s5, $s7, upPass # 
    slt $t5, $t0, $t9
    nop
nop
nop
nop
nop
    bne $t5, $zero, upPass
    nop
nop
nop
nop
nop
    slt $t5, $s6, $s4
    nop
nop
nop
nop
nop
    bne $t5, $zero, upPass
    nop
nop
nop
nop
nop
    slt $t5, $s7, $s5
    nop
nop
nop
nop
nop
    bne $t5, $zero, upPass
    nop
nop
nop
nop
nop





    add     $t0, $t9, $zero     # minSum is tempSum
    add     $v0, $s4, $zero     # $v0 = row
    add     $v1, $s5, $zero     # $v1 = column
    
upPass:
nop
nop
nop
nop
nop
    add         $t3, $s4, $zero     #restore t3 and t4
    add         $t4, $s5, $zero
    nop
nop
nop
nop
nop
    j       upLoop    
nop
nop
nop
nop
nop

upExit:
nop
nop
nop
nop
nop
    addi     $t3, $t3, 1     # restore t3 and t4 to what they were before uploop
    addi     $t4, $t4, -1     #
    nop
nop
nop
nop
nop
    j       jumpBack
    nop
nop
nop
nop
nop

downCheck:
nop
nop
nop
nop
nop
addi     $t3, $t3, 2     # make them what they need to be
addi     $t4, $t4, -2     #
nop
nop
nop
nop
nop
j downLoop
nop
nop
nop
nop
nop



start:
#only come here once at the start
nop
nop
nop
nop
nop
    add     $t2, $zero, $zero     # set t2 to 0
    nop
nop
nop
nop
nop
startLoop:
nop
nop
nop
nop
nop
    add     $t3, $zero, $zero     # initialize things
    add     $t4, $zero, $zero     #
    nop
nop
nop
nop
nop
    jal     sad                 # jump and link sad
    nop
nop
nop
nop
nop
    add     $t3, $zero, $zero     #
    add     $t4, $zero, $zero     # 
    nop
nop
nop
nop
nop
    #bge     $t9, $t0, startSkip # if tempSum >= minSum then branch?
    slt $t5, $t9, $t0
    nop
nop
nop
nop
nop
    beq $t5, $zero, startSkip
    nop
nop
nop
nop
nop

    add     $t0, $t9, $zero     # minSum is tempSum
    add     $v0, $s4, $zero     # $v0 = row
    add     $v1, $t2, $zero     # $v1 = column
    nop
nop
nop
nop
nop
startSkip:
nop
nop
nop
nop
nop
    addi    $t2, $t2, 1         # increment i by 1 (i = i + 1)
nop
nop
nop
nop
nop
exitStart:
nop
nop
nop
nop
nop
    add     $t3, $zero, $zero     # $t3 = row
    add     $t4, $zero, $zero     # $t4 = column
    nop
nop
nop
nop
nop
    j       right
    nop
nop
nop
nop
nop


# exit
exit:
nop
nop
nop
nop
nop
    lw      $ra, 0($sp)         # restore the original return address
    nop
nop
nop
nop
nop
    addi    $sp, $sp, 4         # restore the stack pointer
    
    nop
nop
nop
nop
nop
    jr      $ra                 # return
    nop
nop
nop
nop
nop

    


# sum of absolute differences function
# return will be stored in $t9

sad:
nop
nop
nop
nop
nop
    sll     $t3, $t3, 2         # multiply y by 4 (byte index)
    nop
nop
nop
nop
nop
    sll     $t4, $t4, 2         # multiply x by 4 (byte index)
    nop
nop
nop
nop
nop
    addi      $t1,$zero, 0              # set sum to 0
    nop
nop
nop
nop
nop
    mul     $t5, $t3, $s1       # y * frame column in $t3
    nop
nop
nop
nop
nop
    add     $t5, $t5, $t4       # y * frame row + x in $t5
    nop
nop
nop
nop
nop
    add     $t5, $t5, $a1       # desired index of frame in $t5
    nop
nop
nop
nop
nop
    add     $t6, $a2, $zero     # desired index of window in $t6
    nop
nop
nop
nop
nop
    addi      $t3,$zero, 0                   # i = 0 

    nop
nop
nop
nop
nop
# i loop
iLoop:
    nop
nop
nop
nop
nop
    slt     $t7, $t3, $s2       # $t7 = i < window row
    nop
nop
nop
nop
nop
    beq     $t7, $zero, exitiLoop   # if i >= window column, exit iLoop
    nop
nop
nop
nop
nop
    addi      $t4,$zero, 0                # j = 0


# j loop

nop
nop
nop
nop
nop
jLoop:
    nop
nop
nop
nop
nop
    slt     $t7, $t4, $s3       # $t7 = j < windowLength
    nop
nop
nop
nop
nop
    beq     $t7, $zero, exitjLoop   # if j >= windowLength, exit jLoop
    nop
nop
nop
nop
nop
    lw      $t8, 0($t5)         # $t8 is frame pixel
        nop
nop
nop
nop
nop
    lw      $t9, 0($t6)         # $t9 is window pixel
        nop
nop
nop
nop
nop
    #bge     $t8, $t9, absValue
    slt     $t7, $t8, $t9
    nop
nop
nop
nop
nop
    beq     $t7, $zero, absValue
    nop
nop
nop
nop
nop
    slt     $t7, $t4, $s3       # resest t7
    nop
nop
nop
nop
nop


    sub     $t8, $t9, $t8
    nop
nop
nop
nop
nop
    j       endAbs
nop
nop
nop
nop
nop
 
# absValue
absValue:
    nop
nop
nop
nop
nop
    sub     $t8, $t8, $t9       # $t8 is frame pixel - window pixel
        nop
nop
nop
nop
nop
endAbs:
    add     $t1, $t1, $t8       # add the absolute difference to sum
    addi    $t5, $t5, 4         # increment frame index
    addi    $t6, $t6, 4         # increment window index
    addi    $t4, $t4, 1         # increment j
    nop
nop
nop
nop
nop
    j       jLoop               # return to start for jLoop 
    nop
nop
nop
nop
nop



# exit j loop

exitjLoop:
    nop
nop
nop
nop
nop
    sub     $t7, $s1, $s3       # $t7 = frameLength - windowLength
        nop
nop
nop
nop
nop
    sll     $t7, $t7, 2         # multiply $t7 by 4 (byte index)
        nop
nop
nop
nop
nop
    add     $t5, $t5, $t7       # increment frame index
    addi    $t3, $t3, 1         # increment i
    nop
nop
nop
nop
nop
    j       iLoop               # return to start for iLoop
    nop
nop
nop
nop
nop



# exit i loop

exitiLoop:
    nop
nop
nop
nop
nop
    add     $t9, $t1, $zero     # store sum value in $t9
    nop
nop
nop
nop
nop
    jr      $ra  
    nop
nop
nop
nop
nop
