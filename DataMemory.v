`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  
// Module Name: DataMemory
//
// INPUTS:-
// Address: 32-Bit address input port.
// WriteData: 32-Bit input port.
// Clk: 1-Bit Input clock signal.
// MemWrite: 1-Bit control signal for memory write.
// MemRead: 1-Bit control signal for memory read.
//
// OUTPUTS:-
// ReadData: 32-Bit registered output port.
//
// FUNCTIONALITY:-
// Design the above memory similar to the 'RegisterFile' model in the previous 
// assignment.  Create a 1K memory, for which we need 10 bits.  In order to 
// implement byte addressing, we will use bits Address[11:2] to index the 
// memory location. The 'WriteData' value is written into the address 
// corresponding to Address[11:2] in the positive clock edge if 'MemWrite' 
// signal is 1. 'ReadData' is the value of memory location Address[11:2] if 
// 'MemRead' is 1, otherwise, it is 0x00000000. The reading of memory is not 
// clocked.
//
// you need to declare a 2d array. in this case we need an array of 1024 (1K)  
// 32-bit elements for the memory.   
// for example,  to declare an array of 256 32-bit elements, declaration is: reg[31:0] memory[0:255]
// if i continue with the same declaration, we need 8 bits to index to one of 256 elements. 
// however , address port for the data memory is 32 bits. from those 32 bits, least significant 2 
// bits help us index to one of the 4 bytes within a single word. therefore we only need bits [9-2] 
// of the "Address" input to index any of the 256 words. 
// 
// Additional Comments:
//
// Last Updated 10:52 AM 10/28/23 by Sue
// 
//////////////////////////////////////////////////////////////////////////////////


module DataMemory(clk, Address, WriteData, MemWrite, MemRead, ReadData); 

    // Input Address, Data that needs to be written into the address 
    input [31:0] Address, WriteData;     
    input clk, MemWrite, MemRead; 		
    	  
    // Contents of memory location at Address
    output reg[31:0] ReadData;  
    
    // an array of 1024 (1K)
    reg [31:0] memory [0:1023];                

    // The 'WriteData' value is written into the address corresponding
    // to Address[11:2] in the positive clock edge if 'MemWrite' signal is 1
    
    always @(posedge clk) begin
        if (MemWrite == 1'b1) begin
            memory[Address[11:2]] <= WriteData;
        end
    end    

    // 'ReadData' is the value of memory location Address[11:2] if 'MemRead'
    // is 1, otherwise, it is 0x00000000. The reading of memory is not clocked.
    
    always @(*) begin
        if (MemRead == 1'b1) begin
                ReadData <= memory[Address[11:2]];
        end
        else
                ReadData <= 32'h0;    
    end   

endmodule
