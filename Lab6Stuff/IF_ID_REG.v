`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  
// Module Name: IF_ID_REG
// 
// Additional Comments:
//
// Last Updated 10:17 AM 10/28/2023 by Sue
// 
//////////////////////////////////////////////////////////////////////////////////


module IF_ID_REG(instructionIn, PCPlus4In, instructionOut, PCPlus4Out, clk,hazardOutIFID);
    input hazardOutIFID;
    input clk;
    input [31:0] instructionIn, PCPlus4In;
    output reg [31:0] instructionOut, PCPlus4Out;
    
    initial begin
        instructionOut = 0;
        PCPlus4Out = 0;
    end    
    
    always @(posedge clk) begin
    if (hazardOutIFID == 0) begin//normal operation
        instructionOut <= instructionIn;
        PCPlus4Out <= PCPlus4In;
    end
    
    else begin //hazard detection
    instructionOut <= instructionOut;
        PCPlus4Out <= PCPlus4Out;
        end //end else begin
        
    end//end always
    
endmodule
