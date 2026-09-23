
`timescale 1ns / 100ps

module alu(clk33, reset_, cond_fit, ASTAT5, ASTAT3, 
	   MSTAT3_R, MSTAT0, MSTAT0_R, IR, PMD23_8, 
           DMD, DMD_in, R, R_in, 
           ASTAT5_in, ASTAT4_in, ASTAT3_in, ASTAT2_in, ASTAT1_in, ASTAT0_in, 
           update_AQ, update_AS, update_ASTAT0_3, iomem_rd, iomem_wr_, BUSY_in,
           AX0_1st, AX0_2nd, AX1_1st, AX1_2nd, 
	   AY0_1st, AY0_2nd, AY1_1st, AY1_2nd, 
	   AR_1st, AR_2nd, AF_1st, AF_2nd,
	   MEM_AR_Rin, bp_AR, alu_R,
	   en_p2d_rr, DMD_no_PMD, AY0_in, AY_in, AR_in,

	   AX0_forward, AX1_forward, AY0_forward, AY1_forward, AR_forward
	  );

output [15:0] AY0_in, AY_in, AR_in ;
output AX0_forward, AX1_forward, AY0_forward, AY1_forward, AR_forward;
input  en_p2d_rr;
output MEM_AR_Rin, bp_AR;
output [15:0] alu_R;

input clk33, reset_,cond_fit, ASTAT5, ASTAT3, MSTAT3_R, MSTAT0, MSTAT0_R;
input [23:0] IR;
input [15:0] PMD23_8;
input iomem_rd, iomem_wr_, BUSY_in ;

output [15:0] DMD, R; 
input  [15:0] DMD_in, DMD_no_PMD;
input  [15:0] R_in ;

output ASTAT5_in, ASTAT4_in, ASTAT3_in, ASTAT2_in, ASTAT1_in, ASTAT0_in;
output update_AQ, update_AS, update_ASTAT0_3;
output [15:0] AX0_1st, AX0_2nd, AX1_1st, AX1_2nd,AY0_1st, AY0_2nd, AY1_1st, AY1_2nd, AR_1st, AR_2nd, AF_1st, AF_2nd  ;

wire  [15:0] DMD, R;

reg [15:0] AX1_1st, AX0_1st, AX1_2nd, AX0_2nd;
reg [15:0] alu_Xop, alu_Yop;
reg [15:0] AY1_1st, AY0_1st, AY1_2nd, AY0_2nd;
reg [15:0] AF_1st, AF_2nd;
reg [15:0] AR_1st, AR_2nd;

wire load_AX1, load_AX0, load_AY1, en_AY0;
wire PMD2AY, en_AF_1st, en_AF_2nd, DIVS;
wire CI_in, is_div, is_logic_func, inv_Xop, inv_Yop;
wire load_AR, en_AR_1st, en_AR_2nd;
wire ARtoR, AR2DMD, sel_AX0, AXx2DMD, sel_AY0, AYx2DMD;
wire Q_in;
wire MSTAT0_R;
wire [1:0]  sel_Xop, sel_Yop;
wire [15:0] AX1, AX0;
wire [15:0] AY_in, AY0_in, AY1, AY0, constYop;
wire [15:0] AF_in, AF, alu_R;
wire [15:0] AR_in, AR;
wire [15:0] AXx, AYx;
reg  [15:0] AY;

wire bp_AR;
wire en_p2d_rr;
wire [15:0] DMD_in, DMD_no_PMD;

wire [23:0] IR;

reg BUSY_in_r, BUSY;
always @(posedge clk33 or negedge reset_) begin
  if (!reset_)   begin
    BUSY_in_r <= #1 1'b0 ;
    BUSY      <= #1 1'b0 ;
  end
  else begin		
    BUSY_in_r <= #1 BUSY_in ;  
    BUSY      <= #1 BUSY_in_r;   
  end
end

reg  load_AX0_r, load_AX0_1st_rr, load_AX0_2nd_rr;
reg  load_AX1_r, load_AX1_1st_rr, load_AX1_2nd_rr;

always @(posedge clk33 or negedge reset_) begin
  if (!reset_) begin
    load_AX0_r      <= #1 1'b0;
    load_AX1_r      <= #1 1'b0;
    load_AX0_1st_rr <= #1 1'b0;
    load_AX0_2nd_rr <= #1 1'b0;
    load_AX1_1st_rr <= #1 1'b0;
    load_AX1_2nd_rr <= #1 1'b0;
  end
  else begin
    load_AX0_r      <= #1 load_AX0;
    load_AX1_r      <= #1 load_AX1;
    load_AX0_1st_rr <= #1 !MSTAT0 & load_AX0_r;
    load_AX0_2nd_rr <= #1  MSTAT0 & load_AX0_r;
    load_AX1_1st_rr <= #1 !MSTAT0 & load_AX1_r;
    load_AX1_2nd_rr <= #1  MSTAT0 & load_AX1_r;
  end
end

always @(posedge clk33 or negedge reset_) begin
  if (!reset_)   	    AX1_1st <= #1 16'b0 ;
  else if (BUSY) 	    AX1_1st <= #1 AX1_1st ;
  else if (load_AX1_1st_rr) AX1_1st <= #1 DMD_in;
end

always @(posedge clk33 or negedge reset_) begin
  if (!reset_)   	    AX0_1st <= #1 16'b0 ;
  else if (BUSY) 	    AX0_1st <= #1 AX0_1st ;  
  else if (load_AX0_1st_rr) AX0_1st <= #1 DMD_in;
end

always @(posedge clk33 or negedge reset_) begin
  if (!reset_)   	    AX1_2nd <= #1 16'b0 ;
  else if (BUSY) 	    AX1_2nd <= #1 AX1_2nd ;
  else if (load_AX1_2nd_rr) AX1_2nd <= #1 DMD_in;
end

always @(posedge clk33 or negedge reset_) begin
  if (!reset_)   	    AX0_2nd <= #1 16'b0 ;
  else if (BUSY) 	    AX0_2nd <= #1 AX0_2nd ;
  else if (load_AX0_2nd_rr) AX0_2nd <= #1 DMD_in;
end

assign AX0 = MSTAT0 ? AX0_2nd : AX0_1st;
assign AX1 = MSTAT0 ? AX1_2nd : AX1_1st;

wire   AX0_forward, AX1_forward, AX01_forward;
assign AX0_forward = load_AX0_r ;
assign AX1_forward = load_AX1_r ;
assign AX01_forward= (!IR[8] & load_AX0_r) | (IR[8] & load_AX1_r);

wire sel_Xop_15;	
assign sel_Xop_15 = sel_Xop[1] & !DIVS; 

reg [3:0] alu_Xop_sel, alu_Xop_15_sel;
always @(posedge clk33 or negedge reset_) begin
  if (!reset_)   begin
    alu_Xop_sel    <= #1 4'b0;
    alu_Xop_15_sel <= #1 4'b0;
  end
  else begin
    alu_Xop_sel    <= #1 {sel_Xop[1:0], IR[8], AX01_forward};
    alu_Xop_15_sel <= #1 {sel_Xop_15, sel_Xop[0], IR[8], AX01_forward};
  end
end

always @(alu_Xop_sel or AX0 or AX1 or DMD_in or R_in)
  begin
    casex (alu_Xop_sel) // {sel_Xop, IR[8], AX01forward}
      4'b00_00: alu_Xop = AX0;
      4'b00_10: alu_Xop = AX1;
      4'b00_x1: alu_Xop = DMD_in;
      4'b01_xx: alu_Xop = R_in ;
      4'b1x_xx: alu_Xop = 16'b0;
    endcase
  end

reg  alu_Xop_15;	// DIVS: R=PASS Y, but AQ= AX[15] XOR AY[15]
always @( alu_Xop_15_sel or AX0 or AX1 or DMD_in or R_in)
  begin
    casex (alu_Xop_15_sel)
      4'b00_00: alu_Xop_15 = AX0[15];
      4'b00_10: alu_Xop_15 = AX1[15];
      4'b00_x1: alu_Xop_15 = DMD_in[15];
      4'b01_xx: alu_Xop_15 = R_in[15] ;
      4'b1x_xx: alu_Xop_15 = 1'b0;
    endcase
  end

wire AY0_forward, AY1_forward;
reg  load_AY1_r, load_AY1_1st_rr, load_AY1_2nd_rr;
reg  en_AY0_r, en_AY0_1st_rr, en_AY0_2nd_rr;

always @(posedge clk33 or negedge reset_) begin
  if (!reset_)   begin
    load_AY1_r      <= #1 1'b0;    
    load_AY1_1st_rr <= #1 1'b0;    
    load_AY1_2nd_rr <= #1 1'b0;    
    en_AY0_r        <= #1 1'b0;
    en_AY0_1st_rr   <= #1 1'b0;
    en_AY0_2nd_rr   <= #1 1'b0;
  end
  else begin
    load_AY1_r      <= #1 load_AY1;    
    load_AY1_1st_rr <= #1 !MSTAT0 & load_AY1_r;    
    load_AY1_2nd_rr <= #1  MSTAT0 & load_AY1_r;    
    en_AY0_r        <= #1 en_AY0;
    en_AY0_1st_rr   <= #1 !MSTAT0 & en_AY0_r;
    en_AY0_2nd_rr   <= #1  MSTAT0 & en_AY0_r;
  end
end

assign AY0_forward = en_AY0_r ;
assign AY1_forward = load_AY1_r ;

reg PMD2AY_r, PMD2AY_rr;
always @(posedge clk33 or negedge reset_) begin
  if (!reset_)   begin 
    PMD2AY_r  <= #1 1'b0;
    PMD2AY_rr <= #1 1'b0;
  end
  else begin
    PMD2AY_r  <= #1 PMD2AY;
    PMD2AY_rr <= #1 PMD2AY_r;
  end
end
assign AY_in = (PMD2AY_rr | en_p2d_rr) ? PMD23_8 : DMD_no_PMD;

reg  is_div_r, is_div_rr, AY0_forward_rr;
always @(posedge clk33 or negedge reset_) begin
  if (!reset_)   begin 
    is_div_r  <= #1 1'b0;  
    is_div_rr <= #1 1'b0; 
    AY0_forward_rr <= #1 1'b0;
  end
  else begin     
    is_div_r  <= #1 is_div;  
    is_div_rr <= #1 is_div_r;  
    AY0_forward_rr <= #1 AY0_forward;
  end
end

reg [15:0] AY0_r;
always @(posedge clk33 or negedge reset_) begin
  if (!reset_)   AY0_r   <= #1 16'b0;
  else           AY0_r   <= #1 AY0_forward_rr ? AY0_in : AY0;
end
assign AY0_in = is_div_rr ? {AY0_r[14:0], Q_in} : AY_in;

always @(posedge clk33 or negedge reset_) begin
  if (!reset_)   	    AY1_1st <= #1 16'b0 ;
  else if (BUSY) 	    AY1_1st <= #1 AY1_1st ;
  else if (load_AY1_1st_rr) AY1_1st <= #1 AY_in;
 end

always @(posedge clk33 or negedge reset_) begin
  if (!reset_)   	    AY0_1st <= #1 16'b0 ;
  else if (BUSY) 	    AY0_1st <= #1 AY0_1st ;
  else if (en_AY0_1st_rr)   AY0_1st <= #1 AY0_in ;
end

always @(posedge clk33 or negedge reset_) begin
  if (!reset_)   	    AY1_2nd <= #1 16'b0 ;
  else if (BUSY) 	    AY1_2nd <= #1 AY1_2nd ;
  else if (load_AY1_2nd_rr) AY1_2nd <= #1 AY_in;
 end

always @(posedge clk33 or negedge reset_) begin
  if (!reset_)   	    AY0_2nd <= #1 16'b0 ;
  else if (BUSY) 	    AY0_2nd <= #1 AY0_2nd ;
  else if (en_AY0_2nd_rr)   AY0_2nd <= #1 AY0_in;
end

assign AY0 = MSTAT0 ? AY0_2nd : AY0_1st;
assign AY1 = MSTAT0 ? AY1_2nd : AY1_1st;

reg [1:0]  AY_sel;
reg [1:0]  sel_Yop_r;
reg [15:0] constYop_r;
wire AY01_forward;

assign AY01_forward= (!IR[11] & en_AY0_r) | (IR[11] & load_AY1_r);

always @(posedge clk33 or negedge reset_) begin
  if (!reset_)   begin
    AY_sel     <= #1 2'b0;
    sel_Yop_r  <= #1 2'b0;
    constYop_r <= #1 16'b0;
  end
  else           begin
    AY_sel     <= #1 {IR[11], AY01_forward};
    sel_Yop_r  <= #1 sel_Yop;
    constYop_r <= #1 constYop;
  end
end

always @(AY_sel or AY1 or AY0 or AY0_in or AY_in)
  begin
    casex (AY_sel) // {IR[11], AY01_forward}
      2'b00: AY = AY0;
      2'b10: AY = AY1;
      2'bx1: AY = AY_in;    
    endcase
  end

always @(AY or AF or constYop_r or sel_Yop_r)
  begin
    case (sel_Yop_r)  
      2'b00: alu_Yop = AY;
      2'b01: alu_Yop = AF;
      2'b10: alu_Yop = constYop_r;
      2'b11: alu_Yop = 16'b0;
    endcase
  end

wire   AY0_15;
assign AY0_15 = MSTAT0 ? AY0_2nd[15] : AY0_1st[15];
assign AF_in  = is_div_rr ? {alu_R[14:0], AY0_15} : alu_R;

wire AF_forward;
assign AF_forward = en_AF_2nd | en_AF_1st;

always @(posedge clk33 or negedge reset_) begin
  if (!reset_)          AF_1st <= #1 16'b0 ;
  else if (BUSY)        AF_1st <= #1 AF_1st ;
  else if (en_AF_1st)   AF_1st <= #1 AF_in;
end

always @(posedge clk33 or negedge reset_) begin
  if (!reset_)          AF_2nd <= #1 16'b0 ;
  else if (BUSY)        AF_2nd <= #1 AF_2nd ;
  else if (en_AF_2nd)   AF_2nd <= #1 AF_in;
end

assign AF = AF_forward ? AF_in : (MSTAT0 ? AF_2nd : AF_1st);

/*alufunc ALUFUNC(MSTAT3_R, CI_in, is_div_rr, is_logic_func, inv_Xop, inv_Yop, 
                DIVS, IR[14:13], alu_Xop, alu_Yop, alu_R, 
                ASTAT5_in, ASTAT4_in, ASTAT3_in, ASTAT2_in, ASTAT1_in, ASTAT0_in,
                Q_in, clk33, reset_, alu_Xop_15);*/

//For CI_in and inv_Xop
wire   ASTAT4_in_tag;
assign ASTAT4_in_tag = alu_Xop[15];

reg  load_AR_r, load_AR_rr;
always @(posedge clk33 or negedge reset_) begin
  if (!reset_)   begin
    load_AR_r   <= #1 1'b0;  
    load_AR_rr  <= #1 1'b0;  
  end
  else  begin
    load_AR_r   <= #1 load_AR;  
    load_AR_rr  <= #1 load_AR_r;  
  end
end
assign AR_in = load_AR_rr ? DMD_in  : alu_R;

always @(posedge clk33 or negedge reset_) begin
  if (!reset_)          AR_1st <= #1 16'b0 ;
  else if (BUSY)        AR_1st <= #1 AR_1st ;
  else if (en_AR_1st)   AR_1st <= #1 AR_in;	
end

always @(posedge clk33 or negedge reset_) begin
  if (!reset_)          AR_2nd <= #1 16'b0 ;
  else if (BUSY)        AR_2nd <= #1 AR_2nd ;
  else if (en_AR_2nd)   AR_2nd <= #1 AR_in;
end
assign AR = MSTAT0 ? AR_2nd : AR_1st;

//-----------------------------------------------------------------------------
wire AR_forward;
wire [15:0] AR_BPtoR;
reg  ARtoR_r, MEM_AR_Rin;
always @(posedge clk33 or negedge reset_) begin
  if (!reset_) begin
    ARtoR_r      <= #1 1'b0;       
    MEM_AR_Rin   <= #1 1'b0;       
  end
  else begin
    ARtoR_r      <= #1 ARtoR;       
    MEM_AR_Rin   <= #1 load_AR_r & ARtoR;    
  end
end
assign AR_forward = en_AR_2nd | en_AR_1st;
assign AR_BPtoR = AR_forward ? alu_R : AR;
assign R = {16{ARtoR_r}} & AR_BPtoR ;
//-----------------------------------------------------------------------------
reg AYx2DMD_r, AXx2DMD_r, AR2DMD_r, AYx2DMD_rr, AXx2DMD_rr, AR2DMD_rr;
reg sel_AX0_r, sel_AY0_r, sel_AX0_rr, sel_AY0_rr;
always @(posedge clk33 or negedge reset_) begin
  if (!reset_)   begin
    AYx2DMD_r  <= #1 1'b0 ;
    AXx2DMD_r  <= #1 1'b0 ;
    AR2DMD_r   <= #1 1'b0 ;
    AYx2DMD_rr <= #1 1'b0 ;
    AXx2DMD_rr <= #1 1'b0 ;
    AR2DMD_rr  <= #1 1'b0 ;
    sel_AX0_r  <= #1 1'b0 ;
    sel_AY0_r  <= #1 1'b0 ;
    sel_AX0_rr <= #1 1'b0 ;
    sel_AY0_rr <= #1 1'b0 ;
  end
  else begin
    AYx2DMD_r  <= #1 AYx2DMD;	
    AXx2DMD_r  <= #1 AXx2DMD;	
    AR2DMD_r   <= #1 AR2DMD;	
    AYx2DMD_rr <= #1 AYx2DMD_r;	
    AXx2DMD_rr <= #1 AXx2DMD_r;	
    AR2DMD_rr  <= #1 AR2DMD_r;	
    sel_AX0_r  <= #1 sel_AX0 ;
    sel_AY0_r  <= #1 sel_AY0 ;
    sel_AX0_rr <= #1 sel_AX0_r ;
    sel_AY0_rr <= #1 sel_AY0_r ;
  end
end
//---------------------------------------------------------------
wire [15:0] AX0_RN, AX1_RN, AY0_RN, AY1_RN, AR_RN;
assign AX0_RN = MSTAT0_R ? AX0_2nd : AX0_1st;
assign AX1_RN = MSTAT0_R ? AX1_2nd : AX1_1st;
assign AY0_RN = MSTAT0_R ? AY0_2nd : AY0_1st;
assign AY1_RN = MSTAT0_R ? AY1_2nd : AY1_1st;
assign AR_RN  = MSTAT0_R ? AR_2nd  : AR_1st;

assign AXx = sel_AX0_rr ? AX0_RN : AX1_RN;
assign AYx = sel_AY0_rr ? AY0_RN : AY1_RN;

assign DMD = ({16{AYx2DMD_rr}} & AYx) | ({16{AXx2DMD_rr}} & AXx) | ({16{AR2DMD_rr}} & AR_RN) ;

wire ASTAT5_mux;
assign ASTAT5_mux = is_div_rr ? ASTAT5_in : ASTAT5;

assign update_AQ = is_div_r;

//constgen CONSTGEN(IR[12:11], IR[7:6], IR[5], constYop);

/*aluctrl ALUCTRL(clk33, reset_, cond_fit, ASTAT5_mux, ASTAT3, ASTAT4_in_tag, IR,
                load_AX1, load_AX0, sel_Xop,
                load_AY1, en_AY0, sel_Yop,
                PMD2AY, en_AF_1st, en_AF_2nd, DIVS, 
                CI_in, is_div, is_logic_func, inv_Xop, inv_Yop, 
                load_AR, en_AR_1st, en_AR_2nd, 
                ARtoR, AR2DMD, sel_AX0, AXx2DMD, sel_AY0, AYx2DMD,
                update_AS, update_ASTAT0_3, iomem_rd, iomem_wr_,
		bp_AR, MSTAT0_R
	       );          
*/  



endmodule
