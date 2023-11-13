`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: RegisterFile
//
// INPUTS:-
// ReadRegister1: 5-Bit address to select a register to be read through 32-Bit 
//                output port 'ReadRegister1'.
// ReadRegister2: 5-Bit address to select a register to be read through 32-Bit 
//                output port 'ReadRegister2'.
// WriteRegister: 5-Bit address to select a register to be written through 32-Bit
//                input port 'WriteRegister'.
// WriteData: 32-Bit write input port.
// RegWrite: 1-Bit control input signal.
//
// OUTPUTS:-
// ReadData1: 32-Bit registered output. 
// ReadData2: 32-Bit registered output. 
//
// FUNCTIONALITY:-
// 'ReadRegister1' and 'ReadRegister2' are two 5-bit addresses to read two 
// registers simultaneously. The two 32-bit data sets are available on ports 
// 'ReadData1' and 'ReadData2', respectively. 'ReadData1' and 'ReadData2' are 
// registered outputs (output of register file is written into these registers 
// at the falling edge of the clock). You can view it as if outputs of registers
// specified by ReadRegister1 and ReadRegister2 are written into output 
// registers ReadData1 and ReadData2 at the falling edge of the clock. 
//
// 'RegWrite' signal is high during the rising edge of the clock if the input 
// data is to be written into the register file. The contents of the register 
// specified by address 'WriteRegister' in the register file are modified at the 
// rising edge of the clock if 'RegWrite' signal is high. The D-flip flops in 
// the register file are positive-edge (rising-edge) triggered. (You have to use 
// this information to generate the write-clock properly.) 
//
// NOTE:-
// We will design the register file such that the contents of registers do not 
// change for a pre-specified time before the falling edge of the clock arrives 
// to allow for data multiplexing and setup time.
// 
// Additional Comments:
//
// Last Updated: 10:26 AM 10/28/23 by Sue
// 
//////////////////////////////////////////////////////////////////////////////////


module RegisterFile(clk, ReadRegister1, ReadRegister2, ReadData1, ReadData2, WriteRegister, WriteData, RegWrite);
    
    input clk;
    input [4:0] ReadRegister1, ReadRegister2, WriteRegister;
    input [31:0] WriteData;
    input RegWrite;
    
    integer i;
    
    output reg [31:0] ReadData1, ReadData2;
    reg [31:0] Reg [31:0];  
    
    initial begin
        for (i = 0; i < 32; i=i+1) begin
            Reg[i] = i;
        end
     end             	
	
	always @(posedge clk) begin
	   if(RegWrite) begin
	       Reg[WriteRegister] <= WriteData;
	   end
	end
	
	always @(*) begin
	   ReadData1 <= Reg[ReadRegister1];
       ReadData2 <= Reg[ReadRegister2];    
	end             

endmodule