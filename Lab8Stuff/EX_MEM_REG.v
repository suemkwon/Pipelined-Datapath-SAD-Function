`timescale 1ns / 1ps

module EX_MEM_REG(clk, RegWrite, Branch, MemWrite, MemRead, MemToReg, PCSrc, Zero, ALUResult, WriteMemData, 
pcPlus4, WriteReg, RegWriteOut, BranchOut, MemWriteOut, MemReadOut, MemToRegOut, PCSrcOut, ZeroOut, 
ALUResultOut, WriteMemDataOut, pcPlus4Out, WriteRegOut);
                    
        input [63:0] ALUResult;
        input [31:0] WriteMemData, pcPlus4;
        input [4:0] WriteReg;
        input clk, Zero, RegWrite, Branch, MemWrite, MemRead, MemToReg, PCSrc;
        output reg [63:0] ALUResultOut;
        output reg [31:0] WriteMemDataOut, pcPlus4Out;
        output reg [4:0] WriteRegOut;
        output reg ZeroOut, RegWriteOut, BranchOut, MemWriteOut, MemReadOut, MemToRegOut, PCSrcOut;
        
        initial begin
            PCSrcOut = 0;
            RegWriteOut = 0;
            BranchOut = 0;
            MemWriteOut = 0;
            MemReadOut = 0;
            MemToRegOut = 0;        
            pcPlus4Out = 0;
            ZeroOut = 0;
            ALUResultOut = 0;
            WriteMemDataOut = 0;
            WriteRegOut = 0;
        end
        
        always @(posedge clk)   begin
            PCSrcOut <= PCSrc;
            pcPlus4Out <= pcPlus4;
            ZeroOut <= Zero;
            ALUResultOut <= ALUResult;
            WriteMemDataOut <= WriteMemData;
            WriteRegOut <= WriteReg;
            RegWriteOut <= RegWrite;
            BranchOut <= Branch;
            MemWriteOut <= MemWrite;
            MemReadOut <= MemRead;
            MemToRegOut <= MemToReg;
        end         
endmodule
