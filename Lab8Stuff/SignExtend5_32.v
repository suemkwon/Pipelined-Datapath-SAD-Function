`timescale 1ns / 1ps

module SignExtend5_32(in, out);

    input [4:0] in;
    output reg [31:0] out;
    
    always @(in) begin
        out = in;
    end

endmodule
