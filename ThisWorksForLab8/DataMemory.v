


//endmodule
`timescale 1ns / 1ps


module DataMemory(clk, Address, WriteData, MemWrite, MemRead, ReadData,aluCode); 

    // Input Address, Data that needs to be written into the address 
    input [31:0] Address, WriteData;     
    input clk, MemWrite, MemRead; 	
    input [4:0] aluCode;
    wire [15:0] halfWord,halfWire;
    wire [7:0] byteWord,byteWire;
    reg [15:0]WriteData2;
    reg [7:0]WriteData3;	
    assign halfWord = Address[15:0];
    assign byteWord = Address[7:0];
    assign halfWire = WriteData[15:0];
    assign byteWire = WriteData[7:0];

    // Contents of memory location at Address
    output reg[31:0] ReadData;  
    
    // an array of 1024 (1K)
    reg [31:0] memory [0:8191];                


initial begin
//$readmemh("data_memory.mem", memory);
//$readmemh("public_data_memory_lab6.mem", memory);
//$readmemh("lab7data.mem", memory);
//$readmemh("trythisdatamemory.mem", memory);
 //$readmemh("private_data_memory_lab6.mem", memory);
 $readmemh("competition_frame_window_hex.mem", memory);
//$readmemh("competition_frame_window_verilog.mem", memory);
  
    
end
    // The 'WriteData' value is written into the address corresponding
    // to Address[11:2] in the positive clock edge if 'MemWrite' signal is 1
      
    
      
    always @(negedge clk) begin
    
      if (MemWrite == 1'b1) begin
        if (aluCode ==  5'b01001)begin//sh
        //WriteData2 <= WriteData[15:0];
        memory[halfWord[11:2]] <= halfWire;
        end//end if
        else if (aluCode ==  5'b00110)begin//sb
        //WriteData3 <= WriteData;
        memory[byteWord[7:0]] <= byteWire;
        end//end else if
        else
        memory[Address[14:2]] <= WriteData;//sw
            
        end //end if
        
                
    end  //end always
    
    
    
    // 'ReadData' is the value of memory location Address[11:2] if 'MemRead'
    // is 1, otherwise, it is 0x00000000. The reading of memory is not clocked.
    
    always @(*) begin
        if (MemRead == 1'b1) begin
        if (aluCode ==  5'b00111)begin//lh
        ReadData <= memory[halfWord[11:2]];
        end
        else if (aluCode ==  5'b01000)begin//lb
        ReadData <= memory[byteWord[7:0]];
        end
        
        else
                ReadData <= memory[Address[14:2]];//lw
        end//end if
        
        else
                ReadData <= 32'h0;  
                  
    end   

endmodule