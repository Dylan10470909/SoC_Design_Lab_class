`include "/home/111-2/VLSI/C108110249/DESIGN/RTL/mid/aluctrl.v"
`include "/home/111-2/VLSI/C108110249/DESIGN/RTL/mid/alufunc.v"
`include "/home/111-2/VLSI/C108110249/DESIGN/RTL/mid/constgen.v"
`timescale 1ns / 100ps

module alu(clk, reset_, cond_fit, ASTAT5, ASTAT3, MSTAT3, MSTAT0, IR, PMD23_8, 
           DMD, DMD_in, R, R_in,
           ASTAT5_in, ASTAT4_in, ASTAT3_in, ASTAT2_in, ASTAT1_in, ASTAT0_in, 
           update_AQ, update_AS, update_ASTAT0_3, AX0_1st, AX0_2nd, AX1_1st, AX1_2nd, AY0_1st, AY0_2nd, AY1_1st, AY1_2nd, AR_1st, AR_2nd, AF_1st, AF_2nd );

input clk, reset_, cond_fit, ASTAT5, ASTAT3, MSTAT3, MSTAT0 ;
input [23:0] IR;
input [15:0] PMD23_8;

output [15:0] DMD, R; 
input  [15:0] DMD_in ;
input  [15:0] R_in ;

output ASTAT5_in, ASTAT4_in, ASTAT3_in, ASTAT2_in, ASTAT1_in, ASTAT0_in;
output update_AQ, update_AS, update_ASTAT0_3;
output [15:0] AX0_1st, AX0_2nd, AX1_1st, AX1_2nd, AY0_1st, AY0_2nd, AY1_1st, AY1_2nd, AR_1st, AR_2nd, AF_1st, AF_2nd  ;

wire  [15:0] DMD, R;

reg [15:0] AX1_1st, AX0_1st, AX1_2nd, AX0_2nd;
reg [15:0] alu_Xop, alu_Yop;
reg [15:0] AY1_1st, AY0_1st, AY1_2nd, AY0_2nd;
reg [15:0] AF_1st, AF_2nd;
reg [15:0] AR_1st, AR_2nd;

wire load_AX1_1st, load_AX0_1st, load_AX1_2nd, load_AX0_2nd;
wire load_AY1_1st, load_AY1_2nd, en_AY0_1st, en_AY0_2nd;
wire PMD2AY, en_AF_1st, en_AF_2nd, DIVS;
wire CI_in, is_div, is_logic_func, inv_Xop, inv_Yop;
wire load_AR, en_AR_1st, en_AR_2nd;
wire ARtoR, AR2DMD, sel_AX0, AXx2DMD, sel_AY0, AYx2DMD;
wire Q_in;
wire [1:0] sel_Xop, sel_Yop;
wire [15:0] AX1, AX0, AX;
wire [15:0] AY_in, AY0_in, AY1, AY0, AY, constYop;
wire [15:0] AF_in, AF, alu_R;
wire [15:0] AR_in, AR;
wire [15:0] AXx, AYx;

always @(posedge clk or negedge reset_) begin
  if (!reset_)           AX1_1st <= #1 16'b0;
  else if (load_AX1_1st) AX1_1st <= #1 DMD_in;
end

always @(posedge clk or negedge reset_) begin
  if (!reset_)           AX0_1st <= #1 16'b0;
  else if (load_AX0_1st) AX0_1st <= #1 DMD_in;
end

always @(posedge clk or negedge reset_) begin
  if (!reset_)           AX1_2nd <= #1 16'b0;
  else if (load_AX1_2nd) AX1_2nd <= #1 DMD_in;
end

always @(posedge clk or negedge reset_) begin
  if (!reset_)           AX0_2nd <= #1 16'b0;
  else if (load_AX0_2nd) AX0_2nd <= #1 DMD_in ;
end

assign AX1 = MSTAT0 ? AX1_2nd : AX1_1st;

assign AX0 = MSTAT0 ? AX0_2nd : AX0_1st;

assign AX = IR[8] ? AX1 : AX0;

always @(AX or R_in or sel_Xop or DIVS)
  begin
    casex ({sel_Xop,DIVS})
      3'b000 : alu_Xop <= AX;
      3'b010 : alu_Xop <= R_in ;
      3'b1x0 : alu_Xop <= 16'b0 ;
      3'bx01 : alu_Xop <= {AX[15],15'b0};
      3'bx11 : alu_Xop <= {R_in[15],15'b0} ;
    endcase 
  end  

assign AY_in = PMD2AY ? PMD23_8 : DMD_in;

assign AY0_in = is_div ? {AY0[14:0], Q_in} : AY_in;

always @(posedge clk or negedge reset_) begin
  if (!reset_)           AY1_1st <= #1 16'b0;
  else if (load_AY1_1st) AY1_1st <= #1 AY_in;
end

always @(posedge clk or negedge reset_) begin
  if (!reset_)          AY0_1st <= #1 16'b0;
  else if (en_AY0_1st)  AY0_1st <= #1 AY0_in ;
end

always @(posedge clk or negedge reset_) begin
  if (!reset_)           AY1_2nd <= #1 16'b0;
  else if (load_AY1_2nd) AY1_2nd <= #1 AY_in;
end

always @(posedge clk or negedge reset_) begin
  if (!reset_)          AY0_2nd <= #1 16'b0;
  else if (en_AY0_2nd)  AY0_2nd <= #1 AY0_in;
end

assign AY1 = MSTAT0 ? AY1_2nd : AY1_1st;

assign AY0 = MSTAT0 ? AY0_2nd : AY0_1st;

assign AY = IR[11] ? AY1 : AY0;

always @(AY or AF or constYop or sel_Yop)
  begin
    case (sel_Yop)  
      2'b00: alu_Yop <= AY;
      2'b01: alu_Yop <= AF;
      2'b10: alu_Yop <= constYop;
      2'b11: alu_Yop <= 16'b0;
    endcase
  end

assign AF_in = is_div ? {alu_R[14:0], AY0[15]} : alu_R;

always @(posedge clk or negedge reset_) begin
  if (!reset_)          AF_1st <= #1 16'b0;
  else if (en_AF_1st)   AF_1st <= #1 AF_in;
end

always @(posedge clk or negedge reset_) begin
  if (!reset_)          AF_2nd <= #1 16'b0;
  else if (en_AF_2nd)   AF_2nd <= #1 AF_in;
end

assign AF = MSTAT0 ? AF_2nd : AF_1st;

assign AR_in = load_AR ? DMD_in   : alu_R;

always @(posedge clk or negedge reset_) begin
  if (!reset_)          AR_1st <= #1 16'b0;
  else if (en_AR_1st)   AR_1st <= #1 AR_in;
end

always @(posedge clk or negedge reset_) begin
  if (!reset_)          AR_2nd <= #1 16'b0;
  else if (en_AR_2nd)   AR_2nd <= #1 AR_in;
end


assign AR = MSTAT0 ? AR_2nd : AR_1st;

assign R = {16{ARtoR}} & AR ;

assign AXx = sel_AX0 ? AX0 : AX1;

assign AYx = sel_AY0 ? AY0 : AY1;

assign DMD = ({16{AYx2DMD}} & AYx) | ({16{AXx2DMD}} & AXx) | ({16{AR2DMD}} & AR) ;
      
constgen U_CONSTGEN(IR[12:11], IR[7:6], IR[5], constYop);

aluctrl aluctrl(cond_fit, ASTAT5, ASTAT3, ASTAT4_in, MSTAT0, IR, 
                load_AX1_1st, load_AX0_1st, load_AX1_2nd, load_AX0_2nd, sel_Xop,
                load_AY1_1st, load_AY1_2nd, en_AY0_1st, en_AY0_2nd, sel_Yop,
                PMD2AY, en_AF_1st, en_AF_2nd, DIVS, 
                CI_in, is_div, is_logic_func, inv_Xop, inv_Yop, 
                load_AR, en_AR_1st, en_AR_2nd, 
                ARtoR, AR2DMD, sel_AX0, AXx2DMD, sel_AY0, AYx2DMD,
                update_AS, update_ASTAT0_3);

alufunc U_calufunc(MSTAT3, CI_in, is_div, is_logic_func, inv_Xop, inv_Yop, 
                DIVS, IR[14:13], alu_Xop, alu_Yop, alu_R, 
                ASTAT5_in, ASTAT4_in, ASTAT3_in, ASTAT2_in, ASTAT1_in, ASTAT0_in,
                Q_in);     

endmodule
