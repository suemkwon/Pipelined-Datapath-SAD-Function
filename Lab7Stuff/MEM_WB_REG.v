`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: MEM_WB_REG
// 
// Additional Comments:
//
// Last Updated: 10:56 AM 10/28/23 by Sue
// 
//////////////////////////////////////////////////////////////////////////////////


module MEM_WB_REG(clk, RegWrite, MemToReg, MemData, ALUResult, WriteReg, RegWrite_out, 
                    MemToReg_out, MemData_out, ALUResult_out, WriteReg_out,pcResultPlus4Mem,pcResultPlus4MemOut,
                    jump_in_mem,jump_out_wb,extend_jump_in,extend_jump_out);

    input [31:0] MemData;
    input [31:0] ALUResult;
    input [4:0] WriteReg;
    input [2:0] MemToReg,jump_in_mem;
    input clk, RegWrite;
    input [31:0] pcResultPlus4Mem;
    input [27:0] extend_jump_in;
    output reg [27:0]extend_jump_out;
    output reg [31:0]pcResultPlus4MemOut;
    output reg [31:0] MemData_out;
    output reg [31:0] ALUResult_out;
    output reg [4:0] WriteReg_out;
    output reg RegWrite_out;
    output reg [2:0] MemToReg_out,jump_out_wb;
    
    initial begin
        RegWrite_out = 0;
        MemToReg_out = 0;
        MemData_out = 0;
        ALUResult_out = 0;
        WriteReg_out = 0;
        pcResultPlus4MemOut = 0;
        jump_out_wb = 0;
        extend_jump_out = 0;
    end  
    
    always @(posedge clk) begin
        MemData_out <= MemData;
        ALUResult_out <= ALUResult;
        WriteReg_out <= WriteReg;
        RegWrite_out <= RegWrite;
        MemToReg_out <= MemToReg;
        pcResultPlus4MemOut <= pcResultPlus4Mem; 
        jump_out_wb <= jump_in_mem;
        extend_jump_out <= extend_jump_in;
    end     
      
endmodule
