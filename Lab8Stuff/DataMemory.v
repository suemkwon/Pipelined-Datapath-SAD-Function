`timescale 1ns / 1ps

module DataMemory(clk, Address, WriteData, MemWrite, MemRead, ReadData); 
    
    input [63:0] Address; 	
    input [31:0] WriteData; 
    input MemWrite, MemRead, clk; 			

    output reg[31:0] ReadData; 

    reg[63:0] Memory[0:1023];
    
    initial begin
        $readmemh("lab7data.mem", Memory);
    end
    
    always @(posedge clk) begin
        if(MemWrite == 1) begin
            Memory[Address[11:2]] <= WriteData;
        end          
    end        
    
    always @(MemRead or Address) begin
        if(MemRead == 1) begin
            ReadData <= Memory[Address[11:2]];
        end
        else
            ReadData <= 0;
    end    
endmodule
