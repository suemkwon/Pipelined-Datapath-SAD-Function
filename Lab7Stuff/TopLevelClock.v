`timescale 1ns / 1ps



module TopLevelClock(clk, rst, out7, en_out);
    input clk;
    input rst;
    output [6:0] out7;
    output [7:0] en_out;
    wire [31:0] numA, numB;

    // ClkDiv(Clk, Rst, ClkOut)
    ClkDiv b3(clk, 0, ClkOut);
    
    // InstructionFetchUnit(Instruction, PCResult, Reset, Clk)
    TopLevel b1(numA, numB, rst, ClkOut);
    
    // Two4DigitDisplay(Clk, NumberA, NumberB, out7, en_out)
    Two4DigitDisplay b2(clk, numA[15:0], numB[15:0], out7, en_out);

endmodule
