`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  
// Module Name: InstructionMemory
//
// INPUT:-
// Address: 32-Bit address input port.
//
// OUTPUT:-
// Instruction: 32-Bit output port.
//
// FUNCTIONALITY:-
// Similar to the DataMemory, this module should also be byte-addressed
// (i.e., ignore bits 0 and 1 of 'Address'). All of the instructions will be 
// hard-coded into the instruction memory, so there is no need to write to the 
// InstructionMemory.  The contents of the InstructionMemory is the machine 
// language program to be run on your MIPS processor.
//
//
// we will store the machine code for a code written in C later. for now initialize 
// each entry to be its index * 3 (memory[i] = i * 3;)
// all you need to do is give an address as input and read the contents of the 
// address on your output port. 
// 
// Using a 32bit address you will index into the memory, output the contents of that specific 
// address. for data memory we are using 1K word of storage space. for the instruction memory 
// you may assume smaller size for practical purpose. you can use 128 words as the size and 
// hardcode the values.  in this case you need 7 bits to index into the memory. 
//
// be careful with the least two significant bits of the 32bit address. those help us index 
// into one of the 4 bytes in a word. therefore you will need to use bit [8-2] of the input address. 
// 
// Additional Comments:
//
// Last Updated: 10:16 AM 10/28/23 by George
// 
//////////////////////////////////////////////////////////////////////////////////


module InstructionMemory(PCResult, Instruction);

    input [31:0] PCResult;  
    
    output reg [31:0] Instruction; 
    
    //2D array for 128 32-Bit element memory
    reg [31:0] memory [1023:0]; 
    initial begin
        //$readmemh("lab4.mem", memory);
        //$readmemh("public_instruction_memory_lab6.mem", memory);
        //$readmemh("instruction_memory.mem", memory);
        //$readmemh("lab4withoutnop.mem", memory);
        //$readmemh("lab7instructionmemory.mem", memory);
        //$readmemh("publicCasesNoNop.mem", memory);
          //$readmemh("lab7withnop.mem", memory);
         $readmemh("private_instruction_memory_lab6.mem", memory);


    end
    
    always @* begin
        Instruction = memory[PCResult[11:2]];
    end   

endmodule
