`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: TopLevel_tb
// 
// Additional Comments:
//
// Last Updated: 11:00 AM 10/28/23
// 
//////////////////////////////////////////////////////////////////////////////////


module TopLevel_tb();

    reg clk, rst;
    wire [31:0] WriteData, ProgramCounter;
    wire [31:0] aluResultEX,pcPlus4,pcresultPlus4EX,readData1ID,readData2ID,instructionOut, instruction;
    wire [4:0] ALUOpID,readRegRt,aluControl;
    wire [5:0] functEX;
    wire [31:0] B;
    wire[31:0]aluResultWB, readMemDataWB, readData2EX, immediateEX;
    wire [3:0] ALUOpEX;
    wire aluSrcID, aluSrcEX,memToRegWB;
    
    TopLevel tl( 
              .clk(clk),
              .rst(rst),
              .WriteData(WriteData),
              .ProgramCounter(ProgramCounter),
              .aluResultEX(aluResultEX),
              .pcPlus4(pcPlus4),
              .pcresultPlus4EX(pcresultPlus4EX),
              .readData1ID(readData1ID),
              .readData2ID(readData2ID),
              .instructionOut(instructionOut),
              .instruction(instruction),
              .ALUOpID(ALUOpID),
              .readRegRt(readRegRt),
              .aluControl(aluControl),
              .functEX(functEX),
              .ALUOpEX(ALUOpEX),
              .B(B),
              .aluResultWB(aluResultWB),
              .readMemDataWB(readMemDataWB),
              .readData2EX(readData2EX),
              .immediateEX(immediateEX),              
              .aluSrcEX(aluSrcEX),
              .aluSrcID(aluSrcID),
              .memToRegWB(memToRegWB)
              );
         
    initial begin
        clk <= 1'b0;
        forever #50 clk = ~clk;
    end     
    
    initial begin
        rst <= 1;
        #20; 
        rst <= 0;
    end   
                                        
endmodule
