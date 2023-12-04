`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  
// Module Name: SignExtension
// 
// Additional Comments:
//
// Last Updated: 10:22 AM 10/28/23 by Sue
// 
//////////////////////////////////////////////////////////////////////////////////


module SignExtension(in, out, zeroExt);

    input [15:0] in;
    input zeroExt;
    
    output reg [31:0] out;

    always @(in, zeroExt) begin
    
        if(zeroExt == 1)begin
            out <= {{16'b0},in};
        end 
           
        else begin
            out <= {{16{in[15]}}, in};
        end    
    end 
     
endmodule
