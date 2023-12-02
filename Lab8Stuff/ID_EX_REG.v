`timescale 1ns / 1ps

module ID_EX_REG(clk, RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemRead, MemToReg, ALUOp, PCSrc, Data1, Data2, 
ShiftAmount, Immediate, pcPlus4, Bit6, Funct, Bit21, RegRt, RegRd, RegWriteOut, RegDstOut, ALUSrcOut, BranchOut, 
MemWriteOut, MemReadOut, MemToRegOut, ALUOpOut, PCSrcOut, Data1Out, Data2Out, ShiftAmountOut, ImmediateOut, 
pcPlus4Out, Bit6Out, FunctOut, Bit21Out, RegRtOut, RegRdOut);
                
      input clk, RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemRead, MemToReg, PCSrc, Bit6, Bit21;
      input [31:0] Data1, Data2, ShiftAmount, Immediate, pcPlus4;
      input [5:0] Funct;
      input [4:0] RegRt, RegRd;
      input [3:0] ALUOp;
     
      output reg [31:0] Data1Out, Data2Out, ShiftAmountOut, ImmediateOut, pcPlus4Out;
      output reg [5:0] FunctOut;
      output reg [4:0] RegRtOut, RegRdOut;
      output reg [3:0] ALUOpOut;
      output reg RegWriteOut, RegDstOut, ALUSrcOut, BranchOut, MemWriteOut, MemReadOut, MemToRegOut, PCSrcOut, Bit6Out, Bit21Out;
      
//      reg PRegWrite, PRegDst, PALUSrc, PBranch, PMemWrite, PMemRead, PMemToReg, PzeroExt;   
//      reg [3:0] PALUOp;
      
      initial begin
        RegWriteOut = 0;
        RegDstOut = 0;
        ALUSrcOut = 0;
        BranchOut = 0;
        MemWriteOut = 0;
        MemReadOut = 0;
        MemToRegOut = 0;
        ALUOpOut = 0;
        pcPlus4Out = 0;
        Data1Out = 0;
        Data2Out = 0;
        ShiftAmountOut = 0;
        ImmediateOut = 0;
        Bit6Out = 0;
        FunctOut = 0;
        Bit21Out = 0;
        RegRtOut = 0;
        RegRdOut = 0;
        PCSrcOut = 0;
       end
       
//       always @(posedge clk)    begin
//        PRegWrite <= RegWrite;
//        PRegDst <= RegDst;
//        PALUSrc <= ALUSrc;
//        PBranch <= Branch;
//        PMemWrite <= MemWrite;
//        PMemRead <= MemRead;
//        PMemToReg <= MemToReg;
//        PALUOp <= ALUOp;
//       end 
       
       always @(posedge clk) begin
        RegWriteOut <= RegWrite;
        RegDstOut <= RegDst;
        ALUSrcOut <= ALUSrc;
        BranchOut <= Branch;
        MemWriteOut <= MemWrite;
        MemReadOut <= MemRead;
        MemToRegOut <= MemToReg;
        ALUOpOut <= ALUOp;
        pcPlus4Out <= pcPlus4;
        Data1Out <= Data1;
        Data2Out <= Data2;
        ShiftAmountOut <= ShiftAmount;
        ImmediateOut <= Immediate;
        Bit6Out <= Bit6;
        FunctOut <= Funct;
        Bit21Out <= Bit21;
        RegRtOut <= RegRt;
        RegRdOut <= RegRd; 
        PCSrcOut <= PCSrc;
       end                
endmodule
