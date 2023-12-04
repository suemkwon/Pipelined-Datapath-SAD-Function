`timescale 1ns / 1ps


module ControlMux(sel,PCSrc, RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemRead, MemToReg, zeroExt,JumpInstCont, ALUOp,
 PCSrc_out, RegWrite_out, ALUSrc_out, Branch_out, MemWrite_out, MemRead_out, zeroExt_out,JumpInstCont_out, MemToReg_out, RegDst_out,
 ALUOp_out);
    
    //input sel;//hazard detection
    
    input PCSrc, RegWrite, ALUSrc, Branch, MemWrite, MemRead, zeroExt; 
    input [2:0] JumpInstCont, MemToReg, RegDst;
    input [4:0] ALUOp;
    input sel;
    
    output reg PCSrc_out, RegWrite_out, ALUSrc_out, Branch_out, MemWrite_out, MemRead_out, zeroExt_out; 
    output reg [2:0] JumpInstCont_out, MemToReg_out, RegDst_out;
    output reg [4:0] ALUOp_out;
    
    initial begin
       PCSrc_out <= 0;
       RegWrite_out <= 0;
       RegDst_out <= 0;
       ALUSrc_out <= 0;
       Branch_out <= 0; 
       MemWrite_out <= 0; 
       MemRead_out <= 0; 
       MemToReg_out <= 0; 
       zeroExt_out <= 0;
       JumpInstCont_out <= 0;
       ALUOp_out <= 0;
    end
    
    
    always @* begin
    //initial begin
       if (sel == 1) begin //hazard detected
       PCSrc_out = 0;
       RegWrite_out = 0;
       RegDst_out = 0;
       ALUSrc_out = 0;
       Branch_out = 0; 
       MemWrite_out = 0; 
       MemRead_out = 0; 
       MemToReg_out = 0; 
       zeroExt_out = 0;
       JumpInstCont_out = 0;
       ALUOp_out = 0;
       end
       
        else begin //no hazard
        PCSrc_out = PCSrc;
        RegWrite_out = RegWrite;
        RegDst_out = RegDst;
        ALUSrc_out = ALUSrc;
        Branch_out = Branch; 
        MemWrite_out = MemWrite; 
        MemRead_out = MemRead; 
        MemToReg_out = MemToReg; 
        zeroExt_out = zeroExt;
        JumpInstCont_out =  JumpInstCont;
        ALUOp_out = ALUOp;
            end // end else begin
    end   
           
endmodule
