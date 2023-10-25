`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2023 05:35:26 AM
// Design Name: 
// Module Name: Adder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Adder_tb();

    reg [31:0] addIn, shiftIn, A, JAddress;
    reg [1:0] control;
    wire [31:0] out;
    
    Adder Add(
        .addIn(addIn), 
        .shiftIn(shiftIn), 
        .control(control), 
        .A(A), 
        .JAddress(JAddress),
        .out(out)
    );
    
    initial begin
    
    // case 1
    addIn <= 1;
    shiftIn <= 0;
    A <= 1;
    JAddress <= 1;
    control <= 0;
    #50;
    
    // case 2
    addIn <= 5;
    shiftIn <= 4;
    A <= 0;
    JAddress <= 2;
    control <= 1;
    #50;
    
    // case 3  
    addIn <= 8;
    shiftIn <= 1;
    A <= 3;
    JAddress <= 4;
    control <= 2;
    #50;  
        
    end
    
endmodule

