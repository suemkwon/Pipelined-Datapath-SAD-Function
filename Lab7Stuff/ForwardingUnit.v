`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: George
//
//////////////////////////////////////////////////////////////////////////////////


module ForwardingUnit(clk,regRTEX,regRSEX,writeRegMEM,writeRegWB,regwriteMEM,regwriteWB,bottomMuxOut,topMuxOut,branchEX);

input clk;
input [4:0] regRTEX,regRSEX,writeRegMEM,writeRegWB;
input regwriteWB,regwriteMEM;
output reg [2:0] bottomMuxOut, topMuxOut;
input branchEX;
 
 initial begin 
 bottomMuxOut = 0;
 topMuxOut = 0;
 end
 
 
  always @(negedge clk) begin
  //mem hazards
  
             bottomMuxOut = 0;
             topMuxOut = 0; 
             
     //mem/wb hazards        
//    if((writeRegWB != 0) && (regwriteWB != 0) && (writeRegWB == regRSEX) && !((regwriteMEM != 0) && (writeRegMEM != 0) && (writeRegMEM == regRSEX))) begin
//            topMuxOut = 1;
//        end
        
//         if((writeRegWB != 0) && (regwriteWB != 0) && (writeRegWB == regRTEX) && !((regwriteMEM != 0) && (writeRegMEM != 0) && (writeRegMEM == regRTEX))) begin
//            bottomMuxOut = 2;
//         end
//         //ex/mem hazards
//        if((regwriteMEM != 0) && (writeRegMEM != 0) && (writeRegMEM == regRTEX)) begin
//            bottomMuxOut = 1;
//         end 
         
//       if((regwriteMEM != 0) && (writeRegMEM != 0) && (writeRegMEM == regRSEX)) begin
//            topMuxOut = 2;
//         end 
             if((((writeRegWB != 0) && (regwriteWB != 0)) || (branchEX == 1))&& (writeRegWB == regRSEX) && !((((regwriteMEM != 0) && (writeRegMEM != 0)) || (branchEX == 1)) && (writeRegMEM == regRSEX))) begin
            topMuxOut = 1;
        end
        
         if((((writeRegWB != 0) && (regwriteWB != 0)) || (branchEX == 1)) && (writeRegWB == regRTEX) && !(((((regwriteMEM != 0) && (writeRegMEM != 0)) || (branchEX == 1)) && (writeRegMEM == regRTEX)))) begin
            bottomMuxOut = 2;
         end
         //ex/mem hazards
       if((((regwriteMEM != 0) && (writeRegMEM != 0)) || (branchEX == 1)) && (writeRegMEM == regRTEX)) begin
            bottomMuxOut = 1;
         end  
         
       if((((regwriteMEM != 0) && (writeRegMEM != 0)) || (branchEX == 1)) && (writeRegMEM == regRSEX)) begin
            topMuxOut = 2;
         end 
                     
      
    end
endmodule
