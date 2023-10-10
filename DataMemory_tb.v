`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - DataMemory_tb.v
// Description - Test the 'DataMemory.v' module.
////////////////////////////////////////////////////////////////////////////////

module DataMemory_tb(); 

    reg     [31:0]  Address;
    reg     [31:0]  WriteData;
    reg             Clk;
    reg             MemWrite;
    reg             MemRead;

    wire [31:0] ReadData;

    DataMemory u0(
        .Address(Address), 
        .WriteData(WriteData), 
        .Clk(Clk), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .ReadData(ReadData)
    ); 

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	
    /* Please fill in the implementation here... */
	MemWrite <= 1;
        MemRead <= 0;
        Address <= 32'h00000000;
       	WriteData <= 32'h12345678;
        
        @ (posedge Clk)
        #50;
        
	    Address <= 32'h00000004;
	    WriteData <= 32'h0000000f;
	    
	@ (posedge Clk)
	#50;
	    
	    Address <= 32'h00000008;
	    WriteData <= 32'hffffffff;

	@ (posedge Clk)
	#50;
	    
	    Address <= 32'h000000002;
	    WriteData <= 32'h0000000f;
	    
		
	@ (posedge Clk)
	#50;
	    
	    MemWrite <= 0;
	    MemRead <= 1;
	    
	    Address <= 32'h00000000;
	    WriteData <= 32'h00000000;
	    
	@ (posedge Clk)
	#50;
	    
	    Address <= 32'h0000006;
	
	end

endmodule

