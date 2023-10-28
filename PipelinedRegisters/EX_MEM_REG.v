`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: EX_MEM_REG
// 
// Additional Comments:
//
// Last Updated: 10:51 AM 10/28/23 by Sue
// 
//////////////////////////////////////////////////////////////////////////////////


module EX_MEM_REG(clk, RegWrite, Branch, MemWrite, MemRead, MemToReg, PCSrc, Zero, ALUResult, WriteMemData, pc_plus_4, WriteReg, 
                    RegWrite_out, Branch_out, MemWrite_out, MemRead_out, MemToReg_out, PCSrc_out, Zero_out, 
                    ALUResult_out, WriteMemData_out, pc_plus_4_out, WriteReg_out);
                    
        input [31:0] ALUResult;
        input [31:0] WriteMemData, pc_plus_4;
        input [4:0] WriteReg;
        input clk, RegWrite, Branch, MemWrite, MemRead, MemToReg, PCSrc, Zero;
        
        output reg [31:0] ALUResult_out;
        output reg [31:0] WriteMemData_out, pc_plus_4_out;
        output reg [4:0] WriteReg_out;
        output reg RegWrite_out, Branch_out, MemWrite_out, MemRead_out, MemToReg_out, PCSrc_out, Zero_out;
        
        initial begin
            RegWrite_out = 0;
            Branch_out = 0;
            MemWrite_out = 0;
            MemRead_out = 0;
            MemToReg_out = 0;        
            pc_plus_4_out = 0;
            Zero_out = 0;
            ALUResult_out = 0;
            WriteMemData_out = 0;
            WriteReg_out = 0;
            PCSrc_out = 0;
        end
        
        always @(posedge clk) begin
            pc_plus_4_out <= pc_plus_4;
            Zero_out <= Zero;
            ALUResult_out <= ALUResult;
            WriteMemData_out <= WriteMemData;
            WriteReg_out <= WriteReg;
            RegWrite_out <= RegWrite;
            Branch_out <= Branch;
            MemWrite_out <= MemWrite;
            MemRead_out <= MemRead;
            MemToReg_out <= MemToReg;
            PCSrc_out <= PCSrc;
        end       
        
endmodule
