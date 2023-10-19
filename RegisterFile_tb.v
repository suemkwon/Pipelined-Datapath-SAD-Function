`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - RegisterFile.v
// Description - Test the register_file
// Suggested test case - First write arbitrary values into 
// the saved and temporary registers (i.e., register 8 through 25). Then, 2-by-2, 
// read values from these registers.
////////////////////////////////////////////////////////////////////////////////


module RegisterFile_tb();

	reg [4:0] ReadRegister1;
	reg [4:0] ReadRegister2;
	reg	[4:0] WriteRegister;
	reg [31:0] WriteData;
	reg RegWrite;
	reg Clk;

	wire [31:0] ReadData1;
	wire [31:0] ReadData2;


	RegisterFile u0(
		.ReadRegister1(ReadRegister1), 
		.ReadRegister2(ReadRegister2), 
		.WriteRegister(WriteRegister), 
		.WriteData(WriteData), 
		.RegWrite(RegWrite), 
		.Clk(Clk), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2)
	);

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	
    /* Please fill in the implementation here... */

	ReadRegister1   <= 5'b00000;      
        ReadRegister2   <= 5'b00000;
        
        @(posedge Clk); 
        ReadRegister1   <= 5'b0111;   
		
        #5;
        RegWrite        <= 5'd1;           
        WriteRegister   <= 0;             
        WriteData       <= 32'h000000001;   
        
        @(posedge Clk); 
        #5;
        WriteRegister   <= 5'd8;         
        WriteData       <= 32'h00000005;

	// begin assignment Write
		
        @(posedge Clk); 
        #5;
        WriteRegister   <= 5'd9;        
        WriteData       <= 32'h00000007;
        
        @(posedge Clk); 
        #5;
        WriteRegister   <= 5'd10;         
        WriteData       <= 32'h00000009;
        
        @(posedge Clk); 
        #5;
        WriteRegister   <= 5'd11;           
        WriteData       <= 32'h0000000f;
                
        @(posedge Clk); 
        #5;
        WriteRegister   <= 5'd12;           
        WriteData       <= 32'h00000005;
        
        @(posedge Clk); 
        #5;
        WriteRegister   <= 5'd13;          
        WriteData       <= 32'h0000000a;
                
        @(posedge Clk); 
        #5;
        WriteRegister   <= 5'd14;           
        WriteData       <= 32'h00000003;
                
        @(posedge Clk); 
        #5;
        WriteRegister   <= 5'd15;           
        WriteData       <= 32'h0000000b;
                        
        @(posedge Clk); 
        #5;
        WriteRegister   <= 5'd16;           
        WriteData       <= 32'h0000000b;
        
        @(posedge Clk); 
        #5;
        WriteRegister   <= 5'd17;           
        WriteData       <= 32'h0000000c;
                
        @(posedge Clk); 
        #5;
        WriteRegister   <= 5'd18;           
        WriteData       <= 32'h00000008;
                
        @(posedge Clk); 
        #5;
        WriteRegister   <= 5'd19;           
        WriteData       <= 32'h00000006;
                        
        @(posedge Clk); 
        #5;
        WriteRegister   <= 5'd20;           
        WriteData       <= 32'h0000000d;
		
        @(posedge Clk); 
        #5;
        WriteRegister   <= 5'd21;          
        WriteData       <= 32'h00000001;
                        
        @(posedge Clk); 
        #5;
        WriteRegister   <= 5'd22;           
        WriteData       <= 32'h0000000e;
                        
        @(posedge Clk); 
        #5;
        WriteRegister   <= 5'd23;           
        WriteData       <= 32'h00000011;
                                
        @(posedge Clk); 
        #5;
        WriteRegister   <= 5'd24;           
        WriteData       <= 32'h00000022;
        
        @(posedge Clk); 
        #5;
        WriteRegister   <= 5'd25;           
        WriteData       <= 32'h0000ffff;
		
	// end assignment Write 
               
        @(posedge Clk); 
        #5;
        WriteRegister   <= 5'h15;         
        WriteData       <= 32'h00000014;
        
        @(posedge Clk); 
        #10;        
        RegWrite        <= 0;
        
        ReadRegister1   <= 0;         
        ReadRegister2   <= 8;     
        
        @(posedge Clk);
        #10; 
        ReadRegister1   <= 21;        
        ReadRegister2   <= 31;      
        
	// begin assignment Read
		
        @(posedge Clk);
        #10; 
        ReadRegister1   <= 9;          
        ReadRegister2   <= 10;        
        
        @(posedge Clk);
        #10; 
        ReadRegister1   <= 15;          
        ReadRegister2   <= 16;
        
        @(posedge Clk);
        #10; 
        ReadRegister1   <= 19;          
        ReadRegister2   <= 20;        
              
        @(posedge Clk);
        #10; 
        ReadRegister1   <= 25;          
        ReadRegister2   <= 8;   
	
	end

endmodule
