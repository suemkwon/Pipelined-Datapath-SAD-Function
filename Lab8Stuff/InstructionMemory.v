`timescale 1ns / 1ps

module InstructionMemory(PCResult, Instruction);

    input [31:0] PCResult;
    output [31:0] Instruction;
    
    reg [31:0] Memory [363:0];
    
    initial begin
        $readmemh("IMlegalInstructions.mem", Memory);
    end
    
    assign Instruction = Memory[PCResult[9:2]];

endmodule
