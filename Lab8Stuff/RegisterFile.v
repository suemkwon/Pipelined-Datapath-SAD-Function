`timescale 1ns / 1ps

module RegisterFile(clk, ReadRegister1, ReadRegister2, ReadData1, ReadData2, WriteRegister, WriteData, RegWrite);
    
    input [31:0] WriteData;
    input [4:0] ReadRegister1, ReadRegister2, WriteRegister;
    input clk, RegWrite;
    output reg [31:0] ReadData1, ReadData2;
    integer i;
    
    reg [31:0] Registers [31:0];

    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            Registers[i] = 0;
        end
     end       
        
	always @(clk or WriteData or WriteRegister or RegWrite) begin
	   if (clk && RegWrite) begin
	       Registers[WriteRegister] <= WriteData;
	   end
	end
	
	always @(clk or ReadRegister1 or ReadRegister2 or WriteRegister) begin
	   if (~clk) begin
	   	   ReadData1 <= Registers[ReadRegister1];
           ReadData2 <= Registers[ReadRegister2];    
	   end
	end             

endmodule
