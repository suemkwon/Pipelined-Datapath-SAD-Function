`timescale 1ns / 1ps

module MEM_WB_REG(clk, RegWrite, MemToReg, MemData, ALUResult, WriteReg, RegWriteOut, MemToRegOut, 
MemDataOut, ALUResultOut, WriteRegOut);

    input [31:0] MemData;
    input [63:0] ALUResult;
    input [4:0] WriteReg;
    input clk, RegWrite, MemToReg;
    output reg [31:0] MemDataOut;
    output reg [63:0] ALUResultOut;
    output reg [4:0] WriteRegOut;
    output reg RegWriteOut, MemToRegOut;
    
    initial begin
        RegWriteOut = 0;
        MemToRegOut = 0;
        MemDataOut = 0;
        ALUResultOut = 0;
        WriteRegOut = 0;
    end  
    
    always @(posedge clk) begin
        MemDataOut <= MemData;
        ALUResultOut <= ALUResult;
        WriteRegOut <= WriteReg;
        RegWriteOut <= RegWrite;
        MemToRegOut <= MemToReg;
    end       
endmodule