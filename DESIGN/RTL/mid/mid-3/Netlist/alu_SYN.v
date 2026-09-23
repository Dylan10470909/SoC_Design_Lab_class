/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : U-2022.12
// Date      : Fri Apr 28 09:51:07 2023
/////////////////////////////////////////////////////////////


module alu ( clk, reset_, cond_fit, ASTAT5, ASTAT3, MSTAT3, MSTAT0, IR, 
        PMD23_8, DMD, DMD_in, R, R_in, ASTAT5_in, ASTAT4_in, ASTAT3_in, 
        ASTAT2_in, ASTAT1_in, ASTAT0_in, update_AQ, update_AS, update_ASTAT0_3, 
        AX0_1st, AX0_2nd, AX1_1st, AX1_2nd, AY0_1st, AY0_2nd, AY1_1st, AY1_2nd, 
        AR_1st, AR_2nd, AF_1st, AF_2nd );
  input [23:0] IR;
  input [15:0] PMD23_8;
  output [15:0] DMD;
  input [15:0] DMD_in;
  output [15:0] R;
  input [15:0] R_in;
  output [15:0] AX0_1st;
  output [15:0] AX0_2nd;
  output [15:0] AX1_1st;
  output [15:0] AX1_2nd;
  output [15:0] AY0_1st;
  output [15:0] AY0_2nd;
  output [15:0] AY1_1st;
  output [15:0] AY1_2nd;
  output [15:0] AR_1st;
  output [15:0] AR_2nd;
  output [15:0] AF_1st;
  output [15:0] AF_2nd;
  input clk, reset_, cond_fit, ASTAT5, ASTAT3, MSTAT3, MSTAT0;
  output ASTAT5_in, ASTAT4_in, ASTAT3_in, ASTAT2_in, ASTAT1_in, ASTAT0_in,
         update_AQ, update_AS, update_ASTAT0_3;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, load_AX1_1st, N35, load_AX0_1st,
         load_AX1_2nd, load_AX0_2nd, N36, N37, N38, N39, N40, N41, DIVS, N42,
         N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55,
         PMD2AY, N56, is_div, N57, N58, Q_in, load_AY1_1st, en_AY0_1st,
         load_AY1_2nd, en_AY0_2nd, N59, N60, N61, N62, N63, N64, N65, N66, N67,
         N68, N69, N70, N71, N72, N73, N74, en_AF_1st, en_AF_2nd, N75, N76,
         load_AR, N77, en_AR_1st, en_AR_2nd, N78, N79, ARtoR, sel_AX0, N80,
         sel_AY0, N81, AYx2DMD, AXx2DMD, AR2DMD, CI_in, is_logic_func, inv_Xop,
         inv_Yop, N82, N83, N84, N85, N86, N87, N88, N89, N90, N91, N92, N93,
         N94, N95, N96, N97, N98, N99, N100, N101, N102, N103, N104, N105,
         N106, N107, N108, N109, N110, N111, N112, N113, N114, N115, N116,
         N117, N118, N119, N120, N121, N122, N123, N124, N125, N126, N127,
         N128, N129, N130, N131, N132, N133, N134, N135, N136, N137, N138,
         N139, N140, N141, N142, N143, N144, N145;
  wire   [15:0] AX1;
  wire   [15:0] AX0;
  wire   [15:0] AX;
  wire   [1:0] sel_Xop;
  wire   [15:0] alu_Xop;
  wire   [15:0] AY_in;
  wire   [15:0] AY0;
  wire   [15:0] AY0_in;
  wire   [15:0] AY1;
  wire   [15:0] AY;
  wire   [1:0] sel_Yop;
  wire   [15:0] alu_Yop;
  wire   [15:0] AF;
  wire   [15:0] constYop;
  wire   [15:0] alu_R;
  wire   [15:0] AF_in;
  wire   [15:0] AR_in;
  wire   [15:0] AR;
  wire   [15:0] AXx;
  wire   [15:0] AYx;

  \**SEQGEN**  AX1_1st_reg_15_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[15]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_1st[15]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_1st) );
  \**SEQGEN**  AX1_1st_reg_14_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[14]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_1st[14]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_1st) );
  \**SEQGEN**  AX1_1st_reg_13_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[13]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_1st[13]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_1st) );
  \**SEQGEN**  AX1_1st_reg_12_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[12]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_1st[12]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_1st) );
  \**SEQGEN**  AX1_1st_reg_11_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[11]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_1st[11]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_1st) );
  \**SEQGEN**  AX1_1st_reg_10_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[10]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_1st[10]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_1st) );
  \**SEQGEN**  AX1_1st_reg_9_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[9]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_1st[9]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_1st) );
  \**SEQGEN**  AX1_1st_reg_8_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[8]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_1st[8]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_1st) );
  \**SEQGEN**  AX1_1st_reg_7_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_1st[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_1st) );
  \**SEQGEN**  AX1_1st_reg_6_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_1st[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_1st) );
  \**SEQGEN**  AX1_1st_reg_5_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_1st[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_1st) );
  \**SEQGEN**  AX1_1st_reg_4_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_1st[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_1st) );
  \**SEQGEN**  AX1_1st_reg_3_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_1st[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_1st) );
  \**SEQGEN**  AX1_1st_reg_2_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_1st[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_1st) );
  \**SEQGEN**  AX1_1st_reg_1_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_1st[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_1st) );
  \**SEQGEN**  AX1_1st_reg_0_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_1st[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_1st) );
  \**SEQGEN**  AX0_1st_reg_15_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[15]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_1st[15]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_1st) );
  \**SEQGEN**  AX0_1st_reg_14_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[14]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_1st[14]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_1st) );
  \**SEQGEN**  AX0_1st_reg_13_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[13]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_1st[13]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_1st) );
  \**SEQGEN**  AX0_1st_reg_12_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[12]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_1st[12]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_1st) );
  \**SEQGEN**  AX0_1st_reg_11_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[11]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_1st[11]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_1st) );
  \**SEQGEN**  AX0_1st_reg_10_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[10]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_1st[10]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_1st) );
  \**SEQGEN**  AX0_1st_reg_9_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[9]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_1st[9]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_1st) );
  \**SEQGEN**  AX0_1st_reg_8_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[8]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_1st[8]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_1st) );
  \**SEQGEN**  AX0_1st_reg_7_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_1st[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_1st) );
  \**SEQGEN**  AX0_1st_reg_6_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_1st[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_1st) );
  \**SEQGEN**  AX0_1st_reg_5_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_1st[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_1st) );
  \**SEQGEN**  AX0_1st_reg_4_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_1st[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_1st) );
  \**SEQGEN**  AX0_1st_reg_3_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_1st[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_1st) );
  \**SEQGEN**  AX0_1st_reg_2_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_1st[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_1st) );
  \**SEQGEN**  AX0_1st_reg_1_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_1st[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_1st) );
  \**SEQGEN**  AX0_1st_reg_0_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_1st[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_1st) );
  \**SEQGEN**  AX1_2nd_reg_15_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[15]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_2nd[15]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_2nd) );
  \**SEQGEN**  AX1_2nd_reg_14_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[14]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_2nd[14]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_2nd) );
  \**SEQGEN**  AX1_2nd_reg_13_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[13]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_2nd[13]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_2nd) );
  \**SEQGEN**  AX1_2nd_reg_12_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[12]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_2nd[12]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_2nd) );
  \**SEQGEN**  AX1_2nd_reg_11_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[11]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_2nd[11]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_2nd) );
  \**SEQGEN**  AX1_2nd_reg_10_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[10]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_2nd[10]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_2nd) );
  \**SEQGEN**  AX1_2nd_reg_9_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[9]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_2nd[9]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_2nd) );
  \**SEQGEN**  AX1_2nd_reg_8_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[8]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_2nd[8]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_2nd) );
  \**SEQGEN**  AX1_2nd_reg_7_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_2nd[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_2nd) );
  \**SEQGEN**  AX1_2nd_reg_6_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_2nd[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_2nd) );
  \**SEQGEN**  AX1_2nd_reg_5_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_2nd[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_2nd) );
  \**SEQGEN**  AX1_2nd_reg_4_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_2nd[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_2nd) );
  \**SEQGEN**  AX1_2nd_reg_3_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_2nd[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_2nd) );
  \**SEQGEN**  AX1_2nd_reg_2_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_2nd[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_2nd) );
  \**SEQGEN**  AX1_2nd_reg_1_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_2nd[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_2nd) );
  \**SEQGEN**  AX1_2nd_reg_0_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX1_2nd[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX1_2nd) );
  \**SEQGEN**  AX0_2nd_reg_15_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[15]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_2nd[15]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_2nd) );
  \**SEQGEN**  AX0_2nd_reg_14_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[14]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_2nd[14]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_2nd) );
  \**SEQGEN**  AX0_2nd_reg_13_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[13]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_2nd[13]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_2nd) );
  \**SEQGEN**  AX0_2nd_reg_12_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[12]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_2nd[12]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_2nd) );
  \**SEQGEN**  AX0_2nd_reg_11_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[11]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_2nd[11]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_2nd) );
  \**SEQGEN**  AX0_2nd_reg_10_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[10]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_2nd[10]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_2nd) );
  \**SEQGEN**  AX0_2nd_reg_9_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[9]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_2nd[9]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_2nd) );
  \**SEQGEN**  AX0_2nd_reg_8_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[8]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_2nd[8]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_2nd) );
  \**SEQGEN**  AX0_2nd_reg_7_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_2nd[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_2nd) );
  \**SEQGEN**  AX0_2nd_reg_6_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_2nd[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_2nd) );
  \**SEQGEN**  AX0_2nd_reg_5_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_2nd[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_2nd) );
  \**SEQGEN**  AX0_2nd_reg_4_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_2nd[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_2nd) );
  \**SEQGEN**  AX0_2nd_reg_3_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_2nd[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_2nd) );
  \**SEQGEN**  AX0_2nd_reg_2_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_2nd[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_2nd) );
  \**SEQGEN**  AX0_2nd_reg_1_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_2nd[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_2nd) );
  \**SEQGEN**  AX0_2nd_reg_0_ ( .clear(N35), .preset(1'b0), .next_state(
        DMD_in[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AX0_2nd[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AX0_2nd) );
  GTECH_AND2 C366 ( .A(N42), .B(N43), .Z(N45) );
  GTECH_AND2 C367 ( .A(N45), .B(N44), .Z(N46) );
  GTECH_OR2 C369 ( .A(sel_Xop[1]), .B(N43), .Z(N47) );
  GTECH_OR2 C370 ( .A(N47), .B(DIVS), .Z(N48) );
  GTECH_AND2 C373 ( .A(sel_Xop[1]), .B(N50), .Z(N51) );
  GTECH_OR2 C375 ( .A(sel_Xop[0]), .B(N52), .Z(N53) );
  GTECH_AND2 C377 ( .A(sel_Xop[0]), .B(DIVS), .Z(N55) );
  \**SEQGEN**  AY1_1st_reg_15_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[15]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_1st[15]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_1st) );
  \**SEQGEN**  AY1_1st_reg_14_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[14]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_1st[14]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_1st) );
  \**SEQGEN**  AY1_1st_reg_13_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[13]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_1st[13]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_1st) );
  \**SEQGEN**  AY1_1st_reg_12_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[12]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_1st[12]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_1st) );
  \**SEQGEN**  AY1_1st_reg_11_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[11]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_1st[11]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_1st) );
  \**SEQGEN**  AY1_1st_reg_10_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[10]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_1st[10]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_1st) );
  \**SEQGEN**  AY1_1st_reg_9_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[9]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_1st[9]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_1st) );
  \**SEQGEN**  AY1_1st_reg_8_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[8]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_1st[8]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_1st) );
  \**SEQGEN**  AY1_1st_reg_7_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_1st[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_1st) );
  \**SEQGEN**  AY1_1st_reg_6_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_1st[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_1st) );
  \**SEQGEN**  AY1_1st_reg_5_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_1st[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_1st) );
  \**SEQGEN**  AY1_1st_reg_4_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_1st[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_1st) );
  \**SEQGEN**  AY1_1st_reg_3_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_1st[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_1st) );
  \**SEQGEN**  AY1_1st_reg_2_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_1st[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_1st) );
  \**SEQGEN**  AY1_1st_reg_1_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_1st[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_1st) );
  \**SEQGEN**  AY1_1st_reg_0_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_1st[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_1st) );
  \**SEQGEN**  AY0_1st_reg_15_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[15]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_1st[15]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_1st) );
  \**SEQGEN**  AY0_1st_reg_14_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[14]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_1st[14]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_1st) );
  \**SEQGEN**  AY0_1st_reg_13_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[13]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_1st[13]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_1st) );
  \**SEQGEN**  AY0_1st_reg_12_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[12]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_1st[12]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_1st) );
  \**SEQGEN**  AY0_1st_reg_11_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[11]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_1st[11]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_1st) );
  \**SEQGEN**  AY0_1st_reg_10_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[10]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_1st[10]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_1st) );
  \**SEQGEN**  AY0_1st_reg_9_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[9]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_1st[9]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_1st) );
  \**SEQGEN**  AY0_1st_reg_8_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[8]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_1st[8]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_1st) );
  \**SEQGEN**  AY0_1st_reg_7_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_1st[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_1st) );
  \**SEQGEN**  AY0_1st_reg_6_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_1st[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_1st) );
  \**SEQGEN**  AY0_1st_reg_5_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_1st[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_1st) );
  \**SEQGEN**  AY0_1st_reg_4_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_1st[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_1st) );
  \**SEQGEN**  AY0_1st_reg_3_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_1st[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_1st) );
  \**SEQGEN**  AY0_1st_reg_2_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_1st[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_1st) );
  \**SEQGEN**  AY0_1st_reg_1_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_1st[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_1st) );
  \**SEQGEN**  AY0_1st_reg_0_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_1st[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_1st) );
  \**SEQGEN**  AY1_2nd_reg_15_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[15]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_2nd[15]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_2nd) );
  \**SEQGEN**  AY1_2nd_reg_14_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[14]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_2nd[14]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_2nd) );
  \**SEQGEN**  AY1_2nd_reg_13_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[13]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_2nd[13]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_2nd) );
  \**SEQGEN**  AY1_2nd_reg_12_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[12]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_2nd[12]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_2nd) );
  \**SEQGEN**  AY1_2nd_reg_11_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[11]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_2nd[11]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_2nd) );
  \**SEQGEN**  AY1_2nd_reg_10_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[10]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_2nd[10]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_2nd) );
  \**SEQGEN**  AY1_2nd_reg_9_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[9]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_2nd[9]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_2nd) );
  \**SEQGEN**  AY1_2nd_reg_8_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[8]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_2nd[8]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_2nd) );
  \**SEQGEN**  AY1_2nd_reg_7_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_2nd[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_2nd) );
  \**SEQGEN**  AY1_2nd_reg_6_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_2nd[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_2nd) );
  \**SEQGEN**  AY1_2nd_reg_5_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_2nd[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_2nd) );
  \**SEQGEN**  AY1_2nd_reg_4_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_2nd[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_2nd) );
  \**SEQGEN**  AY1_2nd_reg_3_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_2nd[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_2nd) );
  \**SEQGEN**  AY1_2nd_reg_2_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_2nd[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_2nd) );
  \**SEQGEN**  AY1_2nd_reg_1_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_2nd[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_2nd) );
  \**SEQGEN**  AY1_2nd_reg_0_ ( .clear(N35), .preset(1'b0), .next_state(
        AY_in[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY1_2nd[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load_AY1_2nd) );
  \**SEQGEN**  AY0_2nd_reg_15_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[15]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_2nd[15]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_2nd) );
  \**SEQGEN**  AY0_2nd_reg_14_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[14]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_2nd[14]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_2nd) );
  \**SEQGEN**  AY0_2nd_reg_13_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[13]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_2nd[13]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_2nd) );
  \**SEQGEN**  AY0_2nd_reg_12_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[12]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_2nd[12]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_2nd) );
  \**SEQGEN**  AY0_2nd_reg_11_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[11]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_2nd[11]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_2nd) );
  \**SEQGEN**  AY0_2nd_reg_10_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[10]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_2nd[10]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_2nd) );
  \**SEQGEN**  AY0_2nd_reg_9_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[9]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_2nd[9]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_2nd) );
  \**SEQGEN**  AY0_2nd_reg_8_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[8]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_2nd[8]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_2nd) );
  \**SEQGEN**  AY0_2nd_reg_7_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_2nd[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_2nd) );
  \**SEQGEN**  AY0_2nd_reg_6_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_2nd[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_2nd) );
  \**SEQGEN**  AY0_2nd_reg_5_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_2nd[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_2nd) );
  \**SEQGEN**  AY0_2nd_reg_4_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_2nd[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_2nd) );
  \**SEQGEN**  AY0_2nd_reg_3_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_2nd[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_2nd) );
  \**SEQGEN**  AY0_2nd_reg_2_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_2nd[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_2nd) );
  \**SEQGEN**  AY0_2nd_reg_1_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_2nd[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_2nd) );
  \**SEQGEN**  AY0_2nd_reg_0_ ( .clear(N35), .preset(1'b0), .next_state(
        AY0_in[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AY0_2nd[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AY0_2nd) );
  GTECH_AND2 C807 ( .A(N65), .B(N66), .Z(N67) );
  GTECH_OR2 C809 ( .A(sel_Yop[1]), .B(N66), .Z(N68) );
  GTECH_OR2 C812 ( .A(N65), .B(sel_Yop[0]), .Z(N70) );
  GTECH_AND2 C814 ( .A(sel_Yop[1]), .B(sel_Yop[0]), .Z(N72) );
  \**SEQGEN**  AF_1st_reg_15_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[15]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_1st[15]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_1st) );
  \**SEQGEN**  AF_1st_reg_14_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[14]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_1st[14]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_1st) );
  \**SEQGEN**  AF_1st_reg_13_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[13]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_1st[13]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_1st) );
  \**SEQGEN**  AF_1st_reg_12_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[12]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_1st[12]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_1st) );
  \**SEQGEN**  AF_1st_reg_11_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[11]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_1st[11]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_1st) );
  \**SEQGEN**  AF_1st_reg_10_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[10]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_1st[10]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_1st) );
  \**SEQGEN**  AF_1st_reg_9_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[9]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_1st[9]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_1st) );
  \**SEQGEN**  AF_1st_reg_8_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[8]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_1st[8]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_1st) );
  \**SEQGEN**  AF_1st_reg_7_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_1st[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_1st) );
  \**SEQGEN**  AF_1st_reg_6_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_1st[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_1st) );
  \**SEQGEN**  AF_1st_reg_5_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_1st[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_1st) );
  \**SEQGEN**  AF_1st_reg_4_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_1st[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_1st) );
  \**SEQGEN**  AF_1st_reg_3_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_1st[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_1st) );
  \**SEQGEN**  AF_1st_reg_2_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_1st[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_1st) );
  \**SEQGEN**  AF_1st_reg_1_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_1st[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_1st) );
  \**SEQGEN**  AF_1st_reg_0_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_1st[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_1st) );
  \**SEQGEN**  AF_2nd_reg_15_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[15]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_2nd[15]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_2nd) );
  \**SEQGEN**  AF_2nd_reg_14_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[14]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_2nd[14]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_2nd) );
  \**SEQGEN**  AF_2nd_reg_13_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[13]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_2nd[13]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_2nd) );
  \**SEQGEN**  AF_2nd_reg_12_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[12]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_2nd[12]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_2nd) );
  \**SEQGEN**  AF_2nd_reg_11_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[11]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_2nd[11]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_2nd) );
  \**SEQGEN**  AF_2nd_reg_10_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[10]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_2nd[10]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_2nd) );
  \**SEQGEN**  AF_2nd_reg_9_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[9]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_2nd[9]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_2nd) );
  \**SEQGEN**  AF_2nd_reg_8_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[8]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_2nd[8]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_2nd) );
  \**SEQGEN**  AF_2nd_reg_7_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_2nd[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_2nd) );
  \**SEQGEN**  AF_2nd_reg_6_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_2nd[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_2nd) );
  \**SEQGEN**  AF_2nd_reg_5_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_2nd[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_2nd) );
  \**SEQGEN**  AF_2nd_reg_4_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_2nd[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_2nd) );
  \**SEQGEN**  AF_2nd_reg_3_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_2nd[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_2nd) );
  \**SEQGEN**  AF_2nd_reg_2_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_2nd[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_2nd) );
  \**SEQGEN**  AF_2nd_reg_1_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_2nd[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_2nd) );
  \**SEQGEN**  AF_2nd_reg_0_ ( .clear(N35), .preset(1'b0), .next_state(
        AF_in[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AF_2nd[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AF_2nd) );
  \**SEQGEN**  AR_1st_reg_15_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[15]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_1st[15]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_1st) );
  \**SEQGEN**  AR_1st_reg_14_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[14]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_1st[14]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_1st) );
  \**SEQGEN**  AR_1st_reg_13_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[13]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_1st[13]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_1st) );
  \**SEQGEN**  AR_1st_reg_12_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[12]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_1st[12]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_1st) );
  \**SEQGEN**  AR_1st_reg_11_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[11]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_1st[11]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_1st) );
  \**SEQGEN**  AR_1st_reg_10_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[10]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_1st[10]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_1st) );
  \**SEQGEN**  AR_1st_reg_9_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[9]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_1st[9]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_1st) );
  \**SEQGEN**  AR_1st_reg_8_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[8]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_1st[8]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_1st) );
  \**SEQGEN**  AR_1st_reg_7_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_1st[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_1st) );
  \**SEQGEN**  AR_1st_reg_6_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_1st[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_1st) );
  \**SEQGEN**  AR_1st_reg_5_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_1st[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_1st) );
  \**SEQGEN**  AR_1st_reg_4_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_1st[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_1st) );
  \**SEQGEN**  AR_1st_reg_3_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_1st[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_1st) );
  \**SEQGEN**  AR_1st_reg_2_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_1st[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_1st) );
  \**SEQGEN**  AR_1st_reg_1_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_1st[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_1st) );
  \**SEQGEN**  AR_1st_reg_0_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_1st[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_1st) );
  \**SEQGEN**  AR_2nd_reg_15_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[15]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_2nd[15]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_2nd) );
  \**SEQGEN**  AR_2nd_reg_14_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[14]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_2nd[14]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_2nd) );
  \**SEQGEN**  AR_2nd_reg_13_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[13]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_2nd[13]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_2nd) );
  \**SEQGEN**  AR_2nd_reg_12_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[12]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_2nd[12]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_2nd) );
  \**SEQGEN**  AR_2nd_reg_11_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[11]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_2nd[11]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_2nd) );
  \**SEQGEN**  AR_2nd_reg_10_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[10]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_2nd[10]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_2nd) );
  \**SEQGEN**  AR_2nd_reg_9_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[9]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_2nd[9]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_2nd) );
  \**SEQGEN**  AR_2nd_reg_8_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[8]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_2nd[8]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_2nd) );
  \**SEQGEN**  AR_2nd_reg_7_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_2nd[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_2nd) );
  \**SEQGEN**  AR_2nd_reg_6_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_2nd[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_2nd) );
  \**SEQGEN**  AR_2nd_reg_5_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_2nd[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_2nd) );
  \**SEQGEN**  AR_2nd_reg_4_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_2nd[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_2nd) );
  \**SEQGEN**  AR_2nd_reg_3_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_2nd[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_2nd) );
  \**SEQGEN**  AR_2nd_reg_2_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_2nd[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_2nd) );
  \**SEQGEN**  AR_2nd_reg_1_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_2nd[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_2nd) );
  \**SEQGEN**  AR_2nd_reg_0_ ( .clear(N35), .preset(1'b0), .next_state(
        AR_in[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        AR_2nd[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(en_AR_2nd) );
  constgen U_CONSTGEN ( .IR12_11(IR[12:11]), .IR7_6(IR[7:6]), .IR5(IR[5]), 
        .constYop(constYop) );
  aluctrl aluctrl ( .cond_fit(cond_fit), .ASTAT5(ASTAT5), .ASTAT3(ASTAT3), 
        .ASTAT4_in(ASTAT4_in), .MSTAT0(MSTAT0), .IR(IR), .load_AX1_1st(
        load_AX1_1st), .load_AX0_1st(load_AX0_1st), .load_AX1_2nd(load_AX1_2nd), .load_AX0_2nd(load_AX0_2nd), .sel_Xop(sel_Xop), .load_AY1_1st(load_AY1_1st), 
        .load_AY1_2nd(load_AY1_2nd), .en_AY0_1st(en_AY0_1st), .en_AY0_2nd(
        en_AY0_2nd), .sel_Yop(sel_Yop), .PMD2AY(PMD2AY), .en_AF_1st(en_AF_1st), 
        .en_AF_2nd(en_AF_2nd), .DIVS(DIVS), .CI_in(CI_in), .is_div(is_div), 
        .is_logic_func(is_logic_func), .inv_Xop(inv_Xop), .inv_Yop(inv_Yop), 
        .load_AR(load_AR), .en_AR_1st(en_AR_1st), .en_AR_2nd(en_AR_2nd), 
        .ARtoR(ARtoR), .AR2DMD(AR2DMD), .sel_AX0(sel_AX0), .AXx2DMD(AXx2DMD), 
        .sel_AY0(sel_AY0), .AYx2DMD(AYx2DMD), .update_AS(update_AS), 
        .update_ASTAT0_3(update_ASTAT0_3) );
  alufunc U_calufunc ( .MSTAT3(MSTAT3), .CI_in(CI_in), .is_div(is_div), 
        .is_logic_func(is_logic_func), .inv_Xop(inv_Xop), .inv_Yop(inv_Yop), 
        .DIVS(DIVS), .IR14_13(IR[14:13]), .alu_Xop(alu_Xop), .alu_Yop(alu_Yop), 
        .alu_R(alu_R), .ASTAT5_in(ASTAT5_in), .ASTAT4_in(ASTAT4_in), 
        .ASTAT3_in(ASTAT3_in), .ASTAT2_in(ASTAT2_in), .ASTAT1_in(ASTAT1_in), 
        .ASTAT0_in(ASTAT0_in), .Q_in(Q_in) );
  SELECT_OP C1294 ( .DATA1(AX1_2nd), .DATA2(AX1_1st), .CONTROL1(N0), 
        .CONTROL2(N1), .Z(AX1) );
  GTECH_BUF B_0 ( .A(N37), .Z(N0) );
  GTECH_BUF B_1 ( .A(N36), .Z(N1) );
  SELECT_OP C1295 ( .DATA1(AX0_2nd), .DATA2(AX0_1st), .CONTROL1(N2), 
        .CONTROL2(N3), .Z(AX0) );
  GTECH_BUF B_2 ( .A(N39), .Z(N2) );
  GTECH_BUF B_3 ( .A(N38), .Z(N3) );
  SELECT_OP C1296 ( .DATA1(AX1), .DATA2(AX0), .CONTROL1(N4), .CONTROL2(N41), 
        .Z(AX) );
  GTECH_BUF B_4 ( .A(N40), .Z(N4) );
  SELECT_OP C1297 ( .DATA1(AX), .DATA2(R_in), .DATA3({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA4({AX[15], 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA5({R_in[15], 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N5), .CONTROL2(N6), .CONTROL3(N7), .CONTROL4(N8), .CONTROL5(N9), 
        .Z(alu_Xop) );
  GTECH_BUF B_5 ( .A(N46), .Z(N5) );
  GTECH_BUF B_6 ( .A(N49), .Z(N6) );
  GTECH_BUF B_7 ( .A(N51), .Z(N7) );
  GTECH_BUF B_8 ( .A(N54), .Z(N8) );
  GTECH_BUF B_9 ( .A(N55), .Z(N9) );
  SELECT_OP C1298 ( .DATA1(PMD23_8), .DATA2(DMD_in), .CONTROL1(N10), 
        .CONTROL2(N11), .Z(AY_in) );
  GTECH_BUF B_10 ( .A(PMD2AY), .Z(N10) );
  GTECH_BUF B_11 ( .A(N56), .Z(N11) );
  SELECT_OP C1299 ( .DATA1({AY0[14:0], Q_in}), .DATA2(AY_in), .CONTROL1(N12), 
        .CONTROL2(N13), .Z(AY0_in) );
  GTECH_BUF B_12 ( .A(N58), .Z(N12) );
  GTECH_BUF B_13 ( .A(N57), .Z(N13) );
  SELECT_OP C1300 ( .DATA1(AY1_2nd), .DATA2(AY1_1st), .CONTROL1(N14), 
        .CONTROL2(N15), .Z(AY1) );
  GTECH_BUF B_14 ( .A(N60), .Z(N14) );
  GTECH_BUF B_15 ( .A(N59), .Z(N15) );
  SELECT_OP C1301 ( .DATA1(AY0_2nd), .DATA2(AY0_1st), .CONTROL1(N16), 
        .CONTROL2(N17), .Z(AY0) );
  GTECH_BUF B_16 ( .A(N62), .Z(N16) );
  GTECH_BUF B_17 ( .A(N61), .Z(N17) );
  SELECT_OP C1302 ( .DATA1(AY1), .DATA2(AY0), .CONTROL1(N18), .CONTROL2(N64), 
        .Z(AY) );
  GTECH_BUF B_18 ( .A(N63), .Z(N18) );
  SELECT_OP C1303 ( .DATA1(AY), .DATA2(AF), .DATA3(constYop), .DATA4({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0}), .CONTROL1(N19), .CONTROL2(N20), .CONTROL3(N21), 
        .CONTROL4(N22), .Z(alu_Yop) );
  GTECH_BUF B_19 ( .A(N67), .Z(N19) );
  GTECH_BUF B_20 ( .A(N69), .Z(N20) );
  GTECH_BUF B_21 ( .A(N71), .Z(N21) );
  GTECH_BUF B_22 ( .A(N72), .Z(N22) );
  SELECT_OP C1304 ( .DATA1({alu_R[14:0], AY0[15]}), .DATA2(alu_R), .CONTROL1(
        N23), .CONTROL2(N24), .Z(AF_in) );
  GTECH_BUF B_23 ( .A(N74), .Z(N23) );
  GTECH_BUF B_24 ( .A(N73), .Z(N24) );
  SELECT_OP C1305 ( .DATA1(AF_2nd), .DATA2(AF_1st), .CONTROL1(N25), .CONTROL2(
        N26), .Z(AF) );
  GTECH_BUF B_25 ( .A(N76), .Z(N25) );
  GTECH_BUF B_26 ( .A(N75), .Z(N26) );
  SELECT_OP C1306 ( .DATA1(DMD_in), .DATA2(alu_R), .CONTROL1(N27), .CONTROL2(
        N28), .Z(AR_in) );
  GTECH_BUF B_27 ( .A(load_AR), .Z(N27) );
  GTECH_BUF B_28 ( .A(N77), .Z(N28) );
  SELECT_OP C1307 ( .DATA1(AR_2nd), .DATA2(AR_1st), .CONTROL1(N29), .CONTROL2(
        N30), .Z(AR) );
  GTECH_BUF B_29 ( .A(N79), .Z(N29) );
  GTECH_BUF B_30 ( .A(N78), .Z(N30) );
  SELECT_OP C1308 ( .DATA1(AX0), .DATA2(AX1), .CONTROL1(N31), .CONTROL2(N32), 
        .Z(AXx) );
  GTECH_BUF B_31 ( .A(sel_AX0), .Z(N31) );
  GTECH_BUF B_32 ( .A(N80), .Z(N32) );
  SELECT_OP C1309 ( .DATA1(AY0), .DATA2(AY1), .CONTROL1(N33), .CONTROL2(N34), 
        .Z(AYx) );
  GTECH_BUF B_33 ( .A(sel_AY0), .Z(N33) );
  GTECH_BUF B_34 ( .A(N81), .Z(N34) );
  GTECH_NOT I_0 ( .A(reset_), .Z(N35) );
  GTECH_NOT I_1 ( .A(MSTAT0), .Z(N36) );
  GTECH_BUF B_35 ( .A(MSTAT0), .Z(N37) );
  GTECH_NOT I_2 ( .A(MSTAT0), .Z(N38) );
  GTECH_BUF B_36 ( .A(MSTAT0), .Z(N39) );
  GTECH_BUF B_37 ( .A(IR[8]), .Z(N40) );
  GTECH_NOT I_3 ( .A(N40), .Z(N41) );
  GTECH_NOT I_4 ( .A(sel_Xop[1]), .Z(N42) );
  GTECH_NOT I_5 ( .A(sel_Xop[0]), .Z(N43) );
  GTECH_NOT I_6 ( .A(DIVS), .Z(N44) );
  GTECH_NOT I_7 ( .A(N48), .Z(N49) );
  GTECH_NOT I_8 ( .A(DIVS), .Z(N50) );
  GTECH_NOT I_9 ( .A(DIVS), .Z(N52) );
  GTECH_NOT I_10 ( .A(N53), .Z(N54) );
  GTECH_NOT I_11 ( .A(PMD2AY), .Z(N56) );
  GTECH_NOT I_12 ( .A(is_div), .Z(N57) );
  GTECH_BUF B_38 ( .A(is_div), .Z(N58) );
  GTECH_NOT I_13 ( .A(MSTAT0), .Z(N59) );
  GTECH_BUF B_39 ( .A(MSTAT0), .Z(N60) );
  GTECH_NOT I_14 ( .A(MSTAT0), .Z(N61) );
  GTECH_BUF B_40 ( .A(MSTAT0), .Z(N62) );
  GTECH_BUF B_41 ( .A(IR[11]), .Z(N63) );
  GTECH_NOT I_15 ( .A(N63), .Z(N64) );
  GTECH_NOT I_16 ( .A(sel_Yop[1]), .Z(N65) );
  GTECH_NOT I_17 ( .A(sel_Yop[0]), .Z(N66) );
  GTECH_NOT I_18 ( .A(N68), .Z(N69) );
  GTECH_NOT I_19 ( .A(N70), .Z(N71) );
  GTECH_NOT I_20 ( .A(is_div), .Z(N73) );
  GTECH_BUF B_42 ( .A(is_div), .Z(N74) );
  GTECH_NOT I_21 ( .A(MSTAT0), .Z(N75) );
  GTECH_BUF B_43 ( .A(MSTAT0), .Z(N76) );
  GTECH_NOT I_22 ( .A(load_AR), .Z(N77) );
  GTECH_NOT I_23 ( .A(MSTAT0), .Z(N78) );
  GTECH_BUF B_44 ( .A(MSTAT0), .Z(N79) );
  GTECH_AND2 C1383 ( .A(ARtoR), .B(AR[15]), .Z(R[15]) );
  GTECH_AND2 C1384 ( .A(ARtoR), .B(AR[14]), .Z(R[14]) );
  GTECH_AND2 C1385 ( .A(ARtoR), .B(AR[13]), .Z(R[13]) );
  GTECH_AND2 C1386 ( .A(ARtoR), .B(AR[12]), .Z(R[12]) );
  GTECH_AND2 C1387 ( .A(ARtoR), .B(AR[11]), .Z(R[11]) );
  GTECH_AND2 C1388 ( .A(ARtoR), .B(AR[10]), .Z(R[10]) );
  GTECH_AND2 C1389 ( .A(ARtoR), .B(AR[9]), .Z(R[9]) );
  GTECH_AND2 C1390 ( .A(ARtoR), .B(AR[8]), .Z(R[8]) );
  GTECH_AND2 C1391 ( .A(ARtoR), .B(AR[7]), .Z(R[7]) );
  GTECH_AND2 C1392 ( .A(ARtoR), .B(AR[6]), .Z(R[6]) );
  GTECH_AND2 C1393 ( .A(ARtoR), .B(AR[5]), .Z(R[5]) );
  GTECH_AND2 C1394 ( .A(ARtoR), .B(AR[4]), .Z(R[4]) );
  GTECH_AND2 C1395 ( .A(ARtoR), .B(AR[3]), .Z(R[3]) );
  GTECH_AND2 C1396 ( .A(ARtoR), .B(AR[2]), .Z(R[2]) );
  GTECH_AND2 C1397 ( .A(ARtoR), .B(AR[1]), .Z(R[1]) );
  GTECH_AND2 C1398 ( .A(ARtoR), .B(AR[0]), .Z(R[0]) );
  GTECH_NOT I_24 ( .A(sel_AX0), .Z(N80) );
  GTECH_NOT I_25 ( .A(sel_AY0), .Z(N81) );
  GTECH_OR2 C1405 ( .A(N84), .B(N85), .Z(DMD[15]) );
  GTECH_OR2 C1406 ( .A(N82), .B(N83), .Z(N84) );
  GTECH_AND2 C1407 ( .A(AYx2DMD), .B(AYx[15]), .Z(N82) );
  GTECH_AND2 C1408 ( .A(AXx2DMD), .B(AXx[15]), .Z(N83) );
  GTECH_AND2 C1409 ( .A(AR2DMD), .B(AR[15]), .Z(N85) );
  GTECH_OR2 C1410 ( .A(N88), .B(N89), .Z(DMD[14]) );
  GTECH_OR2 C1411 ( .A(N86), .B(N87), .Z(N88) );
  GTECH_AND2 C1412 ( .A(AYx2DMD), .B(AYx[14]), .Z(N86) );
  GTECH_AND2 C1413 ( .A(AXx2DMD), .B(AXx[14]), .Z(N87) );
  GTECH_AND2 C1414 ( .A(AR2DMD), .B(AR[14]), .Z(N89) );
  GTECH_OR2 C1415 ( .A(N92), .B(N93), .Z(DMD[13]) );
  GTECH_OR2 C1416 ( .A(N90), .B(N91), .Z(N92) );
  GTECH_AND2 C1417 ( .A(AYx2DMD), .B(AYx[13]), .Z(N90) );
  GTECH_AND2 C1418 ( .A(AXx2DMD), .B(AXx[13]), .Z(N91) );
  GTECH_AND2 C1419 ( .A(AR2DMD), .B(AR[13]), .Z(N93) );
  GTECH_OR2 C1420 ( .A(N96), .B(N97), .Z(DMD[12]) );
  GTECH_OR2 C1421 ( .A(N94), .B(N95), .Z(N96) );
  GTECH_AND2 C1422 ( .A(AYx2DMD), .B(AYx[12]), .Z(N94) );
  GTECH_AND2 C1423 ( .A(AXx2DMD), .B(AXx[12]), .Z(N95) );
  GTECH_AND2 C1424 ( .A(AR2DMD), .B(AR[12]), .Z(N97) );
  GTECH_OR2 C1425 ( .A(N100), .B(N101), .Z(DMD[11]) );
  GTECH_OR2 C1426 ( .A(N98), .B(N99), .Z(N100) );
  GTECH_AND2 C1427 ( .A(AYx2DMD), .B(AYx[11]), .Z(N98) );
  GTECH_AND2 C1428 ( .A(AXx2DMD), .B(AXx[11]), .Z(N99) );
  GTECH_AND2 C1429 ( .A(AR2DMD), .B(AR[11]), .Z(N101) );
  GTECH_OR2 C1430 ( .A(N104), .B(N105), .Z(DMD[10]) );
  GTECH_OR2 C1431 ( .A(N102), .B(N103), .Z(N104) );
  GTECH_AND2 C1432 ( .A(AYx2DMD), .B(AYx[10]), .Z(N102) );
  GTECH_AND2 C1433 ( .A(AXx2DMD), .B(AXx[10]), .Z(N103) );
  GTECH_AND2 C1434 ( .A(AR2DMD), .B(AR[10]), .Z(N105) );
  GTECH_OR2 C1435 ( .A(N108), .B(N109), .Z(DMD[9]) );
  GTECH_OR2 C1436 ( .A(N106), .B(N107), .Z(N108) );
  GTECH_AND2 C1437 ( .A(AYx2DMD), .B(AYx[9]), .Z(N106) );
  GTECH_AND2 C1438 ( .A(AXx2DMD), .B(AXx[9]), .Z(N107) );
  GTECH_AND2 C1439 ( .A(AR2DMD), .B(AR[9]), .Z(N109) );
  GTECH_OR2 C1440 ( .A(N112), .B(N113), .Z(DMD[8]) );
  GTECH_OR2 C1441 ( .A(N110), .B(N111), .Z(N112) );
  GTECH_AND2 C1442 ( .A(AYx2DMD), .B(AYx[8]), .Z(N110) );
  GTECH_AND2 C1443 ( .A(AXx2DMD), .B(AXx[8]), .Z(N111) );
  GTECH_AND2 C1444 ( .A(AR2DMD), .B(AR[8]), .Z(N113) );
  GTECH_OR2 C1445 ( .A(N116), .B(N117), .Z(DMD[7]) );
  GTECH_OR2 C1446 ( .A(N114), .B(N115), .Z(N116) );
  GTECH_AND2 C1447 ( .A(AYx2DMD), .B(AYx[7]), .Z(N114) );
  GTECH_AND2 C1448 ( .A(AXx2DMD), .B(AXx[7]), .Z(N115) );
  GTECH_AND2 C1449 ( .A(AR2DMD), .B(AR[7]), .Z(N117) );
  GTECH_OR2 C1450 ( .A(N120), .B(N121), .Z(DMD[6]) );
  GTECH_OR2 C1451 ( .A(N118), .B(N119), .Z(N120) );
  GTECH_AND2 C1452 ( .A(AYx2DMD), .B(AYx[6]), .Z(N118) );
  GTECH_AND2 C1453 ( .A(AXx2DMD), .B(AXx[6]), .Z(N119) );
  GTECH_AND2 C1454 ( .A(AR2DMD), .B(AR[6]), .Z(N121) );
  GTECH_OR2 C1455 ( .A(N124), .B(N125), .Z(DMD[5]) );
  GTECH_OR2 C1456 ( .A(N122), .B(N123), .Z(N124) );
  GTECH_AND2 C1457 ( .A(AYx2DMD), .B(AYx[5]), .Z(N122) );
  GTECH_AND2 C1458 ( .A(AXx2DMD), .B(AXx[5]), .Z(N123) );
  GTECH_AND2 C1459 ( .A(AR2DMD), .B(AR[5]), .Z(N125) );
  GTECH_OR2 C1460 ( .A(N128), .B(N129), .Z(DMD[4]) );
  GTECH_OR2 C1461 ( .A(N126), .B(N127), .Z(N128) );
  GTECH_AND2 C1462 ( .A(AYx2DMD), .B(AYx[4]), .Z(N126) );
  GTECH_AND2 C1463 ( .A(AXx2DMD), .B(AXx[4]), .Z(N127) );
  GTECH_AND2 C1464 ( .A(AR2DMD), .B(AR[4]), .Z(N129) );
  GTECH_OR2 C1465 ( .A(N132), .B(N133), .Z(DMD[3]) );
  GTECH_OR2 C1466 ( .A(N130), .B(N131), .Z(N132) );
  GTECH_AND2 C1467 ( .A(AYx2DMD), .B(AYx[3]), .Z(N130) );
  GTECH_AND2 C1468 ( .A(AXx2DMD), .B(AXx[3]), .Z(N131) );
  GTECH_AND2 C1469 ( .A(AR2DMD), .B(AR[3]), .Z(N133) );
  GTECH_OR2 C1470 ( .A(N136), .B(N137), .Z(DMD[2]) );
  GTECH_OR2 C1471 ( .A(N134), .B(N135), .Z(N136) );
  GTECH_AND2 C1472 ( .A(AYx2DMD), .B(AYx[2]), .Z(N134) );
  GTECH_AND2 C1473 ( .A(AXx2DMD), .B(AXx[2]), .Z(N135) );
  GTECH_AND2 C1474 ( .A(AR2DMD), .B(AR[2]), .Z(N137) );
  GTECH_OR2 C1475 ( .A(N140), .B(N141), .Z(DMD[1]) );
  GTECH_OR2 C1476 ( .A(N138), .B(N139), .Z(N140) );
  GTECH_AND2 C1477 ( .A(AYx2DMD), .B(AYx[1]), .Z(N138) );
  GTECH_AND2 C1478 ( .A(AXx2DMD), .B(AXx[1]), .Z(N139) );
  GTECH_AND2 C1479 ( .A(AR2DMD), .B(AR[1]), .Z(N141) );
  GTECH_OR2 C1480 ( .A(N144), .B(N145), .Z(DMD[0]) );
  GTECH_OR2 C1481 ( .A(N142), .B(N143), .Z(N144) );
  GTECH_AND2 C1482 ( .A(AYx2DMD), .B(AYx[0]), .Z(N142) );
  GTECH_AND2 C1483 ( .A(AXx2DMD), .B(AXx[0]), .Z(N143) );
  GTECH_AND2 C1484 ( .A(AR2DMD), .B(AR[0]), .Z(N145) );
endmodule


module alufunc ( MSTAT3, CI_in, is_div, is_logic_func, inv_Xop, inv_Yop, DIVS, 
        IR14_13, alu_Xop, alu_Yop, alu_R, ASTAT5_in, ASTAT4_in, ASTAT3_in, 
        ASTAT2_in, ASTAT1_in, ASTAT0_in, Q_in );
  input [1:0] IR14_13;
  input [15:0] alu_Xop;
  input [15:0] alu_Yop;
  output [15:0] alu_R;
  input MSTAT3, CI_in, is_div, is_logic_func, inv_Xop, inv_Yop, DIVS;
  output ASTAT5_in, ASTAT4_in, ASTAT3_in, ASTAT2_in, ASTAT1_in, ASTAT0_in,
         Q_in;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, cout, overflow, N25, N26,
         N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40,
         N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54,
         N56, N57, N58, N59, N60, N61, N62, N63, N64;
  wire   [15:0] Xop_in;
  wire   [15:0] Yop_in;
  wire   [15:0] adder_out;
  wire   [15:0] XandY;
  wire   [15:0] XorY;
  wire   [15:0] XxorY;
  wire   [15:0] logic_out;
  wire   [15:0] R_not_satu;
  wire   [15:14] R_satu;
  assign ASTAT4_in = alu_Xop[13];
  assign ASTAT1_in = alu_R[15];

  GTECH_AND2 C87 ( .A(N25), .B(N26), .Z(N27) );
  GTECH_OR2 C89 ( .A(IR14_13[1]), .B(N26), .Z(N28) );
  GTECH_NOT I_0 ( .A(alu_R[4]), .Z(N38) );
  GTECH_NOT I_1 ( .A(alu_R[0]), .Z(N39) );
  GTECH_OR2 C197 ( .A(alu_R[14]), .B(alu_R[15]), .Z(N40) );
  GTECH_OR2 C198 ( .A(alu_R[13]), .B(N40), .Z(N41) );
  GTECH_OR2 C199 ( .A(alu_R[12]), .B(N41), .Z(N42) );
  GTECH_OR2 C200 ( .A(alu_R[11]), .B(N42), .Z(N43) );
  GTECH_OR2 C201 ( .A(alu_R[10]), .B(N43), .Z(N44) );
  GTECH_OR2 C202 ( .A(alu_R[9]), .B(N44), .Z(N45) );
  GTECH_OR2 C203 ( .A(alu_R[8]), .B(N45), .Z(N46) );
  GTECH_OR2 C204 ( .A(alu_R[7]), .B(N46), .Z(N47) );
  GTECH_OR2 C205 ( .A(alu_R[6]), .B(N47), .Z(N48) );
  GTECH_OR2 C206 ( .A(alu_R[5]), .B(N48), .Z(N49) );
  GTECH_OR2 C207 ( .A(N38), .B(N49), .Z(N50) );
  GTECH_OR2 C208 ( .A(alu_R[3]), .B(N50), .Z(N51) );
  GTECH_OR2 C209 ( .A(alu_R[2]), .B(N51), .Z(N52) );
  GTECH_OR2 C210 ( .A(alu_R[1]), .B(N52), .Z(N53) );
  GTECH_OR2 C211 ( .A(N39), .B(N53), .Z(N54) );
  GTECH_NOT I_2 ( .A(N54), .Z(ASTAT0_in) );
  ADD_UNS_OP add_32 ( .A(Xop_in), .B(Yop_in), .Z({N24, N23, N22, N21, N20, N19, 
        N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8}) );
  ADD_UNS_OP add_32_2 ( .A({N24, N23, N22, N21, N20, N19, N18, N17, N16, N15, 
        N14, N13, N12, N11, N10, N9, N8}), .B(CI_in), .Z({cout, adder_out}) );
  SELECT_OP C213 ( .DATA1(XandY), .DATA2(XorY), .DATA3(XxorY), .CONTROL1(N0), 
        .CONTROL2(N1), .CONTROL3(N2), .Z(logic_out) );
  GTECH_BUF B_0 ( .A(N27), .Z(N0) );
  GTECH_BUF B_1 ( .A(N29), .Z(N1) );
  GTECH_BUF B_2 ( .A(IR14_13[1]), .Z(N2) );
  SELECT_OP C214 ( .DATA1(logic_out), .DATA2(adder_out), .CONTROL1(N3), 
        .CONTROL2(N4), .Z(R_not_satu) );
  GTECH_BUF B_3 ( .A(is_logic_func), .Z(N3) );
  GTECH_BUF B_4 ( .A(N30), .Z(N4) );
  SELECT_OP C215 ( .DATA1({R_satu, R_satu[14], R_satu[14], R_satu[14], 
        R_satu[14], R_satu[14], R_satu[14], R_satu[14], R_satu[14], R_satu[14], 
        R_satu[14], R_satu[14], R_satu[14], R_satu[14], R_satu[14]}), .DATA2(
        R_not_satu), .CONTROL1(N5), .CONTROL2(N33), .Z(alu_R) );
  GTECH_BUF B_5 ( .A(N32), .Z(N5) );
  SELECT_OP C216 ( .DATA1(N34), .DATA2(N35), .CONTROL1(N6), .CONTROL2(N7), .Z(
        ASTAT5_in) );
  GTECH_BUF B_6 ( .A(DIVS), .Z(N6) );
  GTECH_BUF B_7 ( .A(N36), .Z(N7) );
  SELECT_OP C217 ( .DATA1(ASTAT5_in), .DATA2(N37), .CONTROL1(N6), .CONTROL2(N7), .Z(Q_in) );
  GTECH_XOR2 C219 ( .A(inv_Xop), .B(alu_Xop[15]), .Z(Xop_in[15]) );
  GTECH_XOR2 C220 ( .A(inv_Xop), .B(alu_Xop[14]), .Z(Xop_in[14]) );
  GTECH_XOR2 C221 ( .A(inv_Xop), .B(alu_Xop[13]), .Z(Xop_in[13]) );
  GTECH_XOR2 C222 ( .A(inv_Xop), .B(alu_Xop[12]), .Z(Xop_in[12]) );
  GTECH_XOR2 C223 ( .A(inv_Xop), .B(alu_Xop[11]), .Z(Xop_in[11]) );
  GTECH_XOR2 C224 ( .A(inv_Xop), .B(alu_Xop[10]), .Z(Xop_in[10]) );
  GTECH_XOR2 C225 ( .A(inv_Xop), .B(alu_Xop[9]), .Z(Xop_in[9]) );
  GTECH_XOR2 C226 ( .A(inv_Xop), .B(alu_Xop[8]), .Z(Xop_in[8]) );
  GTECH_XOR2 C227 ( .A(inv_Xop), .B(alu_Xop[7]), .Z(Xop_in[7]) );
  GTECH_XOR2 C228 ( .A(inv_Xop), .B(alu_Xop[6]), .Z(Xop_in[6]) );
  GTECH_XOR2 C229 ( .A(inv_Xop), .B(alu_Xop[5]), .Z(Xop_in[5]) );
  GTECH_XOR2 C230 ( .A(inv_Xop), .B(alu_Xop[4]), .Z(Xop_in[4]) );
  GTECH_XOR2 C231 ( .A(inv_Xop), .B(alu_Xop[3]), .Z(Xop_in[3]) );
  GTECH_XOR2 C232 ( .A(inv_Xop), .B(alu_Xop[2]), .Z(Xop_in[2]) );
  GTECH_XOR2 C233 ( .A(inv_Xop), .B(alu_Xop[1]), .Z(Xop_in[1]) );
  GTECH_XOR2 C234 ( .A(inv_Xop), .B(alu_Xop[0]), .Z(Xop_in[0]) );
  GTECH_XOR2 C235 ( .A(inv_Yop), .B(alu_Yop[15]), .Z(Yop_in[15]) );
  GTECH_XOR2 C236 ( .A(inv_Yop), .B(alu_Yop[14]), .Z(Yop_in[14]) );
  GTECH_XOR2 C237 ( .A(inv_Yop), .B(alu_Yop[13]), .Z(Yop_in[13]) );
  GTECH_XOR2 C238 ( .A(inv_Yop), .B(alu_Yop[12]), .Z(Yop_in[12]) );
  GTECH_XOR2 C239 ( .A(inv_Yop), .B(alu_Yop[11]), .Z(Yop_in[11]) );
  GTECH_XOR2 C240 ( .A(inv_Yop), .B(alu_Yop[10]), .Z(Yop_in[10]) );
  GTECH_XOR2 C241 ( .A(inv_Yop), .B(alu_Yop[9]), .Z(Yop_in[9]) );
  GTECH_XOR2 C242 ( .A(inv_Yop), .B(alu_Yop[8]), .Z(Yop_in[8]) );
  GTECH_XOR2 C243 ( .A(inv_Yop), .B(alu_Yop[7]), .Z(Yop_in[7]) );
  GTECH_XOR2 C244 ( .A(inv_Yop), .B(alu_Yop[6]), .Z(Yop_in[6]) );
  GTECH_XOR2 C245 ( .A(inv_Yop), .B(alu_Yop[5]), .Z(Yop_in[5]) );
  GTECH_XOR2 C246 ( .A(inv_Yop), .B(alu_Yop[4]), .Z(Yop_in[4]) );
  GTECH_XOR2 C247 ( .A(inv_Yop), .B(alu_Yop[3]), .Z(Yop_in[3]) );
  GTECH_XOR2 C248 ( .A(inv_Yop), .B(alu_Yop[2]), .Z(Yop_in[2]) );
  GTECH_XOR2 C249 ( .A(inv_Yop), .B(alu_Yop[1]), .Z(Yop_in[1]) );
  GTECH_XOR2 C250 ( .A(inv_Yop), .B(alu_Yop[0]), .Z(Yop_in[0]) );
  GTECH_OR2 C251 ( .A(N58), .B(N62), .Z(overflow) );
  GTECH_AND2 C252 ( .A(N56), .B(N57), .Z(N58) );
  GTECH_AND2 C253 ( .A(Xop_in[15]), .B(Yop_in[15]), .Z(N56) );
  GTECH_NOT I_3 ( .A(adder_out[15]), .Z(N57) );
  GTECH_AND2 C255 ( .A(N61), .B(adder_out[15]), .Z(N62) );
  GTECH_AND2 C256 ( .A(N59), .B(N60), .Z(N61) );
  GTECH_NOT I_4 ( .A(Xop_in[15]), .Z(N59) );
  GTECH_NOT I_5 ( .A(Yop_in[15]), .Z(N60) );
  GTECH_AND2 C259 ( .A(Xop_in[15]), .B(Yop_in[15]), .Z(XandY[15]) );
  GTECH_AND2 C260 ( .A(Xop_in[14]), .B(Yop_in[14]), .Z(XandY[14]) );
  GTECH_AND2 C261 ( .A(Xop_in[13]), .B(Yop_in[13]), .Z(XandY[13]) );
  GTECH_AND2 C262 ( .A(Xop_in[12]), .B(Yop_in[12]), .Z(XandY[12]) );
  GTECH_AND2 C263 ( .A(Xop_in[11]), .B(Yop_in[11]), .Z(XandY[11]) );
  GTECH_AND2 C264 ( .A(Xop_in[10]), .B(Yop_in[10]), .Z(XandY[10]) );
  GTECH_AND2 C265 ( .A(Xop_in[9]), .B(Yop_in[9]), .Z(XandY[9]) );
  GTECH_AND2 C266 ( .A(Xop_in[8]), .B(Yop_in[8]), .Z(XandY[8]) );
  GTECH_AND2 C267 ( .A(Xop_in[7]), .B(Yop_in[7]), .Z(XandY[7]) );
  GTECH_AND2 C268 ( .A(Xop_in[6]), .B(Yop_in[6]), .Z(XandY[6]) );
  GTECH_AND2 C269 ( .A(Xop_in[5]), .B(Yop_in[5]), .Z(XandY[5]) );
  GTECH_AND2 C270 ( .A(Xop_in[4]), .B(Yop_in[4]), .Z(XandY[4]) );
  GTECH_AND2 C271 ( .A(Xop_in[3]), .B(Yop_in[3]), .Z(XandY[3]) );
  GTECH_AND2 C272 ( .A(Xop_in[2]), .B(Yop_in[2]), .Z(XandY[2]) );
  GTECH_AND2 C273 ( .A(Xop_in[1]), .B(Yop_in[1]), .Z(XandY[1]) );
  GTECH_AND2 C274 ( .A(Xop_in[0]), .B(Yop_in[0]), .Z(XandY[0]) );
  GTECH_OR2 C275 ( .A(Xop_in[15]), .B(Yop_in[15]), .Z(XorY[15]) );
  GTECH_OR2 C276 ( .A(Xop_in[14]), .B(Yop_in[14]), .Z(XorY[14]) );
  GTECH_OR2 C277 ( .A(Xop_in[13]), .B(Yop_in[13]), .Z(XorY[13]) );
  GTECH_OR2 C278 ( .A(Xop_in[12]), .B(Yop_in[12]), .Z(XorY[12]) );
  GTECH_OR2 C279 ( .A(Xop_in[11]), .B(Yop_in[11]), .Z(XorY[11]) );
  GTECH_OR2 C280 ( .A(Xop_in[10]), .B(Yop_in[10]), .Z(XorY[10]) );
  GTECH_OR2 C281 ( .A(Xop_in[9]), .B(Yop_in[9]), .Z(XorY[9]) );
  GTECH_OR2 C282 ( .A(Xop_in[8]), .B(Yop_in[8]), .Z(XorY[8]) );
  GTECH_OR2 C283 ( .A(Xop_in[7]), .B(Yop_in[7]), .Z(XorY[7]) );
  GTECH_OR2 C284 ( .A(Xop_in[6]), .B(Yop_in[6]), .Z(XorY[6]) );
  GTECH_OR2 C285 ( .A(Xop_in[5]), .B(Yop_in[5]), .Z(XorY[5]) );
  GTECH_OR2 C286 ( .A(Xop_in[4]), .B(Yop_in[4]), .Z(XorY[4]) );
  GTECH_OR2 C287 ( .A(Xop_in[3]), .B(Yop_in[3]), .Z(XorY[3]) );
  GTECH_OR2 C288 ( .A(Xop_in[2]), .B(Yop_in[2]), .Z(XorY[2]) );
  GTECH_OR2 C289 ( .A(Xop_in[1]), .B(Yop_in[1]), .Z(XorY[1]) );
  GTECH_OR2 C290 ( .A(Xop_in[0]), .B(Yop_in[0]), .Z(XorY[0]) );
  GTECH_XOR2 C291 ( .A(Xop_in[15]), .B(Yop_in[15]), .Z(XxorY[15]) );
  GTECH_XOR2 C292 ( .A(Xop_in[14]), .B(Yop_in[14]), .Z(XxorY[14]) );
  GTECH_XOR2 C293 ( .A(Xop_in[13]), .B(Yop_in[13]), .Z(XxorY[13]) );
  GTECH_XOR2 C294 ( .A(Xop_in[12]), .B(Yop_in[12]), .Z(XxorY[12]) );
  GTECH_XOR2 C295 ( .A(Xop_in[11]), .B(Yop_in[11]), .Z(XxorY[11]) );
  GTECH_XOR2 C296 ( .A(Xop_in[10]), .B(Yop_in[10]), .Z(XxorY[10]) );
  GTECH_XOR2 C297 ( .A(Xop_in[9]), .B(Yop_in[9]), .Z(XxorY[9]) );
  GTECH_XOR2 C298 ( .A(Xop_in[8]), .B(Yop_in[8]), .Z(XxorY[8]) );
  GTECH_XOR2 C299 ( .A(Xop_in[7]), .B(Yop_in[7]), .Z(XxorY[7]) );
  GTECH_XOR2 C300 ( .A(Xop_in[6]), .B(Yop_in[6]), .Z(XxorY[6]) );
  GTECH_XOR2 C301 ( .A(Xop_in[5]), .B(Yop_in[5]), .Z(XxorY[5]) );
  GTECH_XOR2 C302 ( .A(Xop_in[4]), .B(Yop_in[4]), .Z(XxorY[4]) );
  GTECH_XOR2 C303 ( .A(Xop_in[3]), .B(Yop_in[3]), .Z(XxorY[3]) );
  GTECH_XOR2 C304 ( .A(Xop_in[2]), .B(Yop_in[2]), .Z(XxorY[2]) );
  GTECH_XOR2 C305 ( .A(Xop_in[1]), .B(Yop_in[1]), .Z(XxorY[1]) );
  GTECH_XOR2 C306 ( .A(Xop_in[0]), .B(Yop_in[0]), .Z(XxorY[0]) );
  GTECH_NOT I_6 ( .A(IR14_13[1]), .Z(N25) );
  GTECH_NOT I_7 ( .A(IR14_13[0]), .Z(N26) );
  GTECH_NOT I_8 ( .A(N28), .Z(N29) );
  GTECH_NOT I_9 ( .A(is_logic_func), .Z(N30) );
  GTECH_NOT I_10 ( .A(ASTAT3_in), .Z(N31) );
  GTECH_BUF B_8 ( .A(ASTAT3_in), .Z(R_satu[15]) );
  GTECH_BUF B_9 ( .A(N31), .Z(R_satu[14]) );
  GTECH_AND2 C319 ( .A(N63), .B(N64), .Z(N32) );
  GTECH_AND2 C320 ( .A(MSTAT3), .B(ASTAT2_in), .Z(N63) );
  GTECH_NOT I_11 ( .A(is_div), .Z(N64) );
  GTECH_NOT I_12 ( .A(N32), .Z(N33) );
  GTECH_AND2 C324 ( .A(overflow), .B(N30), .Z(ASTAT2_in) );
  GTECH_AND2 C326 ( .A(cout), .B(N30), .Z(ASTAT3_in) );
  GTECH_XOR2 C328 ( .A(alu_Xop[14]), .B(alu_Yop[14]), .Z(N34) );
  GTECH_XOR2 C329 ( .A(alu_Xop[14]), .B(alu_R[14]), .Z(N35) );
  GTECH_NOT I_13 ( .A(DIVS), .Z(N36) );
  GTECH_NOT I_14 ( .A(ASTAT5_in), .Z(N37) );
endmodule


module aluctrl ( cond_fit, ASTAT5, ASTAT3, ASTAT4_in, MSTAT0, IR, load_AX1_1st, 
        load_AX0_1st, load_AX1_2nd, load_AX0_2nd, sel_Xop, load_AY1_1st, 
        load_AY1_2nd, en_AY0_1st, en_AY0_2nd, sel_Yop, PMD2AY, en_AF_1st, 
        en_AF_2nd, DIVS, CI_in, is_div, is_logic_func, inv_Xop, inv_Yop, 
        load_AR, en_AR_1st, en_AR_2nd, ARtoR, AR2DMD, sel_AX0, AXx2DMD, 
        sel_AY0, AYx2DMD, update_AS, update_ASTAT0_3 );
  input [23:0] IR;
  output [1:0] sel_Xop;
  output [1:0] sel_Yop;
  input cond_fit, ASTAT5, ASTAT3, ASTAT4_in, MSTAT0;
  output load_AX1_1st, load_AX0_1st, load_AX1_2nd, load_AX0_2nd, load_AY1_1st,
         load_AY1_2nd, en_AY0_1st, en_AY0_2nd, PMD2AY, en_AF_1st, en_AF_2nd,
         DIVS, CI_in, is_div, is_logic_func, inv_Xop, inv_Yop, load_AR,
         en_AR_1st, en_AR_2nd, ARtoR, AR2DMD, sel_AX0, AXx2DMD, sel_AY0,
         AYx2DMD, update_AS, update_ASTAT0_3;
  wire   load_AX1, load_AX0, load_AY1, load_AY0, zero_Yop, is_constant_op,
         en_AF, update_AR, en_AR, N0, N1, N3, N4, N5, N7, N8, N9, N10, N11,
         N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25,
         N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39,
         N40, N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53,
         N54, N55, N56, N57, N58, N59, N60, N61, N62, N63, N64, N65, N66, N67,
         N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81,
         N82, N83, N84, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95,
         N96, N97, N98, N99, N100, N101, N102, N103, N104, N105, N106, N107,
         N108, N109, N110, N111, N112, N113, N114, N115, N116, N117, N118,
         N119, N120, N121, N122, N123, N124, N125, N126, N127, N128, N129,
         N130, N131, N133, N134, N135, N136, N137, N138, N139, N140, N141,
         N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N196,
         N197, N198, N199, N200, N201, N202, N203, N204, N205, N206, N207,
         N208, N209, N210, N211, N212, N213, N214, N215, N216, N217, N218,
         N219, N220, N221, N222, N223, N224, N225, N226, N227, N228, N229,
         N230, N231, N232, N233, N234, N235, N236, N237, N238, N239, N240,
         N241, N242, N243, N244, N245, N246, N247, N248, N249, N250, N251,
         N252, N253, N254, N255, N256, N257, N258, N259, N260, N261, N262,
         N263, N264, N265, N266, N267, N268, N269, N270, N271, N272, N273,
         N274, N275, N276, N277, N278, N279, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, N291, N292, N293, N294, N295,
         N296, N297, N298, N299, N300, N301, N302, N303, N304, N305, N306,
         N307, N308, N309, N310, N311, N312, N313, N314, N315, N316, N317,
         N318, N319, N320, N321, N322, N323, N324, N325, N326, N327, N328,
         N329, N330, N331, N332, N333, N334, N335, N336, N337, N338, N339,
         N340, N341, N342, N343, N344, N345, N346, N347, N348, N349, N350,
         N351, N352, N353, N354, N355, N356, N357, N358, N359, N360, N361,
         N362, N363, N364, N365, N366, N367, N368, N369, N370, N371, N372,
         N373, N374, N375, N376, N377, N378, N379, N380, N381, N382, N383,
         N384, N385, N386, N387, N388, N389, N390, N391, N392, N393, N394,
         N395, N396, N397, N398, N399, N400, N401, N402, N403, N404, N405,
         N406, N407;

  GTECH_NOT I_0 ( .A(IR[15]), .Z(N0) );
  GTECH_OR2 C44 ( .A(N0), .B(IR[16]), .Z(N1) );
  GTECH_NOT I_1 ( .A(N1), .Z(inv_Yop) );
  GTECH_NOT I_2 ( .A(IR[9]), .Z(N3) );
  GTECH_OR2 C47 ( .A(N3), .B(IR[10]), .Z(N4) );
  GTECH_OR2 C48 ( .A(IR[8]), .B(N4), .Z(N5) );
  GTECH_NOT I_3 ( .A(N5), .Z(ARtoR) );
  GTECH_OR2 C50 ( .A(IR[15]), .B(IR[16]), .Z(N7) );
  GTECH_OR2 C51 ( .A(IR[14]), .B(N7), .Z(N8) );
  GTECH_OR2 C52 ( .A(IR[13]), .B(N8), .Z(N9) );
  GTECH_NOT I_4 ( .A(N9), .Z(N10) );
  GTECH_NOT I_5 ( .A(IR[16]), .Z(N11) );
  GTECH_NOT I_6 ( .A(IR[13]), .Z(N12) );
  GTECH_OR2 C56 ( .A(IR[15]), .B(N11), .Z(N13) );
  GTECH_OR2 C57 ( .A(IR[14]), .B(N13), .Z(N14) );
  GTECH_OR2 C58 ( .A(N12), .B(N14), .Z(N15) );
  GTECH_NOT I_7 ( .A(N15), .Z(N16) );
  GTECH_OR2 C62 ( .A(IR[14]), .B(N1), .Z(N17) );
  GTECH_OR2 C63 ( .A(IR[13]), .B(N17), .Z(N18) );
  GTECH_NOT I_8 ( .A(N18), .Z(N19) );
  GTECH_NOT I_9 ( .A(IR[14]), .Z(N20) );
  GTECH_OR2 C69 ( .A(N20), .B(N1), .Z(N21) );
  GTECH_OR2 C70 ( .A(N12), .B(N21), .Z(N22) );
  GTECH_NOT I_10 ( .A(N22), .Z(N23) );
  GTECH_OR2 C75 ( .A(IR[13]), .B(N14), .Z(N24) );
  GTECH_NOT I_11 ( .A(N24), .Z(N25) );
  GTECH_NOT I_12 ( .A(IR[12]), .Z(N26) );
  GTECH_OR2 C78 ( .A(IR[11]), .B(N26), .Z(N27) );
  GTECH_NOT I_13 ( .A(N27), .Z(N28) );
  GTECH_OR2 C83 ( .A(N12), .B(N8), .Z(N29) );
  GTECH_NOT I_14 ( .A(N29), .Z(N30) );
  GTECH_OR2 C87 ( .A(N20), .B(N7), .Z(N31) );
  GTECH_OR2 C88 ( .A(IR[13]), .B(N31), .Z(N32) );
  GTECH_NOT I_15 ( .A(N32), .Z(N33) );
  GTECH_OR2 C94 ( .A(N12), .B(N17), .Z(N34) );
  GTECH_NOT I_16 ( .A(N34), .Z(N35) );
  GTECH_OR2 C100 ( .A(IR[13]), .B(N21), .Z(N36) );
  GTECH_NOT I_17 ( .A(N36), .Z(N37) );
  GTECH_OR2 C118 ( .A(N20), .B(N13), .Z(N38) );
  GTECH_OR2 C119 ( .A(IR[13]), .B(N38), .Z(N39) );
  GTECH_NOT I_18 ( .A(N39), .Z(N40) );
  GTECH_AND2 C121 ( .A(IR[15]), .B(IR[16]), .Z(N41) );
  GTECH_AND2 C122 ( .A(IR[14]), .B(N41), .Z(N42) );
  GTECH_AND2 C123 ( .A(IR[13]), .B(N42), .Z(N43) );
  GTECH_OR2 C126 ( .A(N0), .B(N11), .Z(N44) );
  GTECH_OR2 C127 ( .A(IR[14]), .B(N44), .Z(N45) );
  GTECH_OR2 C128 ( .A(IR[13]), .B(N45), .Z(N46) );
  GTECH_NOT I_19 ( .A(N46), .Z(N47) );
  GTECH_OR2 C135 ( .A(N12), .B(N45), .Z(N48) );
  GTECH_NOT I_20 ( .A(N48), .Z(N49) );
  GTECH_OR2 C141 ( .A(N20), .B(N44), .Z(N50) );
  GTECH_OR2 C142 ( .A(IR[13]), .B(N50), .Z(N51) );
  GTECH_NOT I_21 ( .A(N51), .Z(N52) );
  GTECH_OR2 C166 ( .A(N12), .B(N38), .Z(N53) );
  GTECH_NOT I_22 ( .A(N53), .Z(N54) );
  GTECH_NOT I_23 ( .A(IR[20]), .Z(N55) );
  GTECH_OR2 C172 ( .A(IR[19]), .B(N55), .Z(N56) );
  GTECH_OR2 C173 ( .A(IR[18]), .B(N56), .Z(N57) );
  GTECH_NOT I_24 ( .A(N57), .Z(N58) );
  GTECH_NOT I_25 ( .A(IR[3]), .Z(N59) );
  GTECH_NOT I_26 ( .A(IR[1]), .Z(N60) );
  GTECH_OR2 C177 ( .A(IR[2]), .B(N59), .Z(N61) );
  GTECH_OR2 C178 ( .A(N60), .B(N61), .Z(N62) );
  GTECH_OR2 C179 ( .A(IR[0]), .B(N62), .Z(N63) );
  GTECH_NOT I_27 ( .A(N63), .Z(N64) );
  GTECH_OR2 C193 ( .A(IR[8]), .B(IR[9]), .Z(N65) );
  GTECH_NOT I_28 ( .A(N65), .Z(N66) );
  GTECH_NOT I_29 ( .A(IR[7]), .Z(N67) );
  GTECH_NOT I_30 ( .A(IR[5]), .Z(N68) );
  GTECH_OR2 C203 ( .A(IR[6]), .B(N67), .Z(N69) );
  GTECH_OR2 C204 ( .A(N68), .B(N69), .Z(N70) );
  GTECH_OR2 C205 ( .A(IR[4]), .B(N70), .Z(N71) );
  GTECH_NOT I_31 ( .A(N71), .Z(N72) );
  GTECH_OR2 C219 ( .A(IR[0]), .B(N78), .Z(N73) );
  GTECH_NOT I_32 ( .A(N73), .Z(N74) );
  GTECH_OR2 C237 ( .A(IR[4]), .B(N81), .Z(N75) );
  GTECH_NOT I_33 ( .A(N75), .Z(N76) );
  GTECH_OR2 C247 ( .A(IR[2]), .B(IR[3]), .Z(N77) );
  GTECH_OR2 C248 ( .A(IR[1]), .B(N77), .Z(N78) );
  GTECH_NOT I_34 ( .A(N78), .Z(N79) );
  GTECH_OR2 C261 ( .A(IR[6]), .B(IR[7]), .Z(N80) );
  GTECH_OR2 C262 ( .A(IR[5]), .B(N80), .Z(N81) );
  GTECH_NOT I_35 ( .A(N81), .Z(N82) );
  GTECH_OR2 C274 ( .A(IR[0]), .B(N94), .Z(N83) );
  GTECH_NOT I_36 ( .A(N83), .Z(N84) );
  GTECH_AND2 C286 ( .A(IR[8]), .B(IR[9]), .Z(N85) );
  GTECH_OR2 C295 ( .A(IR[4]), .B(N98), .Z(N86) );
  GTECH_NOT I_37 ( .A(N86), .Z(N87) );
  GTECH_NOT I_38 ( .A(IR[4]), .Z(N88) );
  GTECH_OR2 C301 ( .A(N68), .B(N97), .Z(N89) );
  GTECH_OR2 C302 ( .A(N88), .B(N89), .Z(N90) );
  GTECH_NOT I_39 ( .A(N90), .Z(N91) );
  GTECH_NOT I_40 ( .A(IR[2]), .Z(N92) );
  GTECH_OR2 C309 ( .A(N92), .B(IR[3]), .Z(N93) );
  GTECH_OR2 C310 ( .A(IR[1]), .B(N93), .Z(N94) );
  GTECH_NOT I_41 ( .A(N94), .Z(N95) );
  GTECH_NOT I_42 ( .A(IR[6]), .Z(N96) );
  GTECH_OR2 C327 ( .A(N96), .B(IR[7]), .Z(N97) );
  GTECH_OR2 C328 ( .A(IR[5]), .B(N97), .Z(N98) );
  GTECH_NOT I_43 ( .A(N98), .Z(N99) );
  GTECH_NOT I_44 ( .A(IR[18]), .Z(N100) );
  GTECH_OR2 C338 ( .A(N100), .B(IR[19]), .Z(N101) );
  GTECH_NOT I_45 ( .A(N101), .Z(N102) );
  GTECH_NOT I_46 ( .A(IR[0]), .Z(N103) );
  GTECH_OR2 C343 ( .A(N103), .B(N78), .Z(N104) );
  GTECH_NOT I_47 ( .A(N104), .Z(N105) );
  GTECH_OR2 C345 ( .A(IR[19]), .B(IR[20]), .Z(N106) );
  GTECH_OR2 C346 ( .A(IR[18]), .B(N106), .Z(N107) );
  GTECH_NOT I_48 ( .A(N107), .Z(N108) );
  GTECH_OR2 C356 ( .A(N88), .B(N81), .Z(N109) );
  GTECH_NOT I_49 ( .A(N109), .Z(N110) );
  GTECH_OR2 C368 ( .A(IR[10]), .B(IR[11]), .Z(N111) );
  GTECH_NOT I_50 ( .A(N111), .Z(N112) );
  GTECH_OR2 C375 ( .A(IR[18]), .B(IR[19]), .Z(N113) );
  GTECH_NOT I_51 ( .A(N113), .Z(N114) );
  GTECH_OR2 C410 ( .A(N103), .B(N94), .Z(N115) );
  GTECH_NOT I_52 ( .A(N115), .Z(N116) );
  GTECH_OR2 C425 ( .A(N88), .B(N98), .Z(N117) );
  GTECH_NOT I_53 ( .A(N117), .Z(N118) );
  GTECH_AND2 C498 ( .A(IR[11]), .B(IR[12]), .Z(N119) );
  GTECH_OR2 C514 ( .A(IR[13]), .B(N130), .Z(N120) );
  GTECH_OR2 C515 ( .A(N26), .B(N120), .Z(N121) );
  GTECH_OR2 C516 ( .A(IR[11]), .B(N121), .Z(N122) );
  GTECH_NOT I_54 ( .A(N122), .Z(N123) );
  GTECH_OR2 C526 ( .A(IR[20]), .B(N160), .Z(N124) );
  GTECH_OR2 C527 ( .A(IR[19]), .B(N124), .Z(N125) );
  GTECH_OR2 C528 ( .A(N100), .B(N125), .Z(N126) );
  GTECH_OR2 C529 ( .A(N159), .B(N126), .Z(N127) );
  GTECH_OR2 C530 ( .A(N11), .B(N127), .Z(N128) );
  GTECH_OR2 C531 ( .A(N0), .B(N128), .Z(N129) );
  GTECH_OR2 C532 ( .A(N20), .B(N129), .Z(N130) );
  GTECH_OR2 C533 ( .A(N12), .B(N130), .Z(N131) );
  GTECH_NOT I_55 ( .A(N131), .Z(DIVS) );
  GTECH_AND2 C535 ( .A(IR[22]), .B(IR[23]), .Z(N133) );
  GTECH_OR2 C537 ( .A(IR[22]), .B(IR[23]), .Z(N134) );
  GTECH_OR2 C538 ( .A(N147), .B(N134), .Z(N135) );
  GTECH_OR2 C539 ( .A(IR[20]), .B(N135), .Z(N136) );
  GTECH_OR2 C540 ( .A(IR[19]), .B(N136), .Z(N137) );
  GTECH_NOT I_56 ( .A(N137), .Z(N138) );
  GTECH_NOT I_57 ( .A(IR[23]), .Z(N139) );
  GTECH_OR2 C543 ( .A(IR[22]), .B(N139), .Z(N140) );
  GTECH_OR2 C544 ( .A(IR[21]), .B(N140), .Z(N141) );
  GTECH_NOT I_58 ( .A(N141), .Z(N142) );
  GTECH_OR2 C551 ( .A(IR[21]), .B(N148), .Z(N143) );
  GTECH_OR2 C552 ( .A(IR[20]), .B(N143), .Z(N144) );
  GTECH_NOT I_59 ( .A(N144), .Z(N145) );
  GTECH_NOT I_60 ( .A(IR[22]), .Z(N146) );
  GTECH_NOT I_61 ( .A(IR[21]), .Z(N147) );
  GTECH_OR2 C562 ( .A(N146), .B(IR[23]), .Z(N148) );
  GTECH_OR2 C563 ( .A(N147), .B(N148), .Z(N149) );
  GTECH_NOT I_62 ( .A(N149), .Z(N150) );
  GTECH_OR2 C569 ( .A(N55), .B(N143), .Z(N151) );
  GTECH_NOT I_63 ( .A(N151), .Z(N152) );
  GTECH_NOT I_64 ( .A(IR[19]), .Z(N153) );
  GTECH_OR2 C582 ( .A(N153), .B(N136), .Z(N154) );
  GTECH_NOT I_65 ( .A(N154), .Z(N155) );
  GTECH_OR2 C591 ( .A(IR[16]), .B(N166), .Z(N156) );
  GTECH_OR2 C592 ( .A(IR[15]), .B(N156), .Z(N157) );
  GTECH_NOT I_66 ( .A(N157), .Z(N158) );
  GTECH_NOT I_67 ( .A(IR[17]), .Z(N159) );
  GTECH_OR2 C609 ( .A(IR[21]), .B(N134), .Z(N160) );
  GTECH_OR2 C610 ( .A(N55), .B(N160), .Z(N161) );
  GTECH_OR2 C611 ( .A(IR[19]), .B(N161), .Z(N162) );
  GTECH_OR2 C612 ( .A(IR[18]), .B(N162), .Z(N163) );
  GTECH_OR2 C613 ( .A(N159), .B(N163), .Z(N164) );
  GTECH_NOT I_68 ( .A(N164), .Z(N165) );
  GTECH_OR2 C622 ( .A(IR[17]), .B(N163), .Z(N166) );
  GTECH_OR2 C623 ( .A(N11), .B(N166), .Z(N167) );
  GTECH_NOT I_69 ( .A(N167), .Z(N168) );
  GTECH_OR2 C641 ( .A(N153), .B(N124), .Z(N169) );
  GTECH_OR2 C642 ( .A(N100), .B(N169), .Z(N170) );
  GTECH_OR2 C643 ( .A(IR[17]), .B(N170), .Z(N171) );
  GTECH_OR2 C644 ( .A(N11), .B(N171), .Z(N172) );
  GTECH_OR2 C645 ( .A(N0), .B(N172), .Z(N173) );
  GTECH_OR2 C646 ( .A(N20), .B(N173), .Z(N174) );
  GTECH_OR2 C647 ( .A(N12), .B(N174), .Z(N175) );
  GTECH_OR2 C648 ( .A(N26), .B(N175), .Z(N176) );
  GTECH_NOT I_70 ( .A(N176), .Z(N177) );
  GTECH_OR2 C659 ( .A(N194), .B(N196), .Z(load_AX1) );
  GTECH_OR2 C660 ( .A(N190), .B(N193), .Z(N194) );
  GTECH_OR2 C661 ( .A(N187), .B(N189), .Z(N190) );
  GTECH_OR2 C662 ( .A(N183), .B(N186), .Z(N187) );
  GTECH_OR2 C663 ( .A(N179), .B(N182), .Z(N183) );
  GTECH_OR2 C664 ( .A(N178), .B(N105), .Z(N179) );
  GTECH_AND2 C665 ( .A(N133), .B(N102), .Z(N178) );
  GTECH_AND2 C666 ( .A(N181), .B(N105), .Z(N182) );
  GTECH_OR2 C667 ( .A(N180), .B(N145), .Z(N181) );
  GTECH_AND2 C668 ( .A(N142), .B(N108), .Z(N180) );
  GTECH_AND2 C669 ( .A(N185), .B(N110), .Z(N186) );
  GTECH_AND2 C670 ( .A(N184), .B(N153), .Z(N185) );
  GTECH_OR2 C671 ( .A(N150), .B(N152), .Z(N184) );
  GTECH_AND2 C673 ( .A(N188), .B(N110), .Z(N189) );
  GTECH_OR2 C674 ( .A(N155), .B(N158), .Z(N188) );
  GTECH_AND2 C675 ( .A(N192), .B(N110), .Z(N193) );
  GTECH_AND2 C676 ( .A(N191), .B(N0), .Z(N192) );
  GTECH_OR2 C677 ( .A(N165), .B(N168), .Z(N191) );
  GTECH_AND2 C679 ( .A(N195), .B(N110), .Z(N196) );
  GTECH_AND2 C680 ( .A(N177), .B(N112), .Z(N195) );
  GTECH_AND2 C681 ( .A(N197), .B(load_AX1), .Z(load_AX1_1st) );
  GTECH_NOT I_71 ( .A(MSTAT0), .Z(N197) );
  GTECH_AND2 C683 ( .A(MSTAT0), .B(load_AX1), .Z(load_AX1_2nd) );
  GTECH_OR2 C684 ( .A(N214), .B(N216), .Z(load_AX0) );
  GTECH_OR2 C685 ( .A(N210), .B(N213), .Z(N214) );
  GTECH_OR2 C686 ( .A(N207), .B(N209), .Z(N210) );
  GTECH_OR2 C687 ( .A(N203), .B(N206), .Z(N207) );
  GTECH_OR2 C688 ( .A(N199), .B(N202), .Z(N203) );
  GTECH_OR2 C689 ( .A(N198), .B(N74), .Z(N199) );
  GTECH_AND2 C690 ( .A(N133), .B(N114), .Z(N198) );
  GTECH_AND2 C691 ( .A(N201), .B(N74), .Z(N202) );
  GTECH_OR2 C692 ( .A(N200), .B(N145), .Z(N201) );
  GTECH_AND2 C693 ( .A(N142), .B(N108), .Z(N200) );
  GTECH_AND2 C694 ( .A(N205), .B(N76), .Z(N206) );
  GTECH_AND2 C695 ( .A(N204), .B(N153), .Z(N205) );
  GTECH_OR2 C696 ( .A(N150), .B(N152), .Z(N204) );
  GTECH_AND2 C698 ( .A(N208), .B(N76), .Z(N209) );
  GTECH_OR2 C699 ( .A(N155), .B(N158), .Z(N208) );
  GTECH_AND2 C700 ( .A(N212), .B(N76), .Z(N213) );
  GTECH_AND2 C701 ( .A(N211), .B(N0), .Z(N212) );
  GTECH_OR2 C702 ( .A(N165), .B(N168), .Z(N211) );
  GTECH_AND2 C704 ( .A(N215), .B(N76), .Z(N216) );
  GTECH_AND2 C705 ( .A(N177), .B(N112), .Z(N215) );
  GTECH_AND2 C706 ( .A(N197), .B(load_AX0), .Z(load_AX0_1st) );
  GTECH_AND2 C708 ( .A(MSTAT0), .B(load_AX0), .Z(load_AX0_2nd) );
  GTECH_OR2 C709 ( .A(N219), .B(N220), .Z(sel_Xop[1]) );
  GTECH_OR2 C710 ( .A(N218), .B(N23), .Z(N219) );
  GTECH_OR2 C711 ( .A(N217), .B(N19), .Z(N218) );
  GTECH_OR2 C712 ( .A(N10), .B(N16), .Z(N217) );
  GTECH_AND2 C713 ( .A(N25), .B(N122), .Z(N220) );
  GTECH_OR2 C715 ( .A(IR[10]), .B(IR[9]), .Z(sel_Xop[0]) );
  GTECH_AND2 C716 ( .A(N133), .B(N147), .Z(PMD2AY) );
  GTECH_OR2 C718 ( .A(N237), .B(N239), .Z(load_AY1) );
  GTECH_OR2 C719 ( .A(N233), .B(N236), .Z(N237) );
  GTECH_OR2 C720 ( .A(N230), .B(N232), .Z(N233) );
  GTECH_OR2 C721 ( .A(N226), .B(N229), .Z(N230) );
  GTECH_OR2 C722 ( .A(N222), .B(N225), .Z(N226) );
  GTECH_OR2 C723 ( .A(N221), .B(N116), .Z(N222) );
  GTECH_AND2 C724 ( .A(PMD2AY), .B(IR[20]), .Z(N221) );
  GTECH_AND2 C725 ( .A(N224), .B(N116), .Z(N225) );
  GTECH_OR2 C726 ( .A(N223), .B(N145), .Z(N224) );
  GTECH_AND2 C727 ( .A(N142), .B(N108), .Z(N223) );
  GTECH_AND2 C728 ( .A(N228), .B(N118), .Z(N229) );
  GTECH_AND2 C729 ( .A(N227), .B(N153), .Z(N228) );
  GTECH_OR2 C730 ( .A(N150), .B(N152), .Z(N227) );
  GTECH_AND2 C732 ( .A(N231), .B(N118), .Z(N232) );
  GTECH_OR2 C733 ( .A(N155), .B(N158), .Z(N231) );
  GTECH_AND2 C734 ( .A(N235), .B(N118), .Z(N236) );
  GTECH_AND2 C735 ( .A(N234), .B(N0), .Z(N235) );
  GTECH_OR2 C736 ( .A(N165), .B(N168), .Z(N234) );
  GTECH_AND2 C738 ( .A(N238), .B(N118), .Z(N239) );
  GTECH_AND2 C739 ( .A(N177), .B(N112), .Z(N238) );
  GTECH_AND2 C740 ( .A(N197), .B(load_AY1), .Z(load_AY1_1st) );
  GTECH_AND2 C742 ( .A(MSTAT0), .B(load_AY1), .Z(load_AY1_2nd) );
  GTECH_OR2 C743 ( .A(N256), .B(N258), .Z(load_AY0) );
  GTECH_OR2 C744 ( .A(N252), .B(N255), .Z(N256) );
  GTECH_OR2 C745 ( .A(N249), .B(N251), .Z(N252) );
  GTECH_OR2 C746 ( .A(N245), .B(N248), .Z(N249) );
  GTECH_OR2 C747 ( .A(N241), .B(N244), .Z(N245) );
  GTECH_OR2 C748 ( .A(N240), .B(N84), .Z(N241) );
  GTECH_AND2 C749 ( .A(PMD2AY), .B(N55), .Z(N240) );
  GTECH_AND2 C751 ( .A(N243), .B(N84), .Z(N244) );
  GTECH_OR2 C752 ( .A(N242), .B(N145), .Z(N243) );
  GTECH_AND2 C753 ( .A(N142), .B(N108), .Z(N242) );
  GTECH_AND2 C754 ( .A(N247), .B(N91), .Z(N248) );
  GTECH_AND2 C755 ( .A(N246), .B(N153), .Z(N247) );
  GTECH_OR2 C756 ( .A(N150), .B(N152), .Z(N246) );
  GTECH_AND2 C758 ( .A(N250), .B(N87), .Z(N251) );
  GTECH_OR2 C759 ( .A(N155), .B(N158), .Z(N250) );
  GTECH_AND2 C760 ( .A(N254), .B(N87), .Z(N255) );
  GTECH_AND2 C761 ( .A(N253), .B(N0), .Z(N254) );
  GTECH_OR2 C762 ( .A(N165), .B(N168), .Z(N253) );
  GTECH_AND2 C764 ( .A(N257), .B(N118), .Z(N258) );
  GTECH_AND2 C765 ( .A(N177), .B(N112), .Z(N257) );
  GTECH_AND2 C766 ( .A(N197), .B(N259), .Z(en_AY0_1st) );
  GTECH_OR2 C768 ( .A(load_AY0), .B(is_div), .Z(N259) );
  GTECH_AND2 C769 ( .A(MSTAT0), .B(N260), .Z(en_AY0_2nd) );
  GTECH_OR2 C770 ( .A(load_AY0), .B(is_div), .Z(N260) );
  GTECH_OR2 C771 ( .A(N261), .B(N119), .Z(zero_Yop) );
  GTECH_OR2 C772 ( .A(N54), .B(N35), .Z(N261) );
  GTECH_AND2 C773 ( .A(N262), .B(IR[4]), .Z(is_constant_op) );
  GTECH_AND2 C774 ( .A(N138), .B(IR[17]), .Z(N262) );
  GTECH_OR2 C775 ( .A(zero_Yop), .B(is_constant_op), .Z(sel_Yop[1]) );
  GTECH_AND2 C776 ( .A(N263), .B(N264), .Z(sel_Yop[0]) );
  GTECH_NOT I_72 ( .A(is_constant_op), .Z(N263) );
  GTECH_OR2 C778 ( .A(zero_Yop), .B(N28), .Z(N264) );
  GTECH_AND2 C779 ( .A(N269), .B(IR[18]), .Z(en_AF) );
  GTECH_AND2 C780 ( .A(N268), .B(IR[17]), .Z(N269) );
  GTECH_OR2 C781 ( .A(N266), .B(N267), .Z(N268) );
  GTECH_OR2 C782 ( .A(N265), .B(N155), .Z(N266) );
  GTECH_OR2 C783 ( .A(N150), .B(N152), .Z(N265) );
  GTECH_AND2 C784 ( .A(N138), .B(cond_fit), .Z(N267) );
  GTECH_AND2 C785 ( .A(N197), .B(N270), .Z(en_AF_1st) );
  GTECH_OR2 C787 ( .A(en_AF), .B(is_div), .Z(N270) );
  GTECH_AND2 C788 ( .A(MSTAT0), .B(N271), .Z(en_AF_2nd) );
  GTECH_OR2 C789 ( .A(en_AF), .B(is_div), .Z(N271) );
  GTECH_OR2 C790 ( .A(N282), .B(N284), .Z(CI_in) );
  GTECH_OR2 C791 ( .A(N280), .B(N281), .Z(N282) );
  GTECH_OR2 C792 ( .A(N278), .B(N279), .Z(N280) );
  GTECH_OR2 C793 ( .A(N277), .B(N16), .Z(N278) );
  GTECH_OR2 C794 ( .A(N276), .B(N23), .Z(N277) );
  GTECH_OR2 C795 ( .A(N274), .B(N275), .Z(N276) );
  GTECH_OR2 C796 ( .A(N273), .B(N35), .Z(N274) );
  GTECH_OR2 C797 ( .A(N30), .B(N272), .Z(N273) );
  GTECH_AND2 C798 ( .A(N33), .B(ASTAT3), .Z(N272) );
  GTECH_AND2 C799 ( .A(N37), .B(ASTAT3), .Z(N275) );
  GTECH_AND2 C800 ( .A(N40), .B(ASTAT3), .Z(N279) );
  GTECH_AND2 C801 ( .A(N43), .B(ASTAT4_in), .Z(N281) );
  GTECH_AND2 C802 ( .A(N123), .B(N283), .Z(N284) );
  GTECH_NOT I_73 ( .A(ASTAT5), .Z(N283) );
  GTECH_OR2 C804 ( .A(N123), .B(DIVS), .Z(is_div) );
  GTECH_OR2 C805 ( .A(N285), .B(N52), .Z(is_logic_func) );
  GTECH_OR2 C806 ( .A(N47), .B(N49), .Z(N285) );
  GTECH_OR2 C807 ( .A(N291), .B(N292), .Z(inv_Xop) );
  GTECH_OR2 C808 ( .A(N289), .B(N290), .Z(N291) );
  GTECH_OR2 C809 ( .A(N288), .B(N54), .Z(N289) );
  GTECH_OR2 C810 ( .A(N287), .B(N40), .Z(N288) );
  GTECH_OR2 C811 ( .A(N286), .B(N16), .Z(N287) );
  GTECH_AND2 C812 ( .A(N25), .B(N122), .Z(N286) );
  GTECH_AND2 C814 ( .A(N43), .B(ASTAT4_in), .Z(N290) );
  GTECH_AND2 C815 ( .A(N123), .B(N283), .Z(N292) );
  GTECH_OR2 C817 ( .A(N307), .B(N309), .Z(load_AR) );
  GTECH_OR2 C818 ( .A(N303), .B(N306), .Z(N307) );
  GTECH_OR2 C819 ( .A(N302), .B(N64), .Z(N303) );
  GTECH_OR2 C820 ( .A(N299), .B(N301), .Z(N302) );
  GTECH_OR2 C821 ( .A(N295), .B(N298), .Z(N299) );
  GTECH_AND2 C822 ( .A(N294), .B(N64), .Z(N295) );
  GTECH_OR2 C823 ( .A(N293), .B(N145), .Z(N294) );
  GTECH_AND2 C824 ( .A(N142), .B(N108), .Z(N293) );
  GTECH_AND2 C825 ( .A(N297), .B(N72), .Z(N298) );
  GTECH_AND2 C826 ( .A(N296), .B(N153), .Z(N297) );
  GTECH_OR2 C827 ( .A(N150), .B(N152), .Z(N296) );
  GTECH_AND2 C829 ( .A(N300), .B(N72), .Z(N301) );
  GTECH_OR2 C830 ( .A(N155), .B(N158), .Z(N300) );
  GTECH_AND2 C831 ( .A(N305), .B(N72), .Z(N306) );
  GTECH_AND2 C832 ( .A(N304), .B(N0), .Z(N305) );
  GTECH_OR2 C833 ( .A(N165), .B(N168), .Z(N304) );
  GTECH_AND2 C835 ( .A(N308), .B(N72), .Z(N309) );
  GTECH_AND2 C836 ( .A(N177), .B(N112), .Z(N308) );
  GTECH_OR2 C837 ( .A(N310), .B(N316), .Z(update_AR) );
  GTECH_AND2 C838 ( .A(N133), .B(IR[17]), .Z(N310) );
  GTECH_AND2 C839 ( .A(N315), .B(N100), .Z(N316) );
  GTECH_AND2 C840 ( .A(N314), .B(IR[17]), .Z(N315) );
  GTECH_OR2 C841 ( .A(N312), .B(N313), .Z(N314) );
  GTECH_OR2 C842 ( .A(N311), .B(N155), .Z(N312) );
  GTECH_OR2 C843 ( .A(N150), .B(N152), .Z(N311) );
  GTECH_AND2 C844 ( .A(N138), .B(cond_fit), .Z(N313) );
  GTECH_OR2 C846 ( .A(update_AR), .B(load_AR), .Z(en_AR) );
  GTECH_AND2 C847 ( .A(N197), .B(en_AR), .Z(en_AR_1st) );
  GTECH_AND2 C849 ( .A(MSTAT0), .B(en_AR), .Z(en_AR_2nd) );
  GTECH_OR2 C850 ( .A(N329), .B(N332), .Z(AR2DMD) );
  GTECH_OR2 C851 ( .A(N325), .B(N328), .Z(N329) );
  GTECH_OR2 C852 ( .A(N322), .B(N324), .Z(N325) );
  GTECH_OR2 C853 ( .A(N321), .B(N64), .Z(N322) );
  GTECH_OR2 C854 ( .A(N318), .B(N320), .Z(N321) );
  GTECH_AND2 C855 ( .A(N317), .B(N64), .Z(N318) );
  GTECH_AND2 C856 ( .A(N142), .B(N58), .Z(N317) );
  GTECH_AND2 C857 ( .A(N319), .B(N64), .Z(N320) );
  GTECH_OR2 C858 ( .A(N155), .B(N158), .Z(N319) );
  GTECH_AND2 C859 ( .A(N323), .B(N64), .Z(N324) );
  GTECH_AND2 C860 ( .A(N177), .B(N66), .Z(N323) );
  GTECH_AND2 C861 ( .A(N327), .B(N72), .Z(N328) );
  GTECH_AND2 C862 ( .A(N326), .B(IR[19]), .Z(N327) );
  GTECH_OR2 C863 ( .A(N150), .B(N152), .Z(N326) );
  GTECH_AND2 C864 ( .A(N331), .B(N72), .Z(N332) );
  GTECH_AND2 C865 ( .A(N330), .B(IR[15]), .Z(N331) );
  GTECH_OR2 C866 ( .A(N165), .B(N168), .Z(N330) );
  GTECH_OR2 C867 ( .A(N345), .B(N348), .Z(sel_AX0) );
  GTECH_OR2 C868 ( .A(N341), .B(N344), .Z(N345) );
  GTECH_OR2 C869 ( .A(N338), .B(N340), .Z(N341) );
  GTECH_OR2 C870 ( .A(N337), .B(N74), .Z(N338) );
  GTECH_OR2 C871 ( .A(N334), .B(N336), .Z(N337) );
  GTECH_AND2 C872 ( .A(N333), .B(N74), .Z(N334) );
  GTECH_AND2 C873 ( .A(N142), .B(N58), .Z(N333) );
  GTECH_AND2 C874 ( .A(N335), .B(N74), .Z(N336) );
  GTECH_OR2 C875 ( .A(N155), .B(N158), .Z(N335) );
  GTECH_AND2 C876 ( .A(N339), .B(N74), .Z(N340) );
  GTECH_AND2 C877 ( .A(N177), .B(N66), .Z(N339) );
  GTECH_AND2 C878 ( .A(N343), .B(N76), .Z(N344) );
  GTECH_AND2 C879 ( .A(N342), .B(IR[19]), .Z(N343) );
  GTECH_OR2 C880 ( .A(N150), .B(N152), .Z(N342) );
  GTECH_AND2 C881 ( .A(N347), .B(N76), .Z(N348) );
  GTECH_AND2 C882 ( .A(N346), .B(IR[15]), .Z(N347) );
  GTECH_OR2 C883 ( .A(N165), .B(N168), .Z(N346) );
  GTECH_OR2 C884 ( .A(N361), .B(N364), .Z(AXx2DMD) );
  GTECH_OR2 C885 ( .A(N357), .B(N360), .Z(N361) );
  GTECH_OR2 C886 ( .A(N354), .B(N356), .Z(N357) );
  GTECH_OR2 C887 ( .A(N353), .B(N79), .Z(N354) );
  GTECH_OR2 C888 ( .A(N350), .B(N352), .Z(N353) );
  GTECH_AND2 C889 ( .A(N349), .B(N79), .Z(N350) );
  GTECH_AND2 C890 ( .A(N142), .B(N58), .Z(N349) );
  GTECH_AND2 C891 ( .A(N351), .B(N79), .Z(N352) );
  GTECH_OR2 C892 ( .A(N155), .B(N158), .Z(N351) );
  GTECH_AND2 C893 ( .A(N355), .B(N79), .Z(N356) );
  GTECH_AND2 C894 ( .A(N177), .B(N66), .Z(N355) );
  GTECH_AND2 C895 ( .A(N359), .B(N82), .Z(N360) );
  GTECH_AND2 C896 ( .A(N358), .B(IR[19]), .Z(N359) );
  GTECH_OR2 C897 ( .A(N150), .B(N152), .Z(N358) );
  GTECH_AND2 C898 ( .A(N363), .B(N82), .Z(N364) );
  GTECH_AND2 C899 ( .A(N362), .B(IR[15]), .Z(N363) );
  GTECH_OR2 C900 ( .A(N165), .B(N168), .Z(N362) );
  GTECH_OR2 C901 ( .A(N377), .B(N380), .Z(sel_AY0) );
  GTECH_OR2 C902 ( .A(N373), .B(N376), .Z(N377) );
  GTECH_OR2 C903 ( .A(N370), .B(N372), .Z(N373) );
  GTECH_OR2 C904 ( .A(N369), .B(N84), .Z(N370) );
  GTECH_OR2 C905 ( .A(N366), .B(N368), .Z(N369) );
  GTECH_AND2 C906 ( .A(N365), .B(N84), .Z(N366) );
  GTECH_AND2 C907 ( .A(N142), .B(N58), .Z(N365) );
  GTECH_AND2 C908 ( .A(N367), .B(N84), .Z(N368) );
  GTECH_OR2 C909 ( .A(N155), .B(N158), .Z(N367) );
  GTECH_AND2 C910 ( .A(N371), .B(N84), .Z(N372) );
  GTECH_AND2 C911 ( .A(N177), .B(N85), .Z(N371) );
  GTECH_AND2 C912 ( .A(N375), .B(N87), .Z(N376) );
  GTECH_AND2 C913 ( .A(N374), .B(IR[19]), .Z(N375) );
  GTECH_OR2 C914 ( .A(N150), .B(N152), .Z(N374) );
  GTECH_AND2 C915 ( .A(N379), .B(N91), .Z(N380) );
  GTECH_AND2 C916 ( .A(N378), .B(IR[15]), .Z(N379) );
  GTECH_OR2 C917 ( .A(N165), .B(N168), .Z(N378) );
  GTECH_OR2 C918 ( .A(N393), .B(N396), .Z(AYx2DMD) );
  GTECH_OR2 C919 ( .A(N389), .B(N392), .Z(N393) );
  GTECH_OR2 C920 ( .A(N386), .B(N388), .Z(N389) );
  GTECH_OR2 C921 ( .A(N385), .B(N95), .Z(N386) );
  GTECH_OR2 C922 ( .A(N382), .B(N384), .Z(N385) );
  GTECH_AND2 C923 ( .A(N381), .B(N95), .Z(N382) );
  GTECH_AND2 C924 ( .A(N142), .B(N58), .Z(N381) );
  GTECH_AND2 C925 ( .A(N383), .B(N95), .Z(N384) );
  GTECH_OR2 C926 ( .A(N155), .B(N158), .Z(N383) );
  GTECH_AND2 C927 ( .A(N387), .B(N95), .Z(N388) );
  GTECH_AND2 C928 ( .A(N177), .B(N66), .Z(N387) );
  GTECH_AND2 C929 ( .A(N391), .B(N99), .Z(N392) );
  GTECH_AND2 C930 ( .A(N390), .B(IR[19]), .Z(N391) );
  GTECH_OR2 C931 ( .A(N150), .B(N152), .Z(N390) );
  GTECH_AND2 C932 ( .A(N395), .B(N99), .Z(N396) );
  GTECH_AND2 C933 ( .A(N394), .B(IR[15]), .Z(N395) );
  GTECH_OR2 C934 ( .A(N165), .B(N168), .Z(N394) );
  GTECH_AND2 C935 ( .A(N402), .B(N43), .Z(update_AS) );
  GTECH_AND2 C936 ( .A(N401), .B(IR[17]), .Z(N402) );
  GTECH_OR2 C937 ( .A(N133), .B(N400), .Z(N401) );
  GTECH_OR2 C938 ( .A(N398), .B(N399), .Z(N400) );
  GTECH_OR2 C939 ( .A(N397), .B(N155), .Z(N398) );
  GTECH_OR2 C940 ( .A(N150), .B(N152), .Z(N397) );
  GTECH_AND2 C941 ( .A(N138), .B(cond_fit), .Z(N399) );
  GTECH_AND2 C942 ( .A(N407), .B(IR[17]), .Z(update_ASTAT0_3) );
  GTECH_OR2 C943 ( .A(N133), .B(N406), .Z(N407) );
  GTECH_OR2 C944 ( .A(N404), .B(N405), .Z(N406) );
  GTECH_OR2 C945 ( .A(N403), .B(N155), .Z(N404) );
  GTECH_OR2 C946 ( .A(N150), .B(N152), .Z(N403) );
  GTECH_AND2 C947 ( .A(N138), .B(cond_fit), .Z(N405) );
endmodule


module constgen ( IR12_11, IR7_6, IR5, constYop );
  input [1:0] IR12_11;
  input [1:0] IR7_6;
  output [15:0] constYop;
  input IR5;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17;
  wire   [15:0] pre_constYop;

  GTECH_AND2 C37 ( .A(IR12_11[0]), .B(IR12_11[1]), .Z(N0) );
  GTECH_AND2 C38 ( .A(IR7_6[0]), .B(IR7_6[1]), .Z(N1) );
  GTECH_NOT I_0 ( .A(IR7_6[1]), .Z(N2) );
  GTECH_OR2 C41 ( .A(IR7_6[0]), .B(N2), .Z(N3) );
  GTECH_NOT I_1 ( .A(N3), .Z(N4) );
  GTECH_NOT I_2 ( .A(IR7_6[0]), .Z(N5) );
  GTECH_OR2 C45 ( .A(N5), .B(IR7_6[1]), .Z(N6) );
  GTECH_NOT I_3 ( .A(N6), .Z(N7) );
  GTECH_OR2 C48 ( .A(IR7_6[0]), .B(IR7_6[1]), .Z(N8) );
  GTECH_NOT I_4 ( .A(N8), .Z(N9) );
  GTECH_NOT I_5 ( .A(IR12_11[1]), .Z(N10) );
  GTECH_OR2 C51 ( .A(IR12_11[0]), .B(N10), .Z(N11) );
  GTECH_NOT I_6 ( .A(N11), .Z(N12) );
  GTECH_NOT I_7 ( .A(IR12_11[0]), .Z(N13) );
  GTECH_OR2 C72 ( .A(N13), .B(IR12_11[1]), .Z(N14) );
  GTECH_NOT I_8 ( .A(N14), .Z(N15) );
  GTECH_OR2 C92 ( .A(IR12_11[0]), .B(IR12_11[1]), .Z(N16) );
  GTECH_NOT I_9 ( .A(N16), .Z(N17) );
  GTECH_OR2 C110 ( .A(N17), .B(N9), .Z(pre_constYop[0]) );
  GTECH_OR2 C111 ( .A(N17), .B(N7), .Z(pre_constYop[1]) );
  GTECH_OR2 C112 ( .A(N17), .B(N4), .Z(pre_constYop[2]) );
  GTECH_OR2 C113 ( .A(N17), .B(N1), .Z(pre_constYop[3]) );
  GTECH_OR2 C114 ( .A(N15), .B(N9), .Z(pre_constYop[4]) );
  GTECH_OR2 C115 ( .A(N15), .B(N7), .Z(pre_constYop[5]) );
  GTECH_OR2 C116 ( .A(N15), .B(N4), .Z(pre_constYop[6]) );
  GTECH_OR2 C117 ( .A(N15), .B(N1), .Z(pre_constYop[7]) );
  GTECH_OR2 C118 ( .A(N12), .B(N9), .Z(pre_constYop[8]) );
  GTECH_OR2 C119 ( .A(N12), .B(N7), .Z(pre_constYop[9]) );
  GTECH_OR2 C120 ( .A(N12), .B(N4), .Z(pre_constYop[10]) );
  GTECH_OR2 C121 ( .A(N12), .B(N1), .Z(pre_constYop[11]) );
  GTECH_OR2 C122 ( .A(N0), .B(N9), .Z(pre_constYop[12]) );
  GTECH_OR2 C123 ( .A(N0), .B(N7), .Z(pre_constYop[13]) );
  GTECH_OR2 C124 ( .A(N0), .B(N4), .Z(pre_constYop[14]) );
  GTECH_OR2 C125 ( .A(N0), .B(N1), .Z(pre_constYop[15]) );
  GTECH_AND2 C126 ( .A(IR5), .B(pre_constYop[15]), .Z(constYop[15]) );
  GTECH_AND2 C127 ( .A(IR5), .B(pre_constYop[14]), .Z(constYop[14]) );
  GTECH_AND2 C128 ( .A(IR5), .B(pre_constYop[13]), .Z(constYop[13]) );
  GTECH_AND2 C129 ( .A(IR5), .B(pre_constYop[12]), .Z(constYop[12]) );
  GTECH_AND2 C130 ( .A(IR5), .B(pre_constYop[11]), .Z(constYop[11]) );
  GTECH_AND2 C131 ( .A(IR5), .B(pre_constYop[10]), .Z(constYop[10]) );
  GTECH_AND2 C132 ( .A(IR5), .B(pre_constYop[9]), .Z(constYop[9]) );
  GTECH_AND2 C133 ( .A(IR5), .B(pre_constYop[8]), .Z(constYop[8]) );
  GTECH_AND2 C134 ( .A(IR5), .B(pre_constYop[7]), .Z(constYop[7]) );
  GTECH_AND2 C135 ( .A(IR5), .B(pre_constYop[6]), .Z(constYop[6]) );
  GTECH_AND2 C136 ( .A(IR5), .B(pre_constYop[5]), .Z(constYop[5]) );
  GTECH_AND2 C137 ( .A(IR5), .B(pre_constYop[4]), .Z(constYop[4]) );
  GTECH_AND2 C138 ( .A(IR5), .B(pre_constYop[3]), .Z(constYop[3]) );
  GTECH_AND2 C139 ( .A(IR5), .B(pre_constYop[2]), .Z(constYop[2]) );
  GTECH_AND2 C140 ( .A(IR5), .B(pre_constYop[1]), .Z(constYop[1]) );
  GTECH_AND2 C141 ( .A(IR5), .B(pre_constYop[0]), .Z(constYop[0]) );
endmodule

