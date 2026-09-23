
`timescale 1ns / 100ps

module aluctrl(cond_fit, ASTAT5, ASTAT3, ASTAT4_in, MSTAT0, IR, 
               load_AX1_1st, load_AX0_1st, load_AX1_2nd, load_AX0_2nd, sel_Xop,
               load_AY1_1st, load_AY1_2nd, en_AY0_1st, en_AY0_2nd, sel_Yop,
               PMD2AY, en_AF_1st, en_AF_2nd, DIVS, 
               CI_in, is_div, is_logic_func, inv_Xop, inv_Yop, 
               load_AR, en_AR_1st, en_AR_2nd, 
               ARtoR, AR2DMD, sel_AX0, AXx2DMD, sel_AY0, AYx2DMD,
               update_AS, update_ASTAT0_3);

input cond_fit, ASTAT5, ASTAT3, ASTAT4_in, MSTAT0 ;
input [23:0] IR;

output load_AX1_1st, load_AX0_1st, load_AX1_2nd, load_AX0_2nd;
output load_AY1_1st, load_AY1_2nd, en_AY0_1st, en_AY0_2nd;
output PMD2AY, en_AF_1st, en_AF_2nd, DIVS;
output CI_in, is_div, is_logic_func, inv_Xop, inv_Yop;
output load_AR, en_AR_1st, en_AR_2nd;
output ARtoR, AR2DMD, sel_AX0, AXx2DMD, sel_AY0, AYx2DMD;
output update_AS, update_ASTAT0_3;
output [1:0] sel_Xop, sel_Yop;

wire TYPE1, TYPE3, TYPE4, TYPE5, TYPE6, TYPE8, TYPE9, TYPE12, TYPE13;
wire TYPE14, TYPE17, TYPE23, TYPE24;
wire DIVQ, DIVS;
wire load_AX1, load_AX0, load_AY1, load_AY0;
wire zero_Yop, is_constant_op, en_AF, update_AR, en_AR;

assign TYPE1 = (IR[23:22] == 2'b11);
assign TYPE3 = (IR[23:21] == 3'b100);
assign TYPE4 = (IR[23:21] == 3'b011);
assign TYPE5 = (IR[23:20] == 4'b0101);
assign TYPE6 = (IR[23:20] == 4'b0100);
assign TYPE8 = (IR[23:19] == 5'b00101);
assign TYPE9 = (IR[23:19] == 5'b00100);
assign TYPE12 = (IR[23:17] == 7'b0001001);
assign TYPE13 = (IR[23:16] == 8'b00010001);
assign TYPE14 = (IR[23:15] == 9'b000100000);
assign TYPE17 = (IR[23:12] == 12'b000011011111);
assign TYPE23 = (IR[23:11] == 13'b0000011111010); 
assign TYPE24 = (IR[23:13] == 11'b00000111111); 

assign DIVQ = TYPE23;
assign DIVS = TYPE24;

assign load_AX1 = (TYPE1 & (IR[19:18]==2'b01)) | 
                  ((IR[3:0]==4'b0001)) |
                  (((TYPE3 & (IR[20:18]==3'b000)) | TYPE6) & (IR[3:0]==4'b0001)) |
                  ((TYPE4 | TYPE5) & (!IR[19]) & (IR[7:4]==4'b0001)) |
                  ((TYPE8 | TYPE14) & (IR[7:4]==4'b0001)) |
                  ((TYPE12 | TYPE13) & (!IR[15]) & (IR[7:4]==4'b0001)) |
                  (TYPE17 & (IR[11:10]==2'b00) & (IR[7:4]==4'b0001));

assign load_AX1_1st = !MSTAT0 & load_AX1;
assign load_AX1_2nd =  MSTAT0 & load_AX1;

assign load_AX0 = (TYPE1 & (IR[19:18]==2'b00)) |
                  ((IR[3:0]==4'b0000)) |
                  (((TYPE3 & (IR[20:18]==3'b000)) | TYPE6) & (IR[3:0]==4'b0000)) |
                  ((TYPE4 | TYPE5) & (!IR[19]) & (IR[7:4]==4'b0000)) |
                  ((TYPE8 | TYPE14) & (IR[7:4]==4'b0000)) |
                  ((TYPE12 | TYPE13) & (!IR[15]) & (IR[7:4]==4'b0000)) |
                  (TYPE17 & (IR[11:10]==2'b00) & (IR[7:4]==4'b0000));

assign load_AX0_1st = !MSTAT0 & load_AX0;
assign load_AX0_2nd =  MSTAT0 & load_AX0;

assign sel_Xop[1] = (IR[16:13] == 4'b0000) | (IR[16:13] == 4'b1001) | 
                    (IR[16:13] == 4'b0100) | (IR[16:13] == 4'b0111) | 
                    ((IR[16:13] == 4'b1000) & (!DIVQ));
assign sel_Xop[0] = IR[10] | IR[9];

assign PMD2AY = TYPE1 & (!IR[21]);

assign load_AY1 = (PMD2AY & IR[20]) | 
                  ((IR[3:0]==4'b0101)) |
                  (((TYPE3 & (IR[20:18]==3'b000)) | TYPE6) & (IR[3:0]==4'b0101)) |
                  ((TYPE4 | TYPE5) & (!IR[19]) & (IR[7:4]==4'b0101)) |
                  ((TYPE8 | TYPE14) & (IR[7:4]==4'b0101)) |
                  ((TYPE12 | TYPE13) & (!IR[15]) & (IR[7:4]==4'b0101)) |
                  (TYPE17 & (IR[11:10]==2'b00) & (IR[7:4]==4'b0101));

assign load_AY1_1st = !MSTAT0 & load_AY1;
assign load_AY1_2nd =  MSTAT0 & load_AY1;

assign load_AY0 = (PMD2AY & !IR[20]) |
                  ((IR[3:0]==4'b0100)) | 
                  (((TYPE3 & (IR[20:18]==3'b000)) | TYPE6) & (IR[3:0]==4'b0100)) |
                  ((TYPE4 | TYPE5) & (!IR[19]) & (IR[7:4]==4'b0111)) |
                  ((TYPE8 | TYPE14) & (IR[7:4]==4'b0100)) |
                  ((TYPE12 | TYPE13) & (!IR[15]) & (IR[7:4]==4'b0100)) |
                  (TYPE17 & (IR[11:10]==2'b00) & (IR[7:4]==4'b0101));

assign en_AY0_1st = !MSTAT0 & (load_AY0 | is_div);
assign en_AY0_2nd =  MSTAT0 & (load_AY0 | is_div);

assign zero_Yop = (IR[16:13] == 4'b1011) | (IR[16:13] == 4'b0101) | 
                  (IR[12:11] == 2'b11);

assign is_constant_op = TYPE9 & IR[17] & IR[4];

assign sel_Yop[1] = zero_Yop | is_constant_op;
assign sel_Yop[0] = (!is_constant_op) & (zero_Yop | (IR[12:11] == 2'b10));

assign en_AF = (TYPE4 | TYPE5 | TYPE8 | (TYPE9 & cond_fit)) & IR[17] & IR[18];

assign en_AF_1st = !MSTAT0 & (en_AF | is_div); 
assign en_AF_2nd =  MSTAT0 & (en_AF | is_div); 

assign CI_in = (IR[16:13] == 4'b0001) | ((IR[16:13] == 4'b0010) & ASTAT3) |
               (IR[16:13] == 4'b0101) | ((IR[16:13] == 4'b0110) & ASTAT3) |
               (IR[16:13] == 4'b0111) | (IR[16:13] == 4'b1001) | 
               ((IR[16:13] == 4'b1010) & ASTAT3) | 
               ((IR[16:13] == 4'b1111) & ASTAT4_in) | (DIVQ & !ASTAT5);

assign is_div = DIVQ | DIVS;

assign is_logic_func = (IR[16:13] == 4'b1100) | (IR[16:13] == 4'b1101) | 
                       (IR[16:13] == 4'b1110);

assign inv_Xop = ((IR[16:13] == 4'b1000) & (!DIVQ)) | (IR[16:13] == 4'b1001) |
                 (IR[16:13] == 4'b1010) | (IR[16:13] == 4'b1011) | 
                 ((IR[16:13] == 4'b1111) & ASTAT4_in) | (DIVQ & !ASTAT5);

assign inv_Yop = (IR[16:15] == 2'b01);

assign load_AR = (((TYPE3 & (IR[20:18]==3'b000)) | TYPE6) & (IR[3:0]==4'b1010)) |
                 ((TYPE4 | TYPE5) & (!IR[19]) & (IR[7:4]==4'b1010)) |
                 ((TYPE8 | TYPE14) & (IR[7:4]==4'b1010)) | 
                 ((IR[3:0]==4'b1010)) |
                 ((TYPE12 | TYPE13) & (!IR[15]) & (IR[7:4]==4'b1010)) |
                 (TYPE17 & (IR[11:10]==2'b00) & (IR[7:4]==4'b1010));

assign update_AR = (TYPE1 & IR[17]) | 
                  ((TYPE4 | TYPE5 | TYPE8 | (TYPE9 & cond_fit)) & IR[17] & !IR[18]);

assign en_AR = update_AR | load_AR;

assign en_AR_1st = !MSTAT0 & en_AR; 

assign en_AR_2nd =  MSTAT0 & en_AR; 

assign ARtoR = (IR[10:8] == 3'b010);

assign AR2DMD = (TYPE3 & (IR[20:18]==3'b100) & (IR[3:0]==4'b1010)) |
                ((TYPE8 | TYPE14) & (IR[3:0]==4'b1010)) | 
                ((IR[3:0]==4'b1010)) |        
                (TYPE17 & (IR[9:8]==2'b00) & (IR[3:0]==4'b1010)) |
                ((TYPE4 | TYPE5) & IR[19] & (IR[7:4]==4'b1010)) |
                ((TYPE12 | TYPE13) & IR[15] & (IR[7:4]==4'b1010));

assign sel_AX0 = (TYPE3 & (IR[20:18]==3'b100) & (IR[3:0]==4'b0000)) |
                 ((TYPE8 | TYPE14) & (IR[3:0]==4'b0000)) |
                 ((IR[3:0]==4'b0000)) |
                 (TYPE17 & (IR[9:8]==2'b00) & (IR[3:0]==4'b0000)) |
                 ((TYPE4 | TYPE5) & IR[19] & (IR[7:4]==4'b0000)) |
                 ((TYPE12 | TYPE13) & IR[15] & (IR[7:4]==4'b0000));

assign AXx2DMD = (TYPE3 & (IR[20:18]==3'b100) & (IR[3:1]==3'b000)) | 
                 ((TYPE8 | TYPE14) & (IR[3:1]==3'b000)) | 
                 ((IR[3:1]==3'b000)) | 
                 (TYPE17 & (IR[9:8]==2'b00) & (IR[3:1]==3'b000)) |
                 ((TYPE4 | TYPE5) & IR[19] & (IR[7:5]==3'b000)) |
                 ((TYPE12 | TYPE13) & IR[15] & (IR[7:5]==3'b000));

assign sel_AY0 = (TYPE3 & (IR[20:18]==3'b100) & (IR[3:0]==4'b0100)) |
                 ((TYPE8 | TYPE14) & (IR[3:0]==4'b0100)) |
                 ((IR[3:0]==4'b0100)) |
                 (TYPE17 & (IR[9:8]==2'b11) & (IR[3:0]==4'b0100)) |
                 ((TYPE4 | TYPE5) & IR[19] & (IR[7:4]==4'b0100)) |
                 ((TYPE12 | TYPE13) & IR[15] & (IR[7:4]==4'b0111));

assign AYx2DMD = (TYPE3 & (IR[20:18]==3'b100) & (IR[3:1]==3'b010)) |
                 ((TYPE8 | TYPE14) & (IR[3:1]==3'b010)) | 
                 ((IR[3:1]==3'b010)) | 
                 (TYPE17 & (IR[9:8]==2'b00) & (IR[3:1]==3'b010)) |
                 ((TYPE4 | TYPE5) & IR[19] & (IR[7:5]==3'b010)) |
                 ((TYPE12 | TYPE13) & IR[15] & (IR[7:5]==3'b010));

assign update_AS = (TYPE1 | (TYPE4 | TYPE5 | TYPE8 | (TYPE9 & cond_fit))) &
                   IR[17] & (IR[16:13]==4'b1111);

assign update_ASTAT0_3 = (TYPE1 | (TYPE4 | TYPE5 | TYPE8 | (TYPE9 & cond_fit))) &
                         IR[17];

endmodule
