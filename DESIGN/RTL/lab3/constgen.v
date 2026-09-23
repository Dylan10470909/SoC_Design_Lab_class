
`timescale 1ns / 100ps

module constgen(IR12_11, IR7_6, IR5, constYop);

input [1:0] IR12_11, IR7_6;
input IR5;

output [15:0] constYop;

wire  [15:0] pre_constYop;

assign pre_constYop[0] = (IR12_11 == 2'b00) | (IR7_6 == 2'b00);
assign pre_constYop[1] = (IR12_11 == 2'b00) | (IR7_6 == 2'b01);
assign pre_constYop[2] = (IR12_11 == 2'b00) | (IR7_6 == 2'b10);
assign pre_constYop[3] = (IR12_11 == 2'b00) | (IR7_6 == 2'b11);
assign pre_constYop[4] = (IR12_11 == 2'b01) | (IR7_6 == 2'b00);
assign pre_constYop[5] = (IR12_11 == 2'b01) | (IR7_6 == 2'b01);
assign pre_constYop[6] = (IR12_11 == 2'b01) | (IR7_6 == 2'b10);
assign pre_constYop[7] = (IR12_11 == 2'b01) | (IR7_6 == 2'b11);
assign pre_constYop[8] = (IR12_11 == 2'b10) | (IR7_6 == 2'b00);
assign pre_constYop[9] = (IR12_11 == 2'b10) | (IR7_6 == 2'b01);
assign pre_constYop[10] = (IR12_11 == 2'b10) | (IR7_6 == 2'b10);
assign pre_constYop[11] = (IR12_11 == 2'b10) | (IR7_6 == 2'b11);
assign pre_constYop[12] = (IR12_11 == 2'b11) | (IR7_6 == 2'b00);
assign pre_constYop[13] = (IR12_11 == 2'b11) | (IR7_6 == 2'b01);
assign pre_constYop[14] = (IR12_11 == 2'b11) | (IR7_6 == 2'b10);
assign pre_constYop[15] = (IR12_11 == 2'b11) | (IR7_6 == 2'b11);

assign constYop = {16{IR5}} & pre_constYop;

endmodule
