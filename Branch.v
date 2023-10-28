`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: Branch
//
// Additional Comments:
//
// Last Updated: 11:50 AM 10/28/23
// 
//////////////////////////////////////////////////////////////////////////////////


module Branch(branch, zero, PCSrc);

    input branch, zero;
    output reg PCSrc;
    
    always @(*) begin
        if(branch == 1 && zero == 1) begin
            PCSrc <= 1;
        end
        else begin
            PCSrc <= 0; 
        end
    end
endmodule
