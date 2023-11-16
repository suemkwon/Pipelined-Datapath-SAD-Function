`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  
// Module Name: ID_EX_REG
// 
// Additional Comments:
//
// Last Updated: 10:33 AM 10/28/23 by Sue
// 
//////////////////////////////////////////////////////////////////////////////////


module ID_EX_REG(clk, RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemRead, MemToReg, ALUOp, PCSrc,
                Data1, Data2, ShiftAmount, Immediate, pc_plus_4, Bit6, Funct, Bit21, RegRt, RegRd, 
                RegWrite_out, RegDst_out, ALUSrc_out, Branch_out, MemWrite_out, MemRead_out, MemToReg_out, ALUOp_out, PCSrc_out,
                Data1_out, Data2_out, ShiftAmount_out, Immediate_out, pc_plus_4_out, Bit6_out, 
                Funct_out, Bit21_out, RegRt_out, RegRd_out,jump_in, jump_out,sign_in,sign_out, RegRs,RegRs_out);
                
      
      input [31:0] Data1, Data2, ShiftAmount, Immediate, pc_plus_4;
      input [5:0] Funct;
      input [4:0] RegRt, RegRd,RegRs;
      input [4:0] ALUOp;
      input [27:0]sign_in;
      input [2:0] MemToReg,RegDst,jump_in;
      input clk, RegWrite, ALUSrc, Branch, MemWrite, MemRead, 
            Bit6, Bit21, PCSrc;
         
      
      output reg [31:0] Data1_out, Data2_out, ShiftAmount_out, Immediate_out, pc_plus_4_out;
      output reg [5:0] Funct_out;
      output reg [4:0] RegRt_out, RegRd_out,RegRs_out;
      output reg [4:0] ALUOp_out;
      output reg PCSrc_out, Bit6_out, Bit21_out, RegWrite_out, ALUSrc_out, 
                 Branch_out, MemWrite_out, MemRead_out;
      output reg [2:0] MemToReg_out,RegDst_out,jump_out;
      output reg [27:0]sign_out;

      
      initial begin
        RegWrite_out = 0;
        RegDst_out = 0;
        ALUSrc_out = 0;
        Branch_out = 0;
        MemWrite_out = 0;
        MemRead_out = 0;
        MemToReg_out = 0;
        ALUOp_out = 0;
        pc_plus_4_out = 0;
        Data1_out = 0;
        Data2_out = 0;
        ShiftAmount_out = 0;
        Immediate_out = 0;
        Bit6_out = 0;
        Funct_out = 0;
        Bit21_out = 0;
        RegRt_out = 0;
        RegRd_out = 0;
        PCSrc_out = 0;
        jump_out = 0;
        sign_out = 0;
        RegRs_out = 0;
       end
  
       always @(posedge clk) begin
        RegWrite_out <= RegWrite;
        RegDst_out <= RegDst;
        ALUSrc_out <= ALUSrc;
        Branch_out <= Branch;
        MemWrite_out <= MemWrite;
        MemRead_out <= MemRead;
        MemToReg_out <= MemToReg;
        ALUOp_out <= ALUOp;
        pc_plus_4_out <= pc_plus_4;
        Data1_out <= Data1;
        Data2_out <= Data2;
        ShiftAmount_out <= ShiftAmount;
        Immediate_out <= Immediate;
        Bit6_out <= Bit6;
        Funct_out <= Funct;
        Bit21_out <= Bit21;
        RegRt_out <= RegRt;
        RegRd_out <= RegRd; 
        PCSrc_out <= PCSrc;
        jump_out <= jump_in;
        sign_out <= sign_in;
        RegRs_out <= RegRs;
       end    
                   
endmodule
