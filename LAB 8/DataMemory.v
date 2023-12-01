`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - data_memory.v
// Description - 32-Bit wide data memory.
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
////////////////////////////////////////////////////////////////////////////////

module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
    input Clk;
    input [1:0] MemWrite; 		// Control signal for memory write 
    input [1:0] MemRead; 			// Control signal for memory read 

    output reg[31:0] ReadData; // Contents of memory location at Address

    reg [31:0] memory [13:0];
    reg [31:0] temp, temp1;
    
    integer i = 0;
    
    initial begin
    
        $readmemh("lab7data.mem", memory);

//        for(i = 0; i < 1024; i = i + 1) begin
//            Memory[i] = 0;
//        end
//        Memory[0] = 32'd100;
//        Memory[1] = 32'd200;
//        Memory[2] = 32'd300;
//        Memory[3] = 32'd400;
//        Memory[4] = 32'd500;
//        Memory[5] = 32'd600;
//        Memory[6] = 32'd700;
//        Memory[7] = 32'd800;
//        Memory[8] = 32'd900;
//        Memory[9] = 32'd1000;
//        Memory[10] = 32'd1100;
//        Memory[11] = 32'd1200;
    end
    
    always @(posedge Clk) begin
     if (MemWrite == 1) begin
       memory[Address[13:2]] <= WriteData;
     end
     else if(MemWrite == 2) begin //b
       temp = memory[Address[11:2]];
       temp1 = temp & (32'hFFFFFF00);
       memory[Address[13:2]] = temp1 | WriteData[7:0];
     end
     else if( MemWrite == 3) begin// h
       temp = memory[Address[11:2]];
        temp1 = temp & (32'hFFFF0000);
        memory[Address[13:2]] = temp1 | WriteData[15:0];
     end
    end
    
    always @(*) begin
     if(MemRead == 1) begin
       ReadData <= memory[Address[11:2]];
     end
     else if( MemRead == 2) begin //b
        temp = memory[Address[13:2]];
        if(temp[7] == 1) begin
          ReadData <= {24'b111111111111111111111111, temp[7:0]};
          end
        else begin
          ReadData <= {24'b000000000000000000000000, temp[7:0]};
        end
     end
     else if(MemRead == 3) begin //h
        temp = memory[Address[13:2]];
        if(temp[15] == 1) begin
          ReadData <= {16'b1111111111111111, temp[15:0]};
          end
        else begin
          ReadData <= {16'b0000000000000000, temp[15:0]};
        end
     end
     else begin
       ReadData <= 0;
     end
    end

endmodule
