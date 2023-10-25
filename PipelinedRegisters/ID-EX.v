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


module IDEX(Clk, Rst, PCSrc, Instruction25to21, AddControl, Jaddress, WBin, Min, BranchADDin, 
    ReadData1, ReadData2, extendInstruction15to0, Instruction20to16, Instruction15to11, 
    RegDst, ALUOp, ALUSrc, WBout, Mout, BranchADDout, ReadData1out, ReadData2out, 
    extendInstruction15to0out, Instruction20to16out, Instruction15to11out, RegDstout, ALUOpout, 
    ALUSrcout, Jout, AddControlOut, Instruction25to21out);
 
    input [1:0] WBin, AddControl;
    input [4:0] Min;
    input [31:0] extendInstruction15to0, Jaddress, ReadData1, ReadData2, BranchADDin;
    input [5:0]  ALUOp;
    input [4:0] Instruction20to16, Instruction15to11, Instruction25to21;
    input RegDst, ALUSrc, Clk, Rst, PCSrc;
 
    output reg [1:0] WBout, AddControlOut;
    output reg [4:0] Mout;
    output reg [31:0] Jout, extendInstruction15to0out, BranchADDout, ReadData1out, ReadData2out;
    output reg [5:0] ALUOpout;
    output reg [4:0] Instruction20to16out, Instruction15to11out, Instruction25to21out;
    output reg RegDstout, ALUSrcout;
 
    always @(posedge Clk) begin
 
        if(PCSrc == 1) begin
            WBout <= 0;
            Mout <=  0;
   
            BranchADDout <= 0;
   
            ReadData1out <= 0;
            ReadData2out <= 0;
   
            extendInstruction15to0out <= 0;
   
            Instruction15to11out <= 0;
            Instruction20to16out <= 0;
   
            RegDstout <= 0;
   
            ALUOpout <= 0;
            ALUSrcout <= 0;
   
            Jout <= 0;
            AddControlOut <= 0;
            Instruction25to21out <= 0;
        end
 
        else begin
            WBout <= WBin;
            Mout <=  Min;
   
            BranchADDout <= BranchADDin;
   
            ReadData1out <= ReadData1;
            ReadData2out <= ReadData2;
   
            extendInstruction15to0out <= extendInstruction15to0;
   
            Instruction15to11out <= Instruction15to11;
            Instruction20to16out <= Instruction20to16;
   
            RegDstout <= RegDst;
   
            ALUOpout <= ALUOp;
            ALUSrcout <= ALUSrc;
   
            Jout <= Jaddress;
   
            AddControlOut <= AddControl;
            Instruction25to21out <= Instruction25to21;
        end
    end
endmodule
