`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2023 05:35:26 AM
// Design Name: 
// Module Name: ALUControl_tb
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


module ALUControl_tb();

    reg [5:0] SignEx;
    reg [5:0] ALUOp;
    
    wire [5:0] out;
    
    ALUControl ALUC(
        .ALUOp(ALUOp), 
        .SignEx(SignEx), 
        .out(out)
    );
    
    initial begin
    
        // add
        ALUOp <= 0;
        SignEx <= 6'b100000;
        #50;
        // sub
        ALUOp <= 0;
        SignEx <= 6'b100010;
        #50;
        // mul
        ALUOp <= 0;
        SignEx <= 6'b011000;
        #50;
        // jr
        ALUOp <= 0;
        SignEx <= 6'b001000;
        #50;
        // and
        ALUOp <= 0;
        SignEx <= 6'b100100;
        #50;
        // or
        ALUOp <= 0;
        SignEx <= 6'b100101;
        #50;
        // nor
        ALUOp <= 0;
        SignEx <= 6'b100111;
        #50;
        // xor
        ALUOp <= 0;
        SignEx <= 6'b100110;
        #50;
        // sll
        ALUOp <= 0;
        SignEx <= 6'b000000;
        #50;
        // srl
        ALUOp <= 0;
        SignEx <= 6'b000010;
        #50;
        // slt
        ALUOp <= 0;
        SignEx <= 6'b101010;
        #50;
    end  
endmodule
