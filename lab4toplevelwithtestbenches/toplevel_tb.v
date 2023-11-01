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
    wire [31:0] aluResultEX,pcPlus4,pcresultPlus4EX,readData1ID,readData2ID;
    wire [4:0] ALUOpID;
    wire aluSrcID;
    
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
              .ALUOpID(ALUOpID),
              .functEX(functEX),
              .ALUOpEX(ALUOpEX),
              .aluSrcID(aluSrcID)
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
