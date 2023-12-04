`timescale 1ns / 1ps

module InstructionMemory(Address, Instruction); 

    input [31:0] Address;       

    output reg [31:0] Instruction;   
  
    reg [31:0] memory [2047:0]; 
    
        initial begin
        //$readmemh("lab4.mem", memory);
        //$readmemh("public_instruction_memory_lab6.mem", memory);
        //$readmemh("private_instruction_memory_lab6.mem", memory);
       // $readmemh("instruction_memory.mem", memory);
        //$readmemh("lab4withoutnop.mem", memory);
        //$readmemh("publicCasesNoNop.mem", memory);
       // $readmemh("lab7withnop.mem", memory); //this works for lab 7
         //$readmemh("lab7withnop2.mem", memory); //this works for lab 7
        //$readmemh("instructions.mem", memory);
$readmemh("competition.mem", memory);
         // $readmemh("lab7instructionmemory.mem", memory); //this works for lab 7

        
    end
    
    always @ (*) begin
        Instruction <= memory[Address >> 2];
    end

endmodule
