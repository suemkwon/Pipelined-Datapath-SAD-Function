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
    wire [4:0] ALUOpID,readRegRt,aluControl,aluControlOut;
    wire [5:0] functEX,opcode;
    wire [31:0] B;
    wire[31:0]aluResultWB, readMemDataWB, readData2EX, immediateEX,shiftAmountEX,pcResultPlus4wb,pcresultPlus4MemOut,twentySevenOut,readData1EX;
    wire [4:0] ALUOpEX,writeRegEX;
    wire aluSrcID, aluSrcEX;
    wire [2:0] JumpInstC,memToRegWB,JumpInstWB;
    
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
              .aluControlOut(aluControlOut),
              .writeRegEX(writeRegEX),
              .functEX(functEX),
              .opcode(opcode),
              .ALUOpEX(ALUOpEX),
              .twentySevenOut(twentySevenOut),
              .B(B),
              //.inA2(inA2),
              .readData1EX(readData1EX),
              .pcResultPlus4wb(pcResultPlus4wb),
              .aluResultWB(aluResultWB),
              .readMemDataWB(readMemDataWB),
              .pcresultPlus4MemOut(pcresultPlus4MemOut),
              .readData2EX(readData2EX),
              .immediateEX(immediateEX), 
              .shiftAmountEX(shiftAmountEX),             
              .aluSrcEX(aluSrcEX),
              .aluSrcID(aluSrcID),
              .memToRegWB(memToRegWB),
              .JumpInstC(JumpInstC),
              .JumpInstWB(JumpInstWB)
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
