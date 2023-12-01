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
                    ALUResult_out, WriteMemData_out, pc_plus_4_out, WriteReg_out,aluCONTROL, alu_out,pcresultPlus4, pcresultPlus4out,
                    jump_inEX,jump_outMEM,sign_in_mem,sign_out_mem,flush);
                    
        input [31:0] ALUResult;
        input [31:0] WriteMemData, pc_plus_4;
        input [4:0] WriteReg, aluCONTROL;
        input [2:0] MemToReg,jump_inEX;
        input clk, RegWrite, Branch, MemWrite, MemRead, PCSrc, Zero;
        input [31:0] pcresultPlus4;
        input [27:0] sign_in_mem;
        
        input flush;
        
        output reg [27:0]sign_out_mem;
        output reg [31:0] pcresultPlus4out;
        output reg [31:0] ALUResult_out;
        output reg [31:0] WriteMemData_out, pc_plus_4_out;
        output reg [4:0] WriteReg_out,alu_out;
        output reg [2:0] MemToReg_out,jump_outMEM;
        output reg RegWrite_out, Branch_out, MemWrite_out, MemRead_out, PCSrc_out, Zero_out;
        
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
            alu_out = 0;
            pcresultPlus4out = 0;
            jump_outMEM = 0;
            sign_out_mem = 0;
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
            alu_out <= aluCONTROL;
            pcresultPlus4out <= pcresultPlus4;
            jump_outMEM <= jump_inEX;
            sign_out_mem <= sign_in_mem;
            
            
            if (flush == 1) begin
                        RegWrite_out <= 0;
            Branch_out <= 0;
            MemWrite_out <= 0;
            MemRead_out <= 0;
            MemToReg_out <= 0;        
            pc_plus_4_out <= 0;
            Zero_out <= 0;
            ALUResult_out <= 0;
            WriteMemData_out <= 0;
            WriteReg_out <= 0;
            PCSrc_out <= 0;
            alu_out <= 0;
            pcresultPlus4out <= 0;
            jump_outMEM <= 0;
            sign_out_mem <= 0;
            end
        end       
        
endmodule
