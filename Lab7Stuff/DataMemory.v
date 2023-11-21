
`timescale 1ns / 1ps


module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
    input Clk;
    input [1:0] MemWrite; 		// Control signal for memory write 
    input [1:0] MemRead; 			// Control signal for memory read 

    output reg[31:0] ReadData; // Contents of memory location at Address

    reg [31:0] memory [9:0];
    reg[31:0] temp, temp1;
    
    integer i = 0;
    
    initial begin
    
    memory[0] <= 32'd16;
    memory[1] <= 32'd16;
    memory[2] <= 32'd4;
    memory[3] <= 32'd4;
    memory[4] <= 32'd0;
    memory[5] <= 32'd1;
    memory[6] <= 32'd2;
    memory[7] <= 32'd3;
    memory[8] <= 32'd0;
    memory[9] <= 32'd0;
    memory[10] <= 32'd0;
    memory[11] <= 32'd0;
    memory[12] <= 32'd0;
    memory[13] <= 32'd0;
    memory[14] <= 32'd0;
    memory[15] <= 32'd0;
    memory[16] <= 32'd0;
    memory[17] <= 32'd0;
    memory[18] <= 32'd0;
    memory[19] <= 32'd0;
    memory[20] <= 32'd1;
    memory[21] <= 32'd2;
    memory[22] <= 32'd3;
    memory[23] <= 32'd4;
    memory[24] <= 32'd4;
    memory[25] <= 32'd5;
    memory[26] <= 32'd6;
    memory[27] <= 32'd7;
    memory[28] <= 32'd8;
    memory[29] <= 32'd9;
    memory[30] <= 32'd10;
    memory[31] <= 32'd11;
    memory[32] <= 32'd0;
    memory[33] <= 32'd1;
    memory[34] <= 32'd2;
    memory[35] <= 32'd3;
    memory[36] <= 32'd2;
    memory[37] <= 32'd3;
    memory[38] <= 32'd32;
    memory[39] <= 32'd1;
    memory[40] <= 32'd2;
    memory[41] <= 32'd3;
    memory[42] <= 32'd12;
    memory[43] <= 32'd14;
    memory[44] <= 32'd16;
    memory[45] <= 32'd18;
    memory[46] <= 32'd20;
    memory[47] <= 32'd1;
    memory[48] <= 32'd1;
    memory[49] <= 32'd2;
    memory[50] <= 32'd3;
    memory[51] <= 32'd4;
    memory[52] <= 32'd3;
    memory[53] <= 32'd4;
    memory[54] <= 32'd1;
    memory[55] <= 32'd2;
    memory[56] <= 32'd3;
    memory[57] <= 32'd4;
    memory[58] <= 32'd18;
    memory[59] <= 32'd21;
    memory[60] <= 32'd24;
    memory[61] <= 32'd27;
    memory[62] <= 32'd30;
    memory[63] <= 32'd33;
    memory[64] <= 32'd2;
    memory[65] <= 32'd3;
    memory[66] <= 32'd4;
    memory[67] <= 32'd5;
    memory[68] <= 32'd0;
    memory[69] <= 32'd4;
    memory[70] <= 32'd2;
    memory[71] <= 32'd3;
    memory[72] <= 32'd4;
    memory[73] <= 32'd5;
    memory[74] <= 32'd24;
    memory[75] <= 32'd28;
    memory[76] <= 32'd32;
    memory[77] <= 32'd36;
    memory[78] <= 32'd40;
    memory[79] <= 32'd44;
    memory[80] <= 32'd3;
    memory[81] <= 32'd4;
    memory[82] <= 32'd5;
    memory[83] <= 32'd6;
    memory[84] <= 32'd0;
    memory[85] <= 32'd5;
    memory[86] <= 32'd3;
    memory[87] <= 32'd4;
    memory[88] <= 32'd5;
    memory[89] <= 32'd6;
    memory[90] <= 32'd30;
    memory[91] <= 32'd35;
    memory[92] <= 32'd40;
    memory[93] <= 32'd45;
    memory[94] <= 32'd50;
    memory[95] <= 32'd55;
    memory[96] <= 32'd3;
    memory[97] <= 32'd4;
    memory[98] <= 32'd5;
    memory[99] <= 32'd6;
    memory[100] <= 32'd0;
    memory[101] <= 32'd6;
    memory[102] <= 32'd12;
    memory[103] <= 32'd18;
    memory[104] <= 32'd24;
    memory[105] <= 32'd30;
    memory[106] <= 32'd36;
    memory[107] <= 32'd42;
    memory[108] <= 32'd48;
    memory[109] <= 32'd54;
    memory[110] <= 32'd60;
    memory[111] <= 32'd66;
    memory[112] <= 32'd72;
    memory[113] <= 32'd78;
    memory[114] <= 32'd84;
    memory[115] <= 32'd90;
    memory[116] <= 32'd0;
    memory[117] <= 32'd4;
    memory[118] <= 32'd14;
    memory[119] <= 32'd21;
    memory[120] <= 32'd28;
    memory[121] <= 32'd35;
    memory[122] <= 32'd42;
    memory[123] <= 32'd49;
    memory[124] <= 32'd56;
    memory[125] <= 32'd63;
    memory[126] <= 32'd70;
    memory[127] <= 32'd77;
    memory[128] <= 32'd84;
    memory[129] <= 32'd91;
    memory[130] <= 32'd98;
    memory[131] <= 32'd105;
    memory[132] <= 32'd0;
    memory[133] <= 32'd8;
    memory[134] <= 32'd16;
    memory[135] <= 32'd24;
    memory[136] <= 32'd32;
    memory[137] <= 32'd40;
    memory[138] <= 32'd48;
    memory[139] <= 32'd56;
    memory[140] <= 32'd64;
    memory[141] <= 32'd72;
    memory[142] <= 32'd80;
    memory[143] <= 32'd88;
    memory[144] <= 32'd96;
    memory[145] <= 32'd104;
    memory[146] <= 32'd112;
    memory[147] <= 32'd120;
    memory[148] <= 32'd0;
    memory[149] <= 32'd9;
    memory[150] <= 32'd18;
    memory[151] <= 32'd27;
    memory[152] <= 32'd36;
    memory[153] <= 32'd45;
    memory[154] <= 32'd54;
    memory[155] <= 32'd63;
    memory[156] <= 32'd72;
    memory[157] <= 32'd81;
    memory[158] <= 32'd90;
    memory[159] <= 32'd99;
    memory[160] <= 32'd108;
    memory[161] <= 32'd117;
    memory[162] <= 32'd126;
    memory[163] <= 32'd135;
    memory[164] <= 32'd0;
    memory[165] <= 32'd10;
    memory[166] <= 32'd20;
    memory[167] <= 32'd30;
    memory[168] <= 32'd40;
    memory[169] <= 32'd50;
    memory[170] <= 32'd60;
    memory[171] <= 32'd70;
    memory[172] <= 32'd80;
    memory[173] <= 32'd90;
    memory[174] <= 32'd100;
    memory[175] <= 32'd110;
    memory[176] <= 32'd120;
    memory[177] <= 32'd130;
    memory[178] <= 32'd140;
    memory[179] <= 32'd150;
    memory[180] <= 32'd0;
    memory[181] <= 32'd11;
    memory[182] <= 32'd22;
    memory[183] <= 32'd33;
    memory[184] <= 32'd44;
    memory[185] <= 32'd55;
    memory[186] <= 32'd66;
    memory[187] <= 32'd77;
    memory[188] <= 32'd88;
    memory[189] <= 32'd99;
    memory[190] <= 32'd110;
    memory[191] <= 32'd121;
    memory[192] <= 32'd132;
    memory[193] <= 32'd143;
    memory[194] <= 32'd154;
    memory[195] <= 32'd165;
    memory[196] <= 32'd0;
    memory[197] <= 32'd12;
    memory[198] <= 32'd24;
    memory[199] <= 32'd36;
    memory[200] <= 32'd48;
    memory[201] <= 32'd60;
    memory[202] <= 32'd72;
    memory[203] <= 32'd84;
    memory[204] <= 32'd96;
    memory[205] <= 32'd108;
    memory[206] <= 32'd120;
    memory[207] <= 32'd132;
    memory[208] <= 32'd10;
    memory[209] <= 32'd3;
    memory[210] <= 32'd100;
    memory[211] <= 32'd3;
    memory[212] <= 32'd0;
    memory[213] <= 32'd13;
    memory[214] <= 32'd26;
    memory[215] <= 32'd39;
    memory[216] <= 32'd52;
    memory[217] <= 32'd65;
    memory[218] <= 32'd78;
    memory[219] <= 32'd91;
    memory[220] <= 32'd104;
    memory[221] <= 32'd114;
    memory[222] <= 32'd130;
    memory[223] <= 32'd143;
    memory[224] <= 32'd36;
    memory[225] <= 32'd42;
    memory[226] <= 32'd23;
    memory[227] <= 32'd44;
    memory[228] <= 32'd0;
    memory[229] <= 32'd14;
    memory[230] <= 32'd28;
    memory[231] <= 32'd42;
    memory[232] <= 32'd56;
    memory[233] <= 32'd70;
    memory[234] <= 32'd84;
    memory[235] <= 32'd98;
    memory[236] <= 32'd112;
    memory[237] <= 32'd126;
    memory[238] <= 32'd140;
    memory[239] <= 32'd154;
    memory[240] <= 32'd25;
    memory[241] <= 32'd34;
    memory[242] <= 32'd33;
    memory[243] <= 32'd58;
    memory[244] <= 32'd0;
    memory[245] <= 32'd15;
    memory[246] <= 32'd30;
    memory[247] <= 32'd45;
    memory[248] <= 32'd60;
    memory[249] <= 32'd75;
    memory[250] <= 32'd90;
    memory[251] <= 32'd105;
    memory[252] <= 32'd120;
    memory[253] <= 32'd135;
    memory[254] <= 32'd150;
    memory[255] <= 32'd165;
    memory[256] <= 32'd35;
    memory[257] <= 32'd74;
    memory[258] <= 32'd55;
    memory[259] <= 32'd66;
    memory[260] <= 32'd0;
    memory[261] <= 32'd1;
    memory[262] <= 32'd2;
    memory[263] <= 32'd3;
    memory[264] <= 32'd1;
    memory[265] <= 32'd2;
    memory[266] <= 32'd3;
    memory[267] <= 32'd4;
    memory[268] <= 32'd2;
    memory[269] <= 32'd3;
    memory[270] <= 32'd4;
    memory[271] <= 32'd5;
    memory[272] <= 32'd3;
    memory[273] <= 32'd4;
    memory[274] <= 32'd5;
    memory[275] <= 32'd6;
    memory[276] <= 32'd0;

//        for(i = 0; i < 1024; i = i + 1) begin
//            Memory[i] = 0;
//        end
//        Memory[0] = 32'd100;
//        Memory[1] = 32'd200;
//        Memory[2] = 32'd300;
//        Memory[3] = 32'd400;
//        Memory[4] = 32'd500;
//        Memory[5] = 32'd600;
//        Memory[6] = 32'd700;
//        Memory[7] = 32'd800;
//        Memory[8] = 32'd900;
//        Memory[9] = 32'd1000;
//        Memory[10] = 32'd1100;
//        Memory[11] = 32'd1200;
    end
    
    always @(posedge Clk) begin
     if (MemWrite == 1) begin
       memory[Address[11:2]] <= WriteData;
     end
     else if(MemWrite == 2) begin //b
       temp = memory[Address[11:2]];
       temp1 = temp & (32'hFFFFFF00);
       memory[Address[11:2]] = temp1 | WriteData[7:0];
     end
     else if( MemWrite == 3) begin// h
       temp = memory[Address[11:2]];
        temp1 = temp & (32'hFFFF0000);
        memory[Address[11:2]] = temp1 | WriteData[15:0];
     end
    end
    
    always @(*) begin
     if(MemRead == 1) begin
       ReadData <= memory[Address[11:2]];
     end
     else if( MemRead == 2) begin //b
        temp = memory[Address[11:2]];
        if(temp[7] == 1) begin
          ReadData <= {24'b111111111111111111111111, temp[7:0]};
          end
        else begin
          ReadData <= {24'b000000000000000000000000, temp[7:0]};
        end
     end
     else if(MemRead == 3) begin //h
        temp = memory[Address[11:2]];
        if(temp[15] == 1) begin
          ReadData <= {16'b1111111111111111, temp[15:0]};
          end
        else begin
          ReadData <= {16'b0000000000000000, temp[15:0]};
        end
     end
     else begin
       ReadData <= 0;
     end
    end

endmodule
