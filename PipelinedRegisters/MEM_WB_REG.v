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
                    MemToReg_out, MemData_out, ALUResult_out, WriteReg_out);

    input [31:0] MemData;
    input [31:0] ALUResult;
    input [4:0] WriteReg;
    input clk, RegWrite, MemToReg;
    
    output reg [31:0] MemData_out;
    output reg [31:0] ALUResult_out;
    output reg [4:0] WriteReg_out;
    output reg RegWrite_out, MemToReg_out;
    
    initial begin
        RegWrite_out = 0;
        MemToReg_out = 0;
        MemData_out = 0;
        ALUResult_out = 0;
        WriteReg_out = 0;
    end  
    
    always @(posedge clk) begin
        MemData_out <= MemData;
        ALUResult_out <= ALUResult;
        WriteReg_out <= WriteReg;
        RegWrite_out <= RegWrite;
        MemToReg_out <= MemToReg;
    end     
      
endmodule
