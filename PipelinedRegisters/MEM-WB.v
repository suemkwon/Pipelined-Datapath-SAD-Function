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


module MEMWB(Rst, Clk, WBin, ReadData, ALUResult, WriteReg, MemtoReg, RegWrite, ReadDataOut, ALUResultOut, WriteRegOut);
  
    input Rst, Clk;
    input [1:0] WBin;
    input [31:0] ReadData, ALUResult;
    input [4:0] WriteReg;
  
    output reg MemtoReg, RegWrite;
    output reg [31:0] ReadDataOut, ALUResultOut;
    output reg [4:0] WriteRegOut;
  
  
    always @(posedge Clk) begin
        MemtoReg <= WBin[0];
        RegWrite <= WBin[1];
        ReadDataOut <= ReadData;
        ALUResultOut <= ALUResult;
        WriteRegOut <= WriteReg;
    end
endmodule
