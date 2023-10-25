`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2023 03:19:03 PM
// Design Name: 
// Module Name: CircuitModule_tb
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


module CircuitModule_tb();
    reg Clk, Rst;
    wire [31:0] PCAddResult, PCMux, WriteData, ALUResult;
    
    CircuitModule CM(
        .Rst(Rst), 
        .Clk(Clk), 
        .PCAddResult(PCAddResult), 
        .PCMux(PCMux), 
        .WriteData(WriteData), 
        .ALUResult(ALUResult)
   );
        
    
    initial begin
        Clk <= 0;
        forever #10 Clk <= ~Clk;   
    end
    
    initial begin
        Rst <= 1;
        #15 Rst <= 0;
        
    end

endmodule
