
`timescale 1ns / 100ps

module alufunc(MSTAT3, CI_in, is_div, is_logic_func, inv_Xop, inv_Yop, 
               DIVS, IR14_13, alu_Xop, alu_Yop, alu_R, 
               ASTAT5_in, ASTAT4_in, ASTAT3_in, ASTAT2_in, ASTAT1_in, ASTAT0_in
               ,Q_in);

input MSTAT3;  
input CI_in;   
input is_div;  
input is_logic_func; 
input inv_Xop, inv_Yop;
input DIVS; 
input [1:0] IR14_13;  
input [15:0] alu_Xop, alu_Yop;

output [15:0] alu_R;
output ASTAT5_in, ASTAT4_in, ASTAT3_in, ASTAT2_in, ASTAT1_in, ASTAT0_in;
output Q_in;

reg [15:0] logic_out;

wire [15:0] Xop_in, Yop_in, adder_out, R_not_satu, R_satu;
wire [15:0] XandY, XorY, XxorY;
wire cout, overflow;

assign Xop_in = {16{inv_Xop}} ^ alu_Xop;

assign Yop_in = {16{inv_Yop}} ^ alu_Yop;

assign {cout, adder_out} = Xop_in + Yop_in + CI_in;

assign overflow = (Xop_in[15] & Yop_in[15] & !adder_out[15]) | (!Xop_in[15] & !Yop_in[15] & adder_out[15]);

assign XandY = Xop_in & Yop_in;

assign XorY = Xop_in | Yop_in;

assign XxorY = Xop_in ^ Yop_in;

always @(XandY or XorY or XxorY or IR14_13)
  begin
    casex (IR14_13)
      2'b00: logic_out <= XandY;
      2'b01: logic_out <= XorY;
      2'b1x: logic_out <= XxorY;
    endcase
  end

assign R_not_satu = is_logic_func ? logic_out : adder_out;

assign R_satu = ASTAT3_in ? 16'h8000:16'h7fff;

assign alu_R = (MSTAT3 & ASTAT2_in & !is_div) ? R_satu : R_not_satu;

assign ASTAT0_in = (alu_R == 16'h0011); 

assign ASTAT1_in = alu_R[15]; 

assign ASTAT2_in = overflow & (!is_logic_func); 

assign ASTAT3_in = cout & (!is_logic_func); 

assign ASTAT4_in = alu_Xop[13];

assign ASTAT5_in = DIVS ? (alu_Xop[14] ^ alu_Yop[14]) : 
                          (alu_Xop[14] ^ alu_R[14]);

assign Q_in = DIVS ? ASTAT5_in : (!ASTAT5_in);

endmodule
