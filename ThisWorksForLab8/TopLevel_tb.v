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
    wire [31:0] v0out, v1out;
    wire [31:0] WriteData, ProgramCounter;
    
    TopLevel tl( 
              .clk(clk),
              .rst(rst),
              .v0out(v0out),
              .v1out(v1out),
              .WriteData(WriteData),
              .ProgramCounter(ProgramCounter)
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
//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// 
//// Module Name: TopLevel_tb
//// 
//// Additional Comments:
////
//// Last Updated: 11:00 AM 10/28/23
//// 
////////////////////////////////////////////////////////////////////////////////////


//module TopLevel_tb();

//    reg clk, rst;
//    wire [31:0] WriteData, ProgramCounter;
//    wire [31:0] aluResultEX,pcPlus4,pcresultPlus4EX,readData1ID,readData2ID,instructionOut, instruction;
//    wire [4:0] ALUOpID,aluControl,aluControlOut;
//    wire [5:0] functEX,opcode;
//    wire [31:0] B;
//    wire[31:0]aluResultWB, readMemDataWB, readData2EX, immediateEX,shiftAmountEX,pcResultPlus4wb,pcresultPlus4MemOut,twentySevenOut,readData1EX;
//    wire [4:0] ALUOpEX,writeRegEX;
//    wire aluSrcID, aluSrcEX;
//    wire [2:0] JumpInstC,memToRegWB,JumpInstWB;
//    wire PCWrite,hazardOutIFID, controlMuxControl;
//    wire [4:0] readRegRs,readRegRt,regRtEX;
//    wire memReadEX;
//    wire [2:0] bottomMuxOut,topMuxOut;
//    wire [4:0]writeRegMEM,writeRegWB,regRsEX;
//    wire regWriteMEM,regWriteWB;
//    wire [31:0] readMemDataMEM;
//    wire [31:0]aluResultMEM, readData2MEM;
//    wire memWriteMEM, memReadMEM;
//    wire [31:0] v0out,v1out;
//    TopLevel tl( 
//              .clk(clk),
//              .rst(rst),
//              .WriteData(WriteData),
//              .ProgramCounter(ProgramCounter),
//              .aluResultEX(aluResultEX),
//              .pcPlus4(pcPlus4),
//              .pcresultPlus4EX(pcresultPlus4EX),
//              .readData1ID(readData1ID),
//              .readData2ID(readData2ID),
//              .instructionOut(instructionOut),
//              .instruction(instruction),
//              .ALUOpID(ALUOpID),
//              .aluControl(aluControl),
//              .aluControlOut(aluControlOut),
//              .writeRegEX(writeRegEX),
//              .functEX(functEX),
//              .opcode(opcode),
//              .ALUOpEX(ALUOpEX),
//              .twentySevenOut(twentySevenOut),
//              .B(B),
//              //.inA2(inA2),
//              .readData1EX(readData1EX),
//              .pcResultPlus4wb(pcResultPlus4wb),
//              .aluResultWB(aluResultWB),
//              .readMemDataWB(readMemDataWB),
//              .readMemDataMEM(readMemDataMEM),
//              .pcresultPlus4MemOut(pcresultPlus4MemOut),
//              .readData2EX(readData2EX),
//              .immediateEX(immediateEX), 
//              .shiftAmountEX(shiftAmountEX),             
//              .aluSrcEX(aluSrcEX),
//              .aluSrcID(aluSrcID),
//              .memToRegWB(memToRegWB),
//              .JumpInstC(JumpInstC),
//              .JumpInstWB(JumpInstWB),
//              .PCWrite(PCWrite),
//              .hazardOutIFID(hazardOutIFID), 
//              .controlMuxControl(controlMuxControl),
//              .readRegRs(readRegRs),
//              .readRegRt(readRegRt),
//              .regRtEX(regRtEX),
//              .memReadEX(memReadEX),
//              .bottomMuxOut(bottomMuxOut),
//              .topMuxOut(topMuxOut),
//              .writeRegMEM(writeRegMEM),
//              .regRsEX(regRsEX),
//              .writeRegWB(writeRegWB),
//              .regWriteMEM(regWriteMEM),
//              .regWriteWB(regWriteWB),
//              .aluResultMEM(aluResultMEM),
//              .readData2MEM(readData2MEM),
//              .memWriteMEM(memWriteMEM),
//              .memReadMEM(memReadMEM),
//              .v0out(v0out),
//              .v1out(v1out)
           
//              );
         
//    initial begin
//        clk <= 1'b0;
//        forever #50 clk = ~clk;
//    end     
    
//    initial begin
//        rst <= 1;
//        #20; 
//        rst <= 0;
//    end   
                                        
//endmodule
