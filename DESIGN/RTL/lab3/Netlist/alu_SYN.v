/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : U-2022.12
// Date      : Fri Mar 24 12:21:01 2023
/////////////////////////////////////////////////////////////


module alu ( clk33, reset_, cond_fit, ASTAT5, ASTAT3, MSTAT3_R, MSTAT0, 
        MSTAT0_R, IR, PMD23_8, DMD, DMD_in, R, R_in, ASTAT5_in, ASTAT4_in, 
        ASTAT3_in, ASTAT2_in, ASTAT1_in, ASTAT0_in, update_AQ, update_AS, 
        update_ASTAT0_3, iomem_rd, iomem_wr_, BUSY_in, AX0_1st, AX0_2nd, 
        AX1_1st, AX1_2nd, AY0_1st, AY0_2nd, AY1_1st, AY1_2nd, AR_1st, AR_2nd, 
        AF_1st, AF_2nd, MEM_AR_Rin, bp_AR, alu_R, en_p2d_rr, DMD_no_PMD, 
        AY0_in, AY_in, AR_in, AX0_forward, AX1_forward, AY0_forward, 
        AY1_forward, AR_forward );
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
  output [15:0] alu_R;
  input [15:0] DMD_no_PMD;
  output [15:0] AY0_in;
  output [15:0] AY_in;
  output [15:0] AR_in;
  input clk33, reset_, cond_fit, ASTAT5, ASTAT3, MSTAT3_R, MSTAT0, MSTAT0_R,
         iomem_rd, iomem_wr_, BUSY_in, en_p2d_rr;
  output ASTAT5_in, ASTAT4_in, ASTAT3_in, ASTAT2_in, ASTAT1_in, ASTAT0_in,
         update_AQ, update_AS, update_ASTAT0_3, MEM_AR_Rin, bp_AR, AX0_forward,
         AX1_forward, AY0_forward, AY1_forward, AR_forward;
  wire   BUSY_in_r, PMD2AY, PMD2AY_rr, PMD2AY_r, en_AF_2nd, en_AF_1st, load_AR,
         load_AR_rr, load_AR_r, en_AR_1st, en_AR_2nd, ARtoR, ARtoR_r, N166,
         AR2DMD, AR2DMD_rr, AR2DMD_r, N74, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n33, n41, n42, n43, n44, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n406, n407, n408, n409,
         n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, n420,
         n421, n422, n423, n424, n425, n426, n427, n428, n429, n430;
  wire   [1:0] sel_Xop;
  wire   [3:1] alu_Xop_sel;
  wire   [1:0] sel_Yop_r;
  wire   [1:0] sel_Yop;
  tri   ASTAT5_in;
  tri   ASTAT4_in;
  tri   ASTAT3_in;
  tri   ASTAT2_in;
  tri   ASTAT1_in;
  tri   ASTAT0_in;
  tri   [15:0] alu_R;
  tri   DIVS;
  tri   [15:0] alu_Xop;
  tri   is_div;
  tri   Q_in;
  tri   [15:0] alu_Yop;
  tri   CI_in;
  tri   is_logic_func;
  tri   inv_Xop;
  tri   inv_Yop;

  alufunc ALUFUNC ( .p2(CI_in), .p3(is_div), .p4(is_logic_func), .p5(inv_Xop), 
        .p6(inv_Yop), .p7(DIVS), .p9(alu_Xop), .p10(alu_Yop), .p11(alu_R), 
        .p12(ASTAT5_in), .p13(ASTAT4_in), .p14(ASTAT3_in), .p15(ASTAT2_in), 
        .p16(ASTAT1_in), .p17(ASTAT0_in), .p18(Q_in) );
  aluctrl ALUCTRL ( .cond_fit(cond_fit), .ASTAT5(ASTAT5), .ASTAT3(ASTAT3), 
        .ASTAT4_in(ASTAT4_in), .MSTAT0(MSTAT0), .IR(IR), .sel_Xop(sel_Xop), 
        .sel_Yop(sel_Yop), .PMD2AY(PMD2AY), .en_AF_1st(en_AF_1st), .en_AF_2nd(
        en_AF_2nd), .DIVS(DIVS), .CI_in(CI_in), .is_div(is_div), 
        .is_logic_func(is_logic_func), .inv_Xop(inv_Xop), .inv_Yop(inv_Yop), 
        .load_AR(load_AR), .en_AR_1st(en_AR_1st), .en_AR_2nd(en_AR_2nd), 
        .ARtoR(ARtoR), .AR2DMD(AR2DMD), .update_AS(update_AS) );
  DFFARX1_LVT BUSY_in_r_reg ( .D(BUSY_in), .CLK(clk33), .RSTB(reset_), .Q(
        BUSY_in_r) );
  DFFARX1_LVT BUSY_reg ( .D(BUSY_in_r), .CLK(clk33), .RSTB(reset_), .QN(n406)
         );
  DFFARX1_LVT alu_Xop_sel_reg_1_ ( .D(IR[8]), .CLK(clk33), .RSTB(reset_), .Q(
        alu_Xop_sel[1]) );
  DFFARX1_LVT AF_2nd_reg_0_ ( .D(n124), .CLK(clk33), .RSTB(reset_), .Q(
        AF_2nd[0]) );
  DFFARX1_LVT PMD2AY_r_reg ( .D(PMD2AY), .CLK(clk33), .RSTB(reset_), .Q(
        PMD2AY_r) );
  DFFARX1_LVT PMD2AY_rr_reg ( .D(PMD2AY_r), .CLK(clk33), .RSTB(reset_), .Q(
        PMD2AY_rr) );
  DFFARX1_LVT sel_Yop_r_reg_0_ ( .D(sel_Yop[0]), .CLK(clk33), .RSTB(reset_), 
        .Q(sel_Yop_r[0]) );
  DFFARX1_LVT sel_Yop_r_reg_1_ ( .D(sel_Yop[1]), .CLK(clk33), .RSTB(reset_), 
        .Q(sel_Yop_r[1]), .QN(n430) );
  DFFARX1_LVT alu_Xop_sel_reg_2_ ( .D(sel_Xop[0]), .CLK(clk33), .RSTB(reset_), 
        .Q(alu_Xop_sel[2]), .QN(n428) );
  DFFARX1_LVT alu_Xop_sel_reg_3_ ( .D(sel_Xop[1]), .CLK(clk33), .RSTB(reset_), 
        .Q(alu_Xop_sel[3]) );
  DFFARX1_LVT is_div_r_reg ( .D(is_div), .CLK(clk33), .RSTB(reset_), .Q(
        update_AQ) );
  DFFARX1_LVT is_div_rr_reg ( .D(update_AQ), .CLK(clk33), .RSTB(reset_), .QN(
        n427) );
  DFFARX1_LVT AF_1st_reg_0_ ( .D(n123), .CLK(clk33), .RSTB(reset_), .Q(
        AF_1st[0]) );
  DFFARX1_LVT AF_1st_reg_1_ ( .D(n122), .CLK(clk33), .RSTB(reset_), .Q(
        AF_1st[1]) );
  DFFARX1_LVT AF_2nd_reg_1_ ( .D(n121), .CLK(clk33), .RSTB(reset_), .Q(
        AF_2nd[1]) );
  DFFARX1_LVT AF_1st_reg_2_ ( .D(n120), .CLK(clk33), .RSTB(reset_), .Q(
        AF_1st[2]) );
  DFFARX1_LVT AF_2nd_reg_2_ ( .D(n119), .CLK(clk33), .RSTB(reset_), .Q(
        AF_2nd[2]) );
  DFFARX1_LVT AF_1st_reg_3_ ( .D(n118), .CLK(clk33), .RSTB(reset_), .Q(
        AF_1st[3]) );
  DFFARX1_LVT AF_2nd_reg_3_ ( .D(n117), .CLK(clk33), .RSTB(reset_), .Q(
        AF_2nd[3]) );
  DFFARX1_LVT AF_1st_reg_4_ ( .D(n116), .CLK(clk33), .RSTB(reset_), .Q(
        AF_1st[4]) );
  DFFARX1_LVT AF_2nd_reg_4_ ( .D(n115), .CLK(clk33), .RSTB(reset_), .Q(
        AF_2nd[4]) );
  DFFARX1_LVT AF_1st_reg_5_ ( .D(n114), .CLK(clk33), .RSTB(reset_), .Q(
        AF_1st[5]) );
  DFFARX1_LVT AF_2nd_reg_5_ ( .D(n113), .CLK(clk33), .RSTB(reset_), .Q(
        AF_2nd[5]) );
  DFFARX1_LVT AF_1st_reg_6_ ( .D(n112), .CLK(clk33), .RSTB(reset_), .Q(
        AF_1st[6]) );
  DFFARX1_LVT AF_2nd_reg_6_ ( .D(n111), .CLK(clk33), .RSTB(reset_), .Q(
        AF_2nd[6]) );
  DFFARX1_LVT AF_1st_reg_7_ ( .D(n110), .CLK(clk33), .RSTB(reset_), .Q(
        AF_1st[7]) );
  DFFARX1_LVT AF_2nd_reg_7_ ( .D(n109), .CLK(clk33), .RSTB(reset_), .Q(
        AF_2nd[7]) );
  DFFARX1_LVT AF_1st_reg_8_ ( .D(n108), .CLK(clk33), .RSTB(reset_), .Q(
        AF_1st[8]) );
  DFFARX1_LVT AF_2nd_reg_8_ ( .D(n107), .CLK(clk33), .RSTB(reset_), .Q(
        AF_2nd[8]) );
  DFFARX1_LVT AF_1st_reg_9_ ( .D(n106), .CLK(clk33), .RSTB(reset_), .Q(
        AF_1st[9]) );
  DFFARX1_LVT AF_2nd_reg_9_ ( .D(n105), .CLK(clk33), .RSTB(reset_), .Q(
        AF_2nd[9]) );
  DFFARX1_LVT AF_1st_reg_10_ ( .D(n104), .CLK(clk33), .RSTB(reset_), .Q(
        AF_1st[10]) );
  DFFARX1_LVT AF_2nd_reg_10_ ( .D(n103), .CLK(clk33), .RSTB(reset_), .Q(
        AF_2nd[10]) );
  DFFARX1_LVT AF_1st_reg_11_ ( .D(n102), .CLK(clk33), .RSTB(reset_), .Q(
        AF_1st[11]) );
  DFFARX1_LVT AF_2nd_reg_11_ ( .D(n101), .CLK(clk33), .RSTB(reset_), .Q(
        AF_2nd[11]) );
  DFFARX1_LVT AF_1st_reg_12_ ( .D(n100), .CLK(clk33), .RSTB(reset_), .Q(
        AF_1st[12]) );
  DFFARX1_LVT AF_2nd_reg_12_ ( .D(n99), .CLK(clk33), .RSTB(reset_), .Q(
        AF_2nd[12]) );
  DFFARX1_LVT AF_1st_reg_13_ ( .D(n98), .CLK(clk33), .RSTB(reset_), .Q(
        AF_1st[13]) );
  DFFARX1_LVT AF_2nd_reg_13_ ( .D(n97), .CLK(clk33), .RSTB(reset_), .Q(
        AF_2nd[13]) );
  DFFARX1_LVT AF_1st_reg_14_ ( .D(n96), .CLK(clk33), .RSTB(reset_), .Q(
        AF_1st[14]) );
  DFFARX1_LVT AF_2nd_reg_14_ ( .D(n95), .CLK(clk33), .RSTB(reset_), .Q(
        AF_2nd[14]) );
  DFFARX1_LVT AF_1st_reg_15_ ( .D(n94), .CLK(clk33), .RSTB(reset_), .Q(
        AF_1st[15]) );
  DFFARX1_LVT AF_2nd_reg_15_ ( .D(n93), .CLK(clk33), .RSTB(reset_), .Q(
        AF_2nd[15]) );
  DFFARX1_LVT load_AR_r_reg ( .D(load_AR), .CLK(clk33), .RSTB(reset_), .Q(
        load_AR_r) );
  DFFARX1_LVT load_AR_rr_reg ( .D(load_AR_r), .CLK(clk33), .RSTB(reset_), .Q(
        load_AR_rr) );
  DFFARX1_LVT AR_1st_reg_15_ ( .D(n92), .CLK(clk33), .RSTB(reset_), .Q(
        AR_1st[15]) );
  DFFARX1_LVT AR_1st_reg_14_ ( .D(n91), .CLK(clk33), .RSTB(reset_), .Q(
        AR_1st[14]) );
  DFFARX1_LVT AR_1st_reg_13_ ( .D(n90), .CLK(clk33), .RSTB(reset_), .Q(
        AR_1st[13]) );
  DFFARX1_LVT AR_1st_reg_12_ ( .D(n89), .CLK(clk33), .RSTB(reset_), .Q(
        AR_1st[12]) );
  DFFARX1_LVT AR_1st_reg_11_ ( .D(n88), .CLK(clk33), .RSTB(reset_), .Q(
        AR_1st[11]) );
  DFFARX1_LVT AR_1st_reg_10_ ( .D(n87), .CLK(clk33), .RSTB(reset_), .Q(
        AR_1st[10]) );
  DFFARX1_LVT AR_1st_reg_9_ ( .D(n86), .CLK(clk33), .RSTB(reset_), .Q(
        AR_1st[9]) );
  DFFARX1_LVT AR_1st_reg_8_ ( .D(n85), .CLK(clk33), .RSTB(reset_), .Q(
        AR_1st[8]) );
  DFFARX1_LVT AR_1st_reg_7_ ( .D(n84), .CLK(clk33), .RSTB(reset_), .Q(
        AR_1st[7]) );
  DFFARX1_LVT AR_1st_reg_6_ ( .D(n83), .CLK(clk33), .RSTB(reset_), .Q(
        AR_1st[6]) );
  DFFARX1_LVT AR_1st_reg_5_ ( .D(n82), .CLK(clk33), .RSTB(reset_), .Q(
        AR_1st[5]) );
  DFFARX1_LVT AR_1st_reg_4_ ( .D(n81), .CLK(clk33), .RSTB(reset_), .Q(
        AR_1st[4]) );
  DFFARX1_LVT AR_1st_reg_3_ ( .D(n80), .CLK(clk33), .RSTB(reset_), .Q(
        AR_1st[3]) );
  DFFARX1_LVT AR_1st_reg_2_ ( .D(n79), .CLK(clk33), .RSTB(reset_), .Q(
        AR_1st[2]) );
  DFFARX1_LVT AR_1st_reg_1_ ( .D(n78), .CLK(clk33), .RSTB(reset_), .Q(
        AR_1st[1]) );
  DFFARX1_LVT AR_1st_reg_0_ ( .D(n77), .CLK(clk33), .RSTB(reset_), .Q(
        AR_1st[0]) );
  DFFARX1_LVT AR_2nd_reg_15_ ( .D(n76), .CLK(clk33), .RSTB(reset_), .Q(
        AR_2nd[15]) );
  DFFARX1_LVT AR_2nd_reg_14_ ( .D(n75), .CLK(clk33), .RSTB(reset_), .Q(
        AR_2nd[14]) );
  DFFARX1_LVT AR_2nd_reg_13_ ( .D(n74), .CLK(clk33), .RSTB(reset_), .Q(
        AR_2nd[13]) );
  DFFARX1_LVT AR_2nd_reg_12_ ( .D(n73), .CLK(clk33), .RSTB(reset_), .Q(
        AR_2nd[12]) );
  DFFARX1_LVT AR_2nd_reg_11_ ( .D(n72), .CLK(clk33), .RSTB(reset_), .Q(
        AR_2nd[11]) );
  DFFARX1_LVT AR_2nd_reg_10_ ( .D(n71), .CLK(clk33), .RSTB(reset_), .Q(
        AR_2nd[10]) );
  DFFARX1_LVT AR_2nd_reg_9_ ( .D(n70), .CLK(clk33), .RSTB(reset_), .Q(
        AR_2nd[9]) );
  DFFARX1_LVT AR_2nd_reg_8_ ( .D(n69), .CLK(clk33), .RSTB(reset_), .Q(
        AR_2nd[8]) );
  DFFARX1_LVT AR_2nd_reg_7_ ( .D(n68), .CLK(clk33), .RSTB(reset_), .Q(
        AR_2nd[7]) );
  DFFARX1_LVT AR_2nd_reg_6_ ( .D(n67), .CLK(clk33), .RSTB(reset_), .Q(
        AR_2nd[6]) );
  DFFARX1_LVT AR_2nd_reg_5_ ( .D(n66), .CLK(clk33), .RSTB(reset_), .Q(
        AR_2nd[5]) );
  DFFARX1_LVT AR_2nd_reg_4_ ( .D(n65), .CLK(clk33), .RSTB(reset_), .Q(
        AR_2nd[4]) );
  DFFARX1_LVT AR_2nd_reg_3_ ( .D(n64), .CLK(clk33), .RSTB(reset_), .Q(
        AR_2nd[3]) );
  DFFARX1_LVT AR_2nd_reg_2_ ( .D(n63), .CLK(clk33), .RSTB(reset_), .Q(
        AR_2nd[2]) );
  DFFARX1_LVT AR_2nd_reg_1_ ( .D(n62), .CLK(clk33), .RSTB(reset_), .Q(
        AR_2nd[1]) );
  DFFARX1_LVT AR_2nd_reg_0_ ( .D(n61), .CLK(clk33), .RSTB(reset_), .Q(
        AR_2nd[0]) );
  DFFARX1_LVT MEM_AR_Rin_reg ( .D(N166), .CLK(clk33), .RSTB(reset_), .Q(
        MEM_AR_Rin) );
  DFFARX1_LVT ARtoR_r_reg ( .D(ARtoR), .CLK(clk33), .RSTB(reset_), .Q(ARtoR_r)
         );
  DFFARX1_LVT AR2DMD_r_reg ( .D(AR2DMD), .CLK(clk33), .RSTB(reset_), .Q(
        AR2DMD_r) );
  DFFARX1_LVT AR2DMD_rr_reg ( .D(AR2DMD_r), .CLK(clk33), .RSTB(reset_), .Q(
        AR2DMD_rr), .QN(n429) );
  INVX0_LVT U228 ( .INP(n141), .ZN(alu_Yop[0]) );
  INVX0_LVT U229 ( .INP(n140), .ZN(alu_Yop[1]) );
  INVX0_LVT U230 ( .INP(n139), .ZN(alu_Yop[2]) );
  INVX0_LVT U231 ( .INP(n138), .ZN(alu_Yop[3]) );
  INVX0_LVT U232 ( .INP(n137), .ZN(alu_Yop[4]) );
  INVX0_LVT U233 ( .INP(n136), .ZN(alu_Yop[5]) );
  INVX0_LVT U234 ( .INP(n135), .ZN(alu_Yop[6]) );
  INVX0_LVT U235 ( .INP(n134), .ZN(alu_Yop[7]) );
  INVX0_LVT U236 ( .INP(n133), .ZN(alu_Yop[8]) );
  INVX0_LVT U237 ( .INP(n132), .ZN(alu_Yop[9]) );
  INVX0_LVT U238 ( .INP(n131), .ZN(alu_Yop[10]) );
  INVX0_LVT U239 ( .INP(n130), .ZN(alu_Yop[11]) );
  INVX0_LVT U240 ( .INP(n129), .ZN(alu_Yop[12]) );
  INVX0_LVT U241 ( .INP(n128), .ZN(alu_Yop[13]) );
  INVX0_LVT U242 ( .INP(n127), .ZN(alu_Yop[14]) );
  INVX0_LVT U243 ( .INP(n126), .ZN(alu_Yop[15]) );
  NAND3X0_LVT U244 ( .IN1(1'b1), .IN2(1'b1), .IN3(n44), .QN(alu_Xop[15]) );
  AO221X1_LVT U245 ( .IN1(N74), .IN2(1'b0), .IN3(n125), .IN4(1'b0), .IN5(n46), 
        .Q(alu_Xop[14]) );
  AO221X1_LVT U246 ( .IN1(N74), .IN2(1'b0), .IN3(n125), .IN4(1'b0), .IN5(n47), 
        .Q(alu_Xop[13]) );
  AO221X1_LVT U247 ( .IN1(N74), .IN2(1'b0), .IN3(n125), .IN4(1'b0), .IN5(n48), 
        .Q(alu_Xop[12]) );
  AO221X1_LVT U248 ( .IN1(N74), .IN2(1'b0), .IN3(n125), .IN4(1'b0), .IN5(n49), 
        .Q(alu_Xop[11]) );
  AO221X1_LVT U249 ( .IN1(N74), .IN2(1'b0), .IN3(n125), .IN4(1'b0), .IN5(n50), 
        .Q(alu_Xop[10]) );
  AO221X1_LVT U250 ( .IN1(N74), .IN2(1'b0), .IN3(n125), .IN4(1'b0), .IN5(n51), 
        .Q(alu_Xop[9]) );
  AO221X1_LVT U251 ( .IN1(N74), .IN2(1'b0), .IN3(n125), .IN4(1'b0), .IN5(n52), 
        .Q(alu_Xop[8]) );
  AO221X1_LVT U252 ( .IN1(N74), .IN2(1'b0), .IN3(n125), .IN4(1'b0), .IN5(n53), 
        .Q(alu_Xop[7]) );
  AO221X1_LVT U253 ( .IN1(N74), .IN2(1'b0), .IN3(n125), .IN4(1'b0), .IN5(n54), 
        .Q(alu_Xop[6]) );
  AO221X1_LVT U254 ( .IN1(N74), .IN2(1'b0), .IN3(n125), .IN4(1'b0), .IN5(n55), 
        .Q(alu_Xop[5]) );
  AO221X1_LVT U255 ( .IN1(N74), .IN2(1'b0), .IN3(n125), .IN4(1'b0), .IN5(n56), 
        .Q(alu_Xop[4]) );
  AO221X1_LVT U256 ( .IN1(N74), .IN2(1'b0), .IN3(n125), .IN4(1'b0), .IN5(n57), 
        .Q(alu_Xop[3]) );
  AO221X1_LVT U257 ( .IN1(N74), .IN2(1'b0), .IN3(n125), .IN4(1'b0), .IN5(n58), 
        .Q(alu_Xop[2]) );
  AO221X1_LVT U258 ( .IN1(N74), .IN2(1'b0), .IN3(n125), .IN4(1'b0), .IN5(n59), 
        .Q(alu_Xop[1]) );
  AO221X1_LVT U259 ( .IN1(N74), .IN2(1'b0), .IN3(n125), .IN4(1'b0), .IN5(n60), 
        .Q(alu_Xop[0]) );
  MUX21X1_LVT U26 ( .IN1(alu_R[0]), .IN2(DMD_in[0]), .S(load_AR_rr), .Q(
        AR_in[0]) );
  MUX21X1_LVT U30 ( .IN1(alu_R[1]), .IN2(DMD_in[1]), .S(load_AR_rr), .Q(
        AR_in[1]) );
  MUX21X1_LVT U32 ( .IN1(alu_R[2]), .IN2(DMD_in[2]), .S(load_AR_rr), .Q(
        AR_in[2]) );
  MUX21X1_LVT U34 ( .IN1(alu_R[3]), .IN2(DMD_in[3]), .S(load_AR_rr), .Q(
        AR_in[3]) );
  MUX21X1_LVT U36 ( .IN1(alu_R[4]), .IN2(DMD_in[4]), .S(load_AR_rr), .Q(
        AR_in[4]) );
  MUX21X1_LVT U38 ( .IN1(alu_R[5]), .IN2(DMD_in[5]), .S(load_AR_rr), .Q(
        AR_in[5]) );
  MUX21X1_LVT U40 ( .IN1(alu_R[6]), .IN2(DMD_in[6]), .S(load_AR_rr), .Q(
        AR_in[6]) );
  MUX21X1_LVT U42 ( .IN1(alu_R[7]), .IN2(DMD_in[7]), .S(load_AR_rr), .Q(
        AR_in[7]) );
  MUX21X1_LVT U44 ( .IN1(alu_R[8]), .IN2(DMD_in[8]), .S(load_AR_rr), .Q(
        AR_in[8]) );
  MUX21X1_LVT U46 ( .IN1(alu_R[9]), .IN2(DMD_in[9]), .S(load_AR_rr), .Q(
        AR_in[9]) );
  MUX21X1_LVT U48 ( .IN1(alu_R[10]), .IN2(DMD_in[10]), .S(load_AR_rr), .Q(
        AR_in[10]) );
  MUX21X1_LVT U50 ( .IN1(alu_R[11]), .IN2(DMD_in[11]), .S(load_AR_rr), .Q(
        AR_in[11]) );
  MUX21X1_LVT U52 ( .IN1(alu_R[12]), .IN2(DMD_in[12]), .S(load_AR_rr), .Q(
        AR_in[12]) );
  MUX21X1_LVT U54 ( .IN1(alu_R[13]), .IN2(DMD_in[13]), .S(load_AR_rr), .Q(
        AR_in[13]) );
  MUX21X1_LVT U56 ( .IN1(alu_R[14]), .IN2(DMD_in[14]), .S(load_AR_rr), .Q(
        AR_in[14]) );
  MUX21X1_LVT U58 ( .IN1(alu_R[15]), .IN2(DMD_in[15]), .S(load_AR_rr), .Q(
        AR_in[15]) );
  MUX21X1_LVT U162 ( .IN1(Q_in), .IN2(AY_in[0]), .S(n427), .Q(AY0_in[0]) );
  AO222X1_LVT U214 ( .IN1(alu_R[3]), .IN2(n43), .IN3(n42), .IN4(AR_2nd[3]), 
        .IN5(n41), .IN6(AR_1st[3]), .Q(R[3]) );
  AO222X1_LVT U211 ( .IN1(alu_R[0]), .IN2(n43), .IN3(n42), .IN4(AR_2nd[0]), 
        .IN5(n41), .IN6(AR_1st[0]), .Q(R[0]) );
  AO222X1_LVT U212 ( .IN1(alu_R[1]), .IN2(n43), .IN3(n42), .IN4(AR_2nd[1]), 
        .IN5(n41), .IN6(AR_1st[1]), .Q(R[1]) );
  AO222X1_LVT U213 ( .IN1(alu_R[2]), .IN2(n43), .IN3(n42), .IN4(AR_2nd[2]), 
        .IN5(n41), .IN6(AR_1st[2]), .Q(R[2]) );
  AO222X1_LVT U215 ( .IN1(alu_R[4]), .IN2(n43), .IN3(n42), .IN4(AR_2nd[4]), 
        .IN5(n41), .IN6(AR_1st[4]), .Q(R[4]) );
  AO222X1_LVT U216 ( .IN1(alu_R[5]), .IN2(n43), .IN3(n42), .IN4(AR_2nd[5]), 
        .IN5(n41), .IN6(AR_1st[5]), .Q(R[5]) );
  AO222X1_LVT U217 ( .IN1(alu_R[6]), .IN2(n43), .IN3(n42), .IN4(AR_2nd[6]), 
        .IN5(n41), .IN6(AR_1st[6]), .Q(R[6]) );
  AO222X1_LVT U218 ( .IN1(alu_R[7]), .IN2(n43), .IN3(n42), .IN4(AR_2nd[7]), 
        .IN5(n41), .IN6(AR_1st[7]), .Q(R[7]) );
  AO222X1_LVT U219 ( .IN1(alu_R[8]), .IN2(n43), .IN3(n42), .IN4(AR_2nd[8]), 
        .IN5(n41), .IN6(AR_1st[8]), .Q(R[8]) );
  AO222X1_LVT U220 ( .IN1(alu_R[9]), .IN2(n43), .IN3(n42), .IN4(AR_2nd[9]), 
        .IN5(n41), .IN6(AR_1st[9]), .Q(R[9]) );
  AO222X1_LVT U221 ( .IN1(alu_R[10]), .IN2(n43), .IN3(n42), .IN4(AR_2nd[10]), 
        .IN5(n41), .IN6(AR_1st[10]), .Q(R[10]) );
  AO222X1_LVT U222 ( .IN1(alu_R[11]), .IN2(n43), .IN3(n42), .IN4(AR_2nd[11]), 
        .IN5(n41), .IN6(AR_1st[11]), .Q(R[11]) );
  AO222X1_LVT U223 ( .IN1(alu_R[12]), .IN2(n43), .IN3(n42), .IN4(AR_2nd[12]), 
        .IN5(n41), .IN6(AR_1st[12]), .Q(R[12]) );
  AO222X1_LVT U224 ( .IN1(alu_R[13]), .IN2(n43), .IN3(n42), .IN4(AR_2nd[13]), 
        .IN5(n41), .IN6(AR_1st[13]), .Q(R[13]) );
  AO222X1_LVT U225 ( .IN1(alu_R[14]), .IN2(n43), .IN3(n42), .IN4(AR_2nd[14]), 
        .IN5(n41), .IN6(AR_1st[14]), .Q(R[14]) );
  AO222X1_LVT U226 ( .IN1(alu_R[15]), .IN2(n43), .IN3(n42), .IN4(AR_2nd[15]), 
        .IN5(n41), .IN6(AR_1st[15]), .Q(R[15]) );
  MUX21X1_LVT U78 ( .IN1(alu_R[14]), .IN2(alu_R[15]), .S(n427), .Q(n16) );
  MUX21X1_LVT U83 ( .IN1(alu_R[13]), .IN2(alu_R[14]), .S(n427), .Q(n17) );
  MUX21X1_LVT U86 ( .IN1(alu_R[12]), .IN2(alu_R[13]), .S(n427), .Q(n18) );
  MUX21X1_LVT U89 ( .IN1(alu_R[11]), .IN2(alu_R[12]), .S(n427), .Q(n19) );
  MUX21X1_LVT U92 ( .IN1(alu_R[10]), .IN2(alu_R[11]), .S(n427), .Q(n20) );
  MUX21X1_LVT U95 ( .IN1(alu_R[9]), .IN2(alu_R[10]), .S(n427), .Q(n21) );
  MUX21X1_LVT U98 ( .IN1(alu_R[8]), .IN2(alu_R[9]), .S(n427), .Q(n22) );
  MUX21X1_LVT U101 ( .IN1(alu_R[7]), .IN2(alu_R[8]), .S(n427), .Q(n23) );
  MUX21X1_LVT U104 ( .IN1(alu_R[6]), .IN2(alu_R[7]), .S(n427), .Q(n24) );
  MUX21X1_LVT U107 ( .IN1(alu_R[5]), .IN2(alu_R[6]), .S(n427), .Q(n25) );
  MUX21X1_LVT U110 ( .IN1(alu_R[4]), .IN2(alu_R[5]), .S(n427), .Q(n26) );
  MUX21X1_LVT U113 ( .IN1(alu_R[3]), .IN2(alu_R[4]), .S(n427), .Q(n27) );
  MUX21X1_LVT U116 ( .IN1(alu_R[2]), .IN2(alu_R[3]), .S(n427), .Q(n28) );
  MUX21X1_LVT U119 ( .IN1(alu_R[1]), .IN2(alu_R[2]), .S(n427), .Q(n29) );
  MUX21X1_LVT U122 ( .IN1(alu_R[0]), .IN2(alu_R[1]), .S(n427), .Q(n30) );
  AND2X1_LVT U125 ( .IN1(n427), .IN2(alu_R[0]), .Q(n33) );
  INVX0_LVT U260 ( .INP(1'b1), .ZN(AY1_forward) );
  INVX0_LVT U262 ( .INP(1'b1), .ZN(AY0_forward) );
  INVX0_LVT U264 ( .INP(1'b1), .ZN(AX1_forward) );
  INVX0_LVT U266 ( .INP(1'b1), .ZN(AX0_forward) );
  INVX0_LVT U268 ( .INP(1'b1), .ZN(AY1_2nd[0]) );
  INVX0_LVT U270 ( .INP(1'b1), .ZN(AY1_2nd[1]) );
  INVX0_LVT U272 ( .INP(1'b1), .ZN(AY1_2nd[2]) );
  INVX0_LVT U274 ( .INP(1'b1), .ZN(AY1_2nd[3]) );
  INVX0_LVT U276 ( .INP(1'b1), .ZN(AY1_2nd[4]) );
  INVX0_LVT U278 ( .INP(1'b1), .ZN(AY1_2nd[5]) );
  INVX0_LVT U280 ( .INP(1'b1), .ZN(AY1_2nd[6]) );
  INVX0_LVT U282 ( .INP(1'b1), .ZN(AY1_2nd[7]) );
  INVX0_LVT U284 ( .INP(1'b1), .ZN(AY1_2nd[8]) );
  INVX0_LVT U286 ( .INP(1'b1), .ZN(AY1_2nd[9]) );
  INVX0_LVT U288 ( .INP(1'b1), .ZN(AY1_2nd[10]) );
  INVX0_LVT U290 ( .INP(1'b1), .ZN(AY1_2nd[11]) );
  INVX0_LVT U292 ( .INP(1'b1), .ZN(AY1_2nd[12]) );
  INVX0_LVT U294 ( .INP(1'b1), .ZN(AY1_2nd[13]) );
  INVX0_LVT U296 ( .INP(1'b1), .ZN(AY1_2nd[14]) );
  INVX0_LVT U298 ( .INP(1'b1), .ZN(AY1_2nd[15]) );
  INVX0_LVT U300 ( .INP(1'b1), .ZN(AY1_1st[0]) );
  INVX0_LVT U302 ( .INP(1'b1), .ZN(AY1_1st[1]) );
  INVX0_LVT U304 ( .INP(1'b1), .ZN(AY1_1st[2]) );
  INVX0_LVT U306 ( .INP(1'b1), .ZN(AY1_1st[3]) );
  INVX0_LVT U308 ( .INP(1'b1), .ZN(AY1_1st[4]) );
  INVX0_LVT U310 ( .INP(1'b1), .ZN(AY1_1st[5]) );
  INVX0_LVT U312 ( .INP(1'b1), .ZN(AY1_1st[6]) );
  INVX0_LVT U314 ( .INP(1'b1), .ZN(AY1_1st[7]) );
  INVX0_LVT U316 ( .INP(1'b1), .ZN(AY1_1st[8]) );
  INVX0_LVT U318 ( .INP(1'b1), .ZN(AY1_1st[9]) );
  INVX0_LVT U320 ( .INP(1'b1), .ZN(AY1_1st[10]) );
  INVX0_LVT U322 ( .INP(1'b1), .ZN(AY1_1st[11]) );
  INVX0_LVT U324 ( .INP(1'b1), .ZN(AY1_1st[12]) );
  INVX0_LVT U326 ( .INP(1'b1), .ZN(AY1_1st[13]) );
  INVX0_LVT U328 ( .INP(1'b1), .ZN(AY1_1st[14]) );
  INVX0_LVT U330 ( .INP(1'b1), .ZN(AY1_1st[15]) );
  INVX0_LVT U332 ( .INP(1'b1), .ZN(AY0_2nd[0]) );
  INVX0_LVT U334 ( .INP(1'b1), .ZN(AY0_2nd[1]) );
  INVX0_LVT U336 ( .INP(1'b1), .ZN(AY0_2nd[2]) );
  INVX0_LVT U338 ( .INP(1'b1), .ZN(AY0_2nd[3]) );
  INVX0_LVT U340 ( .INP(1'b1), .ZN(AY0_2nd[4]) );
  INVX0_LVT U342 ( .INP(1'b1), .ZN(AY0_2nd[5]) );
  INVX0_LVT U344 ( .INP(1'b1), .ZN(AY0_2nd[6]) );
  INVX0_LVT U346 ( .INP(1'b1), .ZN(AY0_2nd[7]) );
  INVX0_LVT U348 ( .INP(1'b1), .ZN(AY0_2nd[8]) );
  INVX0_LVT U350 ( .INP(1'b1), .ZN(AY0_2nd[9]) );
  INVX0_LVT U352 ( .INP(1'b1), .ZN(AY0_2nd[10]) );
  INVX0_LVT U354 ( .INP(1'b1), .ZN(AY0_2nd[11]) );
  INVX0_LVT U356 ( .INP(1'b1), .ZN(AY0_2nd[12]) );
  INVX0_LVT U358 ( .INP(1'b1), .ZN(AY0_2nd[13]) );
  INVX0_LVT U360 ( .INP(1'b1), .ZN(AY0_2nd[14]) );
  INVX0_LVT U362 ( .INP(1'b1), .ZN(AY0_2nd[15]) );
  INVX0_LVT U364 ( .INP(1'b1), .ZN(AY0_1st[0]) );
  INVX0_LVT U366 ( .INP(1'b1), .ZN(AY0_1st[1]) );
  INVX0_LVT U368 ( .INP(1'b1), .ZN(AY0_1st[2]) );
  INVX0_LVT U370 ( .INP(1'b1), .ZN(AY0_1st[3]) );
  INVX0_LVT U372 ( .INP(1'b1), .ZN(AY0_1st[4]) );
  INVX0_LVT U374 ( .INP(1'b1), .ZN(AY0_1st[5]) );
  INVX0_LVT U376 ( .INP(1'b1), .ZN(AY0_1st[6]) );
  INVX0_LVT U378 ( .INP(1'b1), .ZN(AY0_1st[7]) );
  INVX0_LVT U380 ( .INP(1'b1), .ZN(AY0_1st[8]) );
  INVX0_LVT U382 ( .INP(1'b1), .ZN(AY0_1st[9]) );
  INVX0_LVT U384 ( .INP(1'b1), .ZN(AY0_1st[10]) );
  INVX0_LVT U386 ( .INP(1'b1), .ZN(AY0_1st[11]) );
  INVX0_LVT U388 ( .INP(1'b1), .ZN(AY0_1st[12]) );
  INVX0_LVT U390 ( .INP(1'b1), .ZN(AY0_1st[13]) );
  INVX0_LVT U392 ( .INP(1'b1), .ZN(AY0_1st[14]) );
  INVX0_LVT U394 ( .INP(1'b1), .ZN(AY0_1st[15]) );
  INVX0_LVT U396 ( .INP(1'b1), .ZN(AX1_2nd[0]) );
  INVX0_LVT U398 ( .INP(1'b1), .ZN(AX1_2nd[1]) );
  INVX0_LVT U400 ( .INP(1'b1), .ZN(AX1_2nd[2]) );
  INVX0_LVT U402 ( .INP(1'b1), .ZN(AX1_2nd[3]) );
  INVX0_LVT U404 ( .INP(1'b1), .ZN(AX1_2nd[4]) );
  INVX0_LVT U406 ( .INP(1'b1), .ZN(AX1_2nd[5]) );
  INVX0_LVT U408 ( .INP(1'b1), .ZN(AX1_2nd[6]) );
  INVX0_LVT U410 ( .INP(1'b1), .ZN(AX1_2nd[7]) );
  INVX0_LVT U412 ( .INP(1'b1), .ZN(AX1_2nd[8]) );
  INVX0_LVT U414 ( .INP(1'b1), .ZN(AX1_2nd[9]) );
  INVX0_LVT U416 ( .INP(1'b1), .ZN(AX1_2nd[10]) );
  INVX0_LVT U418 ( .INP(1'b1), .ZN(AX1_2nd[11]) );
  INVX0_LVT U420 ( .INP(1'b1), .ZN(AX1_2nd[12]) );
  INVX0_LVT U422 ( .INP(1'b1), .ZN(AX1_2nd[13]) );
  INVX0_LVT U424 ( .INP(1'b1), .ZN(AX1_2nd[14]) );
  INVX0_LVT U426 ( .INP(1'b1), .ZN(AX1_2nd[15]) );
  INVX0_LVT U428 ( .INP(1'b1), .ZN(AX1_1st[0]) );
  INVX0_LVT U430 ( .INP(1'b1), .ZN(AX1_1st[1]) );
  INVX0_LVT U432 ( .INP(1'b1), .ZN(AX1_1st[2]) );
  INVX0_LVT U434 ( .INP(1'b1), .ZN(AX1_1st[3]) );
  INVX0_LVT U436 ( .INP(1'b1), .ZN(AX1_1st[4]) );
  INVX0_LVT U438 ( .INP(1'b1), .ZN(AX1_1st[5]) );
  INVX0_LVT U440 ( .INP(1'b1), .ZN(AX1_1st[6]) );
  INVX0_LVT U442 ( .INP(1'b1), .ZN(AX1_1st[7]) );
  INVX0_LVT U444 ( .INP(1'b1), .ZN(AX1_1st[8]) );
  INVX0_LVT U446 ( .INP(1'b1), .ZN(AX1_1st[9]) );
  INVX0_LVT U448 ( .INP(1'b1), .ZN(AX1_1st[10]) );
  INVX0_LVT U450 ( .INP(1'b1), .ZN(AX1_1st[11]) );
  INVX0_LVT U452 ( .INP(1'b1), .ZN(AX1_1st[12]) );
  INVX0_LVT U454 ( .INP(1'b1), .ZN(AX1_1st[13]) );
  INVX0_LVT U456 ( .INP(1'b1), .ZN(AX1_1st[14]) );
  INVX0_LVT U458 ( .INP(1'b1), .ZN(AX1_1st[15]) );
  INVX0_LVT U460 ( .INP(1'b1), .ZN(AX0_2nd[0]) );
  INVX0_LVT U462 ( .INP(1'b1), .ZN(AX0_2nd[1]) );
  INVX0_LVT U464 ( .INP(1'b1), .ZN(AX0_2nd[2]) );
  INVX0_LVT U466 ( .INP(1'b1), .ZN(AX0_2nd[3]) );
  INVX0_LVT U468 ( .INP(1'b1), .ZN(AX0_2nd[4]) );
  INVX0_LVT U470 ( .INP(1'b1), .ZN(AX0_2nd[5]) );
  INVX0_LVT U472 ( .INP(1'b1), .ZN(AX0_2nd[6]) );
  INVX0_LVT U474 ( .INP(1'b1), .ZN(AX0_2nd[7]) );
  INVX0_LVT U476 ( .INP(1'b1), .ZN(AX0_2nd[8]) );
  INVX0_LVT U478 ( .INP(1'b1), .ZN(AX0_2nd[9]) );
  INVX0_LVT U480 ( .INP(1'b1), .ZN(AX0_2nd[10]) );
  INVX0_LVT U482 ( .INP(1'b1), .ZN(AX0_2nd[11]) );
  INVX0_LVT U484 ( .INP(1'b1), .ZN(AX0_2nd[12]) );
  INVX0_LVT U486 ( .INP(1'b1), .ZN(AX0_2nd[13]) );
  INVX0_LVT U488 ( .INP(1'b1), .ZN(AX0_2nd[14]) );
  INVX0_LVT U490 ( .INP(1'b1), .ZN(AX0_2nd[15]) );
  INVX0_LVT U492 ( .INP(1'b1), .ZN(AX0_1st[0]) );
  INVX0_LVT U494 ( .INP(1'b1), .ZN(AX0_1st[1]) );
  INVX0_LVT U496 ( .INP(1'b1), .ZN(AX0_1st[2]) );
  INVX0_LVT U498 ( .INP(1'b1), .ZN(AX0_1st[3]) );
  INVX0_LVT U500 ( .INP(1'b1), .ZN(AX0_1st[4]) );
  INVX0_LVT U502 ( .INP(1'b1), .ZN(AX0_1st[5]) );
  INVX0_LVT U504 ( .INP(1'b1), .ZN(AX0_1st[6]) );
  INVX0_LVT U506 ( .INP(1'b1), .ZN(AX0_1st[7]) );
  INVX0_LVT U508 ( .INP(1'b1), .ZN(AX0_1st[8]) );
  INVX0_LVT U510 ( .INP(1'b1), .ZN(AX0_1st[9]) );
  INVX0_LVT U512 ( .INP(1'b1), .ZN(AX0_1st[10]) );
  INVX0_LVT U514 ( .INP(1'b1), .ZN(AX0_1st[11]) );
  INVX0_LVT U516 ( .INP(1'b1), .ZN(AX0_1st[12]) );
  INVX0_LVT U518 ( .INP(1'b1), .ZN(AX0_1st[13]) );
  INVX0_LVT U520 ( .INP(1'b1), .ZN(AX0_1st[14]) );
  INVX0_LVT U522 ( .INP(1'b1), .ZN(AX0_1st[15]) );
  NOR2X1_LVT U524 ( .IN1(PMD2AY_rr), .IN2(en_p2d_rr), .QN(n416) );
  NOR2X0_LVT U525 ( .IN1(alu_Xop_sel[3]), .IN2(alu_Xop_sel[2]), .QN(n407) );
  AND2X1_LVT U526 ( .IN1(alu_Xop_sel[1]), .IN2(n407), .Q(n125) );
  INVX0_LVT U527 ( .INP(n407), .ZN(n408) );
  NOR2X0_LVT U528 ( .IN1(alu_Xop_sel[1]), .IN2(n408), .QN(N74) );
  NOR2X0_LVT U529 ( .IN1(en_AR_2nd), .IN2(en_AR_1st), .QN(n410) );
  NAND2X0_LVT U530 ( .IN1(n410), .IN2(ARtoR_r), .QN(n409) );
  NOR2X0_LVT U531 ( .IN1(MSTAT0), .IN2(n409), .QN(n41) );
  INVX0_LVT U532 ( .INP(MSTAT0), .ZN(n422) );
  NOR2X0_LVT U533 ( .IN1(n422), .IN2(n409), .QN(n42) );
  INVX0_LVT U534 ( .INP(n410), .ZN(AR_forward) );
  AND2X1_LVT U535 ( .IN1(ARtoR_r), .IN2(AR_forward), .Q(n43) );
  NOR2X0_LVT U536 ( .IN1(alu_Xop_sel[3]), .IN2(n428), .QN(n411) );
  NAND2X0_LVT U537 ( .IN1(n411), .IN2(R_in[15]), .QN(n44) );
  MUX21X1_LVT U538 ( .IN1(PMD23_8[15]), .IN2(DMD_no_PMD[15]), .S(n416), .Q(
        AY_in[15]) );
  AND2X1_LVT U539 ( .IN1(n427), .IN2(AY_in[15]), .Q(AY0_in[15]) );
  MUX21X1_LVT U540 ( .IN1(PMD23_8[14]), .IN2(DMD_no_PMD[14]), .S(n416), .Q(
        AY_in[14]) );
  AND2X1_LVT U541 ( .IN1(n427), .IN2(AY_in[14]), .Q(AY0_in[14]) );
  MUX21X1_LVT U542 ( .IN1(PMD23_8[13]), .IN2(DMD_no_PMD[13]), .S(n416), .Q(
        AY_in[13]) );
  AND2X1_LVT U543 ( .IN1(n427), .IN2(AY_in[13]), .Q(AY0_in[13]) );
  MUX21X1_LVT U544 ( .IN1(PMD23_8[12]), .IN2(DMD_no_PMD[12]), .S(n416), .Q(
        AY_in[12]) );
  AND2X1_LVT U545 ( .IN1(n427), .IN2(AY_in[12]), .Q(AY0_in[12]) );
  MUX21X1_LVT U546 ( .IN1(PMD23_8[11]), .IN2(DMD_no_PMD[11]), .S(n416), .Q(
        AY_in[11]) );
  AND2X1_LVT U547 ( .IN1(n427), .IN2(AY_in[11]), .Q(AY0_in[11]) );
  MUX21X1_LVT U548 ( .IN1(PMD23_8[10]), .IN2(DMD_no_PMD[10]), .S(n416), .Q(
        AY_in[10]) );
  AND2X1_LVT U549 ( .IN1(n427), .IN2(AY_in[10]), .Q(AY0_in[10]) );
  MUX21X1_LVT U550 ( .IN1(PMD23_8[9]), .IN2(DMD_no_PMD[9]), .S(n416), .Q(
        AY_in[9]) );
  AND2X1_LVT U551 ( .IN1(n427), .IN2(AY_in[9]), .Q(AY0_in[9]) );
  MUX21X1_LVT U552 ( .IN1(PMD23_8[8]), .IN2(DMD_no_PMD[8]), .S(n416), .Q(
        AY_in[8]) );
  AND2X1_LVT U553 ( .IN1(n427), .IN2(AY_in[8]), .Q(AY0_in[8]) );
  MUX21X1_LVT U554 ( .IN1(PMD23_8[7]), .IN2(DMD_no_PMD[7]), .S(n416), .Q(
        AY_in[7]) );
  AND2X1_LVT U555 ( .IN1(n427), .IN2(AY_in[7]), .Q(AY0_in[7]) );
  MUX21X1_LVT U556 ( .IN1(PMD23_8[6]), .IN2(DMD_no_PMD[6]), .S(n416), .Q(
        AY_in[6]) );
  AND2X1_LVT U557 ( .IN1(n427), .IN2(AY_in[6]), .Q(AY0_in[6]) );
  MUX21X1_LVT U558 ( .IN1(PMD23_8[5]), .IN2(DMD_no_PMD[5]), .S(n416), .Q(
        AY_in[5]) );
  AND2X1_LVT U559 ( .IN1(n427), .IN2(AY_in[5]), .Q(AY0_in[5]) );
  MUX21X1_LVT U560 ( .IN1(PMD23_8[4]), .IN2(DMD_no_PMD[4]), .S(n416), .Q(
        AY_in[4]) );
  AND2X1_LVT U561 ( .IN1(n427), .IN2(AY_in[4]), .Q(AY0_in[4]) );
  MUX21X1_LVT U562 ( .IN1(PMD23_8[3]), .IN2(DMD_no_PMD[3]), .S(n416), .Q(
        AY_in[3]) );
  AND2X1_LVT U563 ( .IN1(n427), .IN2(AY_in[3]), .Q(AY0_in[3]) );
  MUX21X1_LVT U564 ( .IN1(PMD23_8[2]), .IN2(DMD_no_PMD[2]), .S(n416), .Q(
        AY_in[2]) );
  AND2X1_LVT U565 ( .IN1(n427), .IN2(AY_in[2]), .Q(AY0_in[2]) );
  MUX21X1_LVT U566 ( .IN1(PMD23_8[1]), .IN2(DMD_no_PMD[1]), .S(n416), .Q(
        AY_in[1]) );
  AND2X1_LVT U567 ( .IN1(n427), .IN2(AY_in[1]), .Q(AY0_in[1]) );
  NOR2X0_LVT U568 ( .IN1(MSTAT0_R), .IN2(n429), .QN(n418) );
  AND2X1_LVT U569 ( .IN1(MSTAT0_R), .IN2(AR2DMD_rr), .Q(n417) );
  AO22X1_LVT U570 ( .IN1(AR_1st[15]), .IN2(n418), .IN3(AR_2nd[15]), .IN4(n417), 
        .Q(DMD[15]) );
  AND2X1_LVT U571 ( .IN1(n411), .IN2(R_in[14]), .Q(n46) );
  AND2X1_LVT U572 ( .IN1(n411), .IN2(R_in[0]), .Q(n60) );
  AND2X1_LVT U573 ( .IN1(n411), .IN2(R_in[7]), .Q(n53) );
  AND2X1_LVT U574 ( .IN1(n411), .IN2(R_in[12]), .Q(n48) );
  AND2X1_LVT U575 ( .IN1(n411), .IN2(R_in[1]), .Q(n59) );
  AND2X1_LVT U576 ( .IN1(n411), .IN2(R_in[13]), .Q(n47) );
  AND2X1_LVT U577 ( .IN1(n411), .IN2(R_in[11]), .Q(n49) );
  AND2X1_LVT U578 ( .IN1(n411), .IN2(R_in[6]), .Q(n54) );
  AND2X1_LVT U579 ( .IN1(n411), .IN2(R_in[5]), .Q(n55) );
  AND2X1_LVT U580 ( .IN1(n411), .IN2(R_in[8]), .Q(n52) );
  AND2X1_LVT U581 ( .IN1(n411), .IN2(R_in[10]), .Q(n50) );
  AND2X1_LVT U582 ( .IN1(n411), .IN2(R_in[3]), .Q(n57) );
  AND2X1_LVT U583 ( .IN1(n411), .IN2(R_in[9]), .Q(n51) );
  AND2X1_LVT U584 ( .IN1(n411), .IN2(R_in[4]), .Q(n56) );
  AND2X1_LVT U585 ( .IN1(n411), .IN2(R_in[2]), .Q(n58) );
  NAND2X1_LVT U586 ( .IN1(en_AF_2nd), .IN2(n406), .QN(n412) );
  MUX21X1_LVT U587 ( .IN1(n33), .IN2(AF_2nd[0]), .S(n412), .Q(n124) );
  NAND2X1_LVT U588 ( .IN1(en_AF_1st), .IN2(n406), .QN(n413) );
  MUX21X1_LVT U589 ( .IN1(n33), .IN2(AF_1st[0]), .S(n413), .Q(n123) );
  MUX21X1_LVT U590 ( .IN1(n30), .IN2(AF_1st[1]), .S(n413), .Q(n122) );
  MUX21X1_LVT U591 ( .IN1(n30), .IN2(AF_2nd[1]), .S(n412), .Q(n121) );
  MUX21X1_LVT U592 ( .IN1(n29), .IN2(AF_1st[2]), .S(n413), .Q(n120) );
  MUX21X1_LVT U593 ( .IN1(n29), .IN2(AF_2nd[2]), .S(n412), .Q(n119) );
  MUX21X1_LVT U594 ( .IN1(n28), .IN2(AF_1st[3]), .S(n413), .Q(n118) );
  MUX21X1_LVT U595 ( .IN1(n28), .IN2(AF_2nd[3]), .S(n412), .Q(n117) );
  MUX21X1_LVT U596 ( .IN1(n27), .IN2(AF_1st[4]), .S(n413), .Q(n116) );
  MUX21X1_LVT U597 ( .IN1(n27), .IN2(AF_2nd[4]), .S(n412), .Q(n115) );
  MUX21X1_LVT U598 ( .IN1(n26), .IN2(AF_1st[5]), .S(n413), .Q(n114) );
  MUX21X1_LVT U599 ( .IN1(n26), .IN2(AF_2nd[5]), .S(n412), .Q(n113) );
  MUX21X1_LVT U600 ( .IN1(n25), .IN2(AF_1st[6]), .S(n413), .Q(n112) );
  MUX21X1_LVT U601 ( .IN1(n25), .IN2(AF_2nd[6]), .S(n412), .Q(n111) );
  MUX21X1_LVT U602 ( .IN1(n24), .IN2(AF_1st[7]), .S(n413), .Q(n110) );
  MUX21X1_LVT U603 ( .IN1(n24), .IN2(AF_2nd[7]), .S(n412), .Q(n109) );
  MUX21X1_LVT U604 ( .IN1(n23), .IN2(AF_1st[8]), .S(n413), .Q(n108) );
  MUX21X1_LVT U605 ( .IN1(n23), .IN2(AF_2nd[8]), .S(n412), .Q(n107) );
  MUX21X1_LVT U606 ( .IN1(n22), .IN2(AF_1st[9]), .S(n413), .Q(n106) );
  MUX21X1_LVT U607 ( .IN1(n22), .IN2(AF_2nd[9]), .S(n412), .Q(n105) );
  MUX21X1_LVT U608 ( .IN1(n21), .IN2(AF_1st[10]), .S(n413), .Q(n104) );
  MUX21X1_LVT U609 ( .IN1(n21), .IN2(AF_2nd[10]), .S(n412), .Q(n103) );
  MUX21X1_LVT U610 ( .IN1(n20), .IN2(AF_1st[11]), .S(n413), .Q(n102) );
  MUX21X1_LVT U611 ( .IN1(n20), .IN2(AF_2nd[11]), .S(n412), .Q(n101) );
  MUX21X1_LVT U612 ( .IN1(n19), .IN2(AF_1st[12]), .S(n413), .Q(n100) );
  MUX21X1_LVT U613 ( .IN1(n19), .IN2(AF_2nd[12]), .S(n412), .Q(n99) );
  MUX21X1_LVT U614 ( .IN1(n18), .IN2(AF_1st[13]), .S(n413), .Q(n98) );
  MUX21X1_LVT U615 ( .IN1(n18), .IN2(AF_2nd[13]), .S(n412), .Q(n97) );
  MUX21X1_LVT U616 ( .IN1(n17), .IN2(AF_1st[14]), .S(n413), .Q(n96) );
  MUX21X1_LVT U617 ( .IN1(n17), .IN2(AF_2nd[14]), .S(n412), .Q(n95) );
  MUX21X1_LVT U618 ( .IN1(n16), .IN2(AF_2nd[15]), .S(n412), .Q(n93) );
  MUX21X1_LVT U619 ( .IN1(n16), .IN2(AF_1st[15]), .S(n413), .Q(n94) );
  AND2X1_LVT U620 ( .IN1(ARtoR), .IN2(load_AR_r), .Q(N166) );
  NAND2X1_LVT U621 ( .IN1(en_AR_1st), .IN2(n406), .QN(n414) );
  MUX21X1_LVT U622 ( .IN1(AR_in[15]), .IN2(AR_1st[15]), .S(n414), .Q(n92) );
  MUX21X1_LVT U623 ( .IN1(AR_in[14]), .IN2(AR_1st[14]), .S(n414), .Q(n91) );
  MUX21X1_LVT U624 ( .IN1(AR_in[13]), .IN2(AR_1st[13]), .S(n414), .Q(n90) );
  MUX21X1_LVT U625 ( .IN1(AR_in[12]), .IN2(AR_1st[12]), .S(n414), .Q(n89) );
  MUX21X1_LVT U626 ( .IN1(AR_in[11]), .IN2(AR_1st[11]), .S(n414), .Q(n88) );
  MUX21X1_LVT U627 ( .IN1(AR_in[10]), .IN2(AR_1st[10]), .S(n414), .Q(n87) );
  MUX21X1_LVT U628 ( .IN1(AR_in[9]), .IN2(AR_1st[9]), .S(n414), .Q(n86) );
  MUX21X1_LVT U629 ( .IN1(AR_in[8]), .IN2(AR_1st[8]), .S(n414), .Q(n85) );
  MUX21X1_LVT U630 ( .IN1(AR_in[7]), .IN2(AR_1st[7]), .S(n414), .Q(n84) );
  MUX21X1_LVT U631 ( .IN1(AR_in[6]), .IN2(AR_1st[6]), .S(n414), .Q(n83) );
  MUX21X1_LVT U632 ( .IN1(AR_in[5]), .IN2(AR_1st[5]), .S(n414), .Q(n82) );
  MUX21X1_LVT U633 ( .IN1(AR_in[4]), .IN2(AR_1st[4]), .S(n414), .Q(n81) );
  MUX21X1_LVT U634 ( .IN1(AR_in[3]), .IN2(AR_1st[3]), .S(n414), .Q(n80) );
  MUX21X1_LVT U635 ( .IN1(AR_in[2]), .IN2(AR_1st[2]), .S(n414), .Q(n79) );
  MUX21X1_LVT U636 ( .IN1(AR_in[1]), .IN2(AR_1st[1]), .S(n414), .Q(n78) );
  MUX21X1_LVT U637 ( .IN1(AR_in[0]), .IN2(AR_1st[0]), .S(n414), .Q(n77) );
  NAND2X1_LVT U638 ( .IN1(en_AR_2nd), .IN2(n406), .QN(n415) );
  MUX21X1_LVT U639 ( .IN1(AR_in[15]), .IN2(AR_2nd[15]), .S(n415), .Q(n76) );
  MUX21X1_LVT U640 ( .IN1(AR_in[14]), .IN2(AR_2nd[14]), .S(n415), .Q(n75) );
  MUX21X1_LVT U641 ( .IN1(AR_in[13]), .IN2(AR_2nd[13]), .S(n415), .Q(n74) );
  MUX21X1_LVT U642 ( .IN1(AR_in[12]), .IN2(AR_2nd[12]), .S(n415), .Q(n73) );
  MUX21X1_LVT U643 ( .IN1(AR_in[11]), .IN2(AR_2nd[11]), .S(n415), .Q(n72) );
  MUX21X1_LVT U644 ( .IN1(AR_in[10]), .IN2(AR_2nd[10]), .S(n415), .Q(n71) );
  MUX21X1_LVT U645 ( .IN1(AR_in[9]), .IN2(AR_2nd[9]), .S(n415), .Q(n70) );
  MUX21X1_LVT U646 ( .IN1(AR_in[8]), .IN2(AR_2nd[8]), .S(n415), .Q(n69) );
  MUX21X1_LVT U647 ( .IN1(AR_in[7]), .IN2(AR_2nd[7]), .S(n415), .Q(n68) );
  MUX21X1_LVT U648 ( .IN1(AR_in[6]), .IN2(AR_2nd[6]), .S(n415), .Q(n67) );
  MUX21X1_LVT U649 ( .IN1(AR_in[5]), .IN2(AR_2nd[5]), .S(n415), .Q(n66) );
  MUX21X1_LVT U650 ( .IN1(AR_in[4]), .IN2(AR_2nd[4]), .S(n415), .Q(n65) );
  MUX21X1_LVT U651 ( .IN1(AR_in[3]), .IN2(AR_2nd[3]), .S(n415), .Q(n64) );
  MUX21X1_LVT U652 ( .IN1(AR_in[2]), .IN2(AR_2nd[2]), .S(n415), .Q(n63) );
  MUX21X1_LVT U653 ( .IN1(AR_in[1]), .IN2(AR_2nd[1]), .S(n415), .Q(n62) );
  MUX21X1_LVT U654 ( .IN1(AR_in[0]), .IN2(AR_2nd[0]), .S(n415), .Q(n61) );
  MUX21X1_LVT U655 ( .IN1(PMD23_8[0]), .IN2(DMD_no_PMD[0]), .S(n416), .Q(
        AY_in[0]) );
  AO22X1_LVT U656 ( .IN1(n418), .IN2(AR_1st[14]), .IN3(n417), .IN4(AR_2nd[14]), 
        .Q(DMD[14]) );
  AO22X1_LVT U657 ( .IN1(n418), .IN2(AR_1st[13]), .IN3(n417), .IN4(AR_2nd[13]), 
        .Q(DMD[13]) );
  AO22X1_LVT U658 ( .IN1(n418), .IN2(AR_1st[12]), .IN3(n417), .IN4(AR_2nd[12]), 
        .Q(DMD[12]) );
  AO22X1_LVT U659 ( .IN1(n418), .IN2(AR_1st[11]), .IN3(n417), .IN4(AR_2nd[11]), 
        .Q(DMD[11]) );
  AO22X1_LVT U660 ( .IN1(n418), .IN2(AR_1st[10]), .IN3(n417), .IN4(AR_2nd[10]), 
        .Q(DMD[10]) );
  AO22X1_LVT U661 ( .IN1(n418), .IN2(AR_1st[9]), .IN3(n417), .IN4(AR_2nd[9]), 
        .Q(DMD[9]) );
  AO22X1_LVT U662 ( .IN1(n418), .IN2(AR_1st[8]), .IN3(n417), .IN4(AR_2nd[8]), 
        .Q(DMD[8]) );
  AO22X1_LVT U663 ( .IN1(n418), .IN2(AR_1st[7]), .IN3(n417), .IN4(AR_2nd[7]), 
        .Q(DMD[7]) );
  AO22X1_LVT U664 ( .IN1(n418), .IN2(AR_1st[6]), .IN3(n417), .IN4(AR_2nd[6]), 
        .Q(DMD[6]) );
  AO22X1_LVT U665 ( .IN1(n418), .IN2(AR_1st[5]), .IN3(n417), .IN4(AR_2nd[5]), 
        .Q(DMD[5]) );
  AO22X1_LVT U666 ( .IN1(n418), .IN2(AR_1st[4]), .IN3(n417), .IN4(AR_2nd[4]), 
        .Q(DMD[4]) );
  AO22X1_LVT U667 ( .IN1(n418), .IN2(AR_1st[3]), .IN3(n417), .IN4(AR_2nd[3]), 
        .Q(DMD[3]) );
  AO22X1_LVT U668 ( .IN1(n418), .IN2(AR_1st[2]), .IN3(n417), .IN4(AR_2nd[2]), 
        .Q(DMD[2]) );
  AO22X1_LVT U669 ( .IN1(n418), .IN2(AR_1st[1]), .IN3(n417), .IN4(AR_2nd[1]), 
        .Q(DMD[1]) );
  AO22X1_LVT U670 ( .IN1(n418), .IN2(AR_1st[0]), .IN3(n417), .IN4(AR_2nd[0]), 
        .Q(DMD[0]) );
  NOR2X0_LVT U671 ( .IN1(en_AF_2nd), .IN2(en_AF_1st), .QN(n420) );
  NAND2X0_LVT U672 ( .IN1(sel_Yop_r[0]), .IN2(n430), .QN(n419) );
  NOR2X0_LVT U673 ( .IN1(n420), .IN2(n419), .QN(n426) );
  NOR3X0_LVT U674 ( .IN1(en_AF_2nd), .IN2(sel_Yop_r[1]), .IN3(en_AF_1st), .QN(
        n421) );
  NAND2X0_LVT U675 ( .IN1(sel_Yop_r[0]), .IN2(n421), .QN(n423) );
  NOR2X0_LVT U676 ( .IN1(MSTAT0), .IN2(n423), .QN(n425) );
  NOR2X0_LVT U677 ( .IN1(n423), .IN2(n422), .QN(n424) );
  AOI222X1_LVT U678 ( .IN1(n33), .IN2(n426), .IN3(AF_1st[0]), .IN4(n425), 
        .IN5(AF_2nd[0]), .IN6(n424), .QN(n141) );
  AOI222X1_LVT U679 ( .IN1(n426), .IN2(n30), .IN3(n425), .IN4(AF_1st[1]), 
        .IN5(n424), .IN6(AF_2nd[1]), .QN(n140) );
  AOI222X1_LVT U680 ( .IN1(n426), .IN2(n29), .IN3(n425), .IN4(AF_1st[2]), 
        .IN5(n424), .IN6(AF_2nd[2]), .QN(n139) );
  AOI222X1_LVT U681 ( .IN1(n426), .IN2(n28), .IN3(n425), .IN4(AF_1st[3]), 
        .IN5(n424), .IN6(AF_2nd[3]), .QN(n138) );
  AOI222X1_LVT U682 ( .IN1(n426), .IN2(n27), .IN3(n425), .IN4(AF_1st[4]), 
        .IN5(n424), .IN6(AF_2nd[4]), .QN(n137) );
  AOI222X1_LVT U683 ( .IN1(n426), .IN2(n26), .IN3(n425), .IN4(AF_1st[5]), 
        .IN5(n424), .IN6(AF_2nd[5]), .QN(n136) );
  AOI222X1_LVT U684 ( .IN1(n426), .IN2(n25), .IN3(n425), .IN4(AF_1st[6]), 
        .IN5(n424), .IN6(AF_2nd[6]), .QN(n135) );
  AOI222X1_LVT U685 ( .IN1(n426), .IN2(n24), .IN3(n425), .IN4(AF_1st[7]), 
        .IN5(n424), .IN6(AF_2nd[7]), .QN(n134) );
  AOI222X1_LVT U686 ( .IN1(n426), .IN2(n23), .IN3(n425), .IN4(AF_1st[8]), 
        .IN5(n424), .IN6(AF_2nd[8]), .QN(n133) );
  AOI222X1_LVT U687 ( .IN1(n426), .IN2(n22), .IN3(n425), .IN4(AF_1st[9]), 
        .IN5(n424), .IN6(AF_2nd[9]), .QN(n132) );
  AOI222X1_LVT U688 ( .IN1(n426), .IN2(n21), .IN3(n425), .IN4(AF_1st[10]), 
        .IN5(n424), .IN6(AF_2nd[10]), .QN(n131) );
  AOI222X1_LVT U689 ( .IN1(n426), .IN2(n20), .IN3(n425), .IN4(AF_1st[11]), 
        .IN5(n424), .IN6(AF_2nd[11]), .QN(n130) );
  AOI222X1_LVT U690 ( .IN1(n426), .IN2(n19), .IN3(n425), .IN4(AF_1st[12]), 
        .IN5(n424), .IN6(AF_2nd[12]), .QN(n129) );
  AOI222X1_LVT U691 ( .IN1(n426), .IN2(n18), .IN3(n425), .IN4(AF_1st[13]), 
        .IN5(n424), .IN6(AF_2nd[13]), .QN(n128) );
  AOI222X1_LVT U692 ( .IN1(n426), .IN2(n17), .IN3(n425), .IN4(AF_1st[14]), 
        .IN5(n424), .IN6(AF_2nd[14]), .QN(n127) );
  AOI222X1_LVT U693 ( .IN1(n426), .IN2(n16), .IN3(n425), .IN4(AF_1st[15]), 
        .IN5(n424), .IN6(AF_2nd[15]), .QN(n126) );
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
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62;
  tri   ASTAT4_in;
  tri   CI_in;
  tri   is_div;
  tri   is_logic_func;
  tri   inv_Xop;
  tri   inv_Yop;
  tri   DIVS;

  NAND2X0_LVT U1 ( .IN1(IR[16]), .IN2(IR[15]), .QN(n59) );
  INVX0_LVT U2 ( .INP(IR[12]), .ZN(n53) );
  NOR2X0_LVT U3 ( .IN1(IR[11]), .IN2(n53), .QN(n13) );
  NOR2X0_LVT U4 ( .IN1(IR[13]), .IN2(n13), .QN(n2) );
  NOR3X0_LVT U5 ( .IN1(IR[21]), .IN2(IR[22]), .IN3(IR[23]), .QN(n14) );
  INVX0_LVT U6 ( .INP(IR[14]), .ZN(n45) );
  NOR4X0_LVT U7 ( .IN1(IR[20]), .IN2(IR[19]), .IN3(n45), .IN4(n59), .QN(n1) );
  NAND4X0_LVT U8 ( .IN1(IR[17]), .IN2(n14), .IN3(IR[18]), .IN4(n1), .QN(n52)
         );
  NOR2X0_LVT U9 ( .IN1(n2), .IN2(n52), .QN(is_div) );
  NAND2X0_LVT U10 ( .IN1(IR[17]), .IN2(IR[18]), .QN(n7) );
  NOR2X0_LVT U11 ( .IN1(IR[22]), .IN2(IR[23]), .QN(n3) );
  INVX0_LVT U12 ( .INP(IR[20]), .ZN(n17) );
  NAND3X0_LVT U13 ( .IN1(n3), .IN2(IR[21]), .IN3(n17), .QN(n34) );
  NOR2X0_LVT U14 ( .IN1(IR[19]), .IN2(cond_fit), .QN(n6) );
  NOR2X0_LVT U15 ( .IN1(IR[21]), .IN2(IR[20]), .QN(n4) );
  NOR2X0_LVT U16 ( .IN1(n4), .IN2(IR[23]), .QN(n5) );
  NAND2X0_LVT U17 ( .IN1(IR[22]), .IN2(n5), .QN(n28) );
  OA21X1_LVT U18 ( .IN1(n34), .IN2(n6), .IN3(n28), .Q(n38) );
  NOR2X0_LVT U19 ( .IN1(n7), .IN2(n38), .QN(n8) );
  NOR2X0_LVT U20 ( .IN1(n8), .IN2(is_div), .QN(n9) );
  INVX0_LVT U21 ( .INP(MSTAT0), .ZN(n26) );
  NOR2X0_LVT U22 ( .IN1(n9), .IN2(n26), .QN(en_AF_2nd) );
  NOR2X0_LVT U23 ( .IN1(MSTAT0), .IN2(n9), .QN(en_AF_1st) );
  INVX0_LVT U24 ( .INP(IR[19]), .ZN(n35) );
  NOR2X0_LVT U25 ( .IN1(IR[19]), .IN2(IR[18]), .QN(n11) );
  OR2X1_LVT U26 ( .IN1(IR[17]), .IN2(IR[16]), .Q(n10) );
  NAND4X0_LVT U27 ( .IN1(IR[20]), .IN2(n14), .IN3(n11), .IN4(n10), .QN(n29) );
  INVX0_LVT U28 ( .INP(IR[15]), .ZN(n62) );
  NAND2X0_LVT U29 ( .IN1(n11), .IN2(n62), .QN(n18) );
  NAND4X0_LVT U30 ( .IN1(IR[14]), .IN2(IR[13]), .IN3(IR[16]), .IN4(IR[15]), 
        .QN(n41) );
  NOR2X0_LVT U31 ( .IN1(IR[10]), .IN2(n41), .QN(n12) );
  NAND4X0_LVT U32 ( .IN1(n13), .IN2(IR[19]), .IN3(IR[18]), .IN4(n12), .QN(n16)
         );
  INVX0_LVT U33 ( .INP(n14), .ZN(n15) );
  AO221X1_LVT U34 ( .IN1(IR[20]), .IN2(n18), .IN3(n17), .IN4(n16), .IN5(n15), 
        .Q(n19) );
  OA22X1_LVT U35 ( .IN1(IR[15]), .IN2(n29), .IN3(IR[17]), .IN4(n19), .Q(n20)
         );
  OA221X1_LVT U36 ( .IN1(IR[19]), .IN2(n28), .IN3(n35), .IN4(n34), .IN5(n20), 
        .Q(n23) );
  NOR2X0_LVT U37 ( .IN1(IR[6]), .IN2(IR[4]), .QN(n21) );
  NAND3X0_LVT U38 ( .IN1(IR[5]), .IN2(IR[7]), .IN3(n21), .QN(n31) );
  NOR2X0_LVT U39 ( .IN1(IR[2]), .IN2(IR[0]), .QN(n22) );
  NAND3X0_LVT U40 ( .IN1(IR[3]), .IN2(IR[1]), .IN3(n22), .QN(n30) );
  OAI21X1_LVT U41 ( .IN1(n23), .IN2(n31), .IN3(n30), .QN(load_AR) );
  NAND2X0_LVT U42 ( .IN1(IR[22]), .IN2(IR[23]), .QN(n47) );
  INVX0_LVT U43 ( .INP(n47), .ZN(n39) );
  NOR2X0_LVT U44 ( .IN1(n38), .IN2(IR[18]), .QN(n24) );
  OA21X1_LVT U45 ( .IN1(n39), .IN2(n24), .IN3(IR[17]), .Q(n25) );
  NOR2X0_LVT U46 ( .IN1(n25), .IN2(load_AR), .QN(n27) );
  NOR2X0_LVT U47 ( .IN1(n27), .IN2(MSTAT0), .QN(en_AR_1st) );
  NOR2X0_LVT U48 ( .IN1(n27), .IN2(n26), .QN(en_AR_2nd) );
  OA22X1_LVT U49 ( .IN1(n62), .IN2(n29), .IN3(n35), .IN4(n28), .Q(n32) );
  OAI21X1_LVT U50 ( .IN1(n32), .IN2(n31), .IN3(n30), .QN(AR2DMD) );
  NAND2X0_LVT U51 ( .IN1(IR[11]), .IN2(IR[12]), .QN(n37) );
  INVX0_LVT U52 ( .INP(IR[16]), .ZN(n33) );
  INVX0_LVT U53 ( .INP(IR[13]), .ZN(n54) );
  AO21X1_LVT U54 ( .IN1(n45), .IN2(n62), .IN3(n54), .Q(n57) );
  AO221X1_LVT U55 ( .IN1(IR[16]), .IN2(IR[15]), .IN3(n33), .IN4(IR[14]), .IN5(
        n57), .Q(n48) );
  INVX0_LVT U56 ( .INP(n34), .ZN(n36) );
  NAND4X0_LVT U57 ( .IN1(IR[17]), .IN2(IR[4]), .IN3(n36), .IN4(n35), .QN(n49)
         );
  NAND3X0_LVT U58 ( .IN1(n37), .IN2(n48), .IN3(n49), .QN(sel_Yop[1]) );
  INVX0_LVT U59 ( .INP(n38), .ZN(n40) );
  NOR2X0_LVT U60 ( .IN1(n40), .IN2(n39), .QN(n43) );
  INVX0_LVT U61 ( .INP(n41), .ZN(n56) );
  NAND2X0_LVT U62 ( .IN1(IR[17]), .IN2(n56), .QN(n42) );
  NOR2X0_LVT U63 ( .IN1(n43), .IN2(n42), .QN(update_AS) );
  INVX0_LVT U64 ( .INP(IR[9]), .ZN(n44) );
  NOR3X0_LVT U65 ( .IN1(IR[10]), .IN2(IR[8]), .IN3(n44), .QN(ARtoR) );
  NOR2X0_LVT U66 ( .IN1(n54), .IN2(n52), .QN(DIVS) );
  NOR2X0_LVT U67 ( .IN1(IR[16]), .IN2(n62), .QN(inv_Yop) );
  NOR2X0_LVT U68 ( .IN1(n45), .IN2(n54), .QN(n60) );
  OA21X1_LVT U69 ( .IN1(IR[16]), .IN2(n54), .IN3(n59), .Q(n46) );
  AO22X1_LVT U70 ( .IN1(inv_Yop), .IN2(n60), .IN3(n46), .IN4(n45), .Q(
        sel_Xop[1]) );
  OR2X1_LVT U71 ( .IN1(IR[10]), .IN2(IR[9]), .Q(sel_Xop[0]) );
  NOR2X0_LVT U72 ( .IN1(IR[21]), .IN2(n47), .QN(PMD2AY) );
  INVX0_LVT U73 ( .INP(n48), .ZN(n50) );
  OA21X1_LVT U74 ( .IN1(IR[12]), .IN2(n50), .IN3(n49), .Q(sel_Yop[0]) );
  NAND3X0_LVT U75 ( .IN1(IR[14]), .IN2(ASTAT3), .IN3(n59), .QN(n51) );
  NAND2X0_LVT U76 ( .IN1(n54), .IN2(n51), .QN(n58) );
  NOR4X0_LVT U77 ( .IN1(IR[11]), .IN2(ASTAT5), .IN3(n53), .IN4(n52), .QN(n55)
         );
  AO22X1_LVT U78 ( .IN1(ASTAT4_in), .IN2(n56), .IN3(n55), .IN4(n54), .Q(n61)
         );
  AO221X1_LVT U79 ( .IN1(n58), .IN2(inv_Yop), .IN3(n58), .IN4(n57), .IN5(n61), 
        .Q(CI_in) );
  NOR2X0_LVT U80 ( .IN1(n60), .IN2(n59), .QN(is_logic_func) );
  AO21X1_LVT U81 ( .IN1(IR[16]), .IN2(n62), .IN3(n61), .Q(inv_Xop) );
endmodule

