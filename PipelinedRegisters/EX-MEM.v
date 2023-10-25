`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2023 04:15:24 AM
// Design Name: 
// Module Name: ID-EX
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


module EXMEM(Rst, Clk, PCSrc, WBin, Min, BranchAdd, ALUResult, ALUZero, WriteReg, ReadData2, 
    WBout, MBranch, MemWrite, MemRead, BranchAddout, ALUResultout, ALUZeroOut, WriteRegout, ReadData2out);
    
    input [1:0] WBin;
    input [4:0] Min;
    input [31:0] BranchAdd, ALUResult;
    input ALUZero, Rst, Clk, PCSrc;
    input [4:0] WriteReg;
    input [31:0] ReadData2;
  
    output reg [1:0] WBout,  MemWrite, MemRead;
    output reg MBranch;
    output reg [31:0] BranchAddout, ALUResultout;
    output reg ALUZeroOut;
    output reg [4:0] WriteRegout;
    output reg [31:0] ReadData2out;
  
    always @(posedge Clk) begin
        if(PCSrc == 1) begin
            WBout <= 0;
            MBranch <= 0;
            
            MemWrite <= 0;
            MemRead <= 0;
            
            BranchAddout <= 0;
            ALUResultout <= 0;
            ALUZeroOut <= 0;
            
            WriteRegout <= 0;
            ReadData2out <= 0;
        end
        else begin
            WBout <= WBin;
            MBranch <= Min[4];
            
            MemWrite <= Min[3:2];
            MemRead <= Min[1:0];
            
            BranchAddout <= BranchAdd;
            ALUResultout <= ALUResult;
            ALUZeroOut <= ALUZero;
            
            WriteRegout <= WriteReg;
            ReadData2out <= ReadData2;
        end
    end
endmodule
