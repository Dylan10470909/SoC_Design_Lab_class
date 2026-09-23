`timescale 1ns/1ps
`celldefine
module PADIN(PAD,C);

input PAD;
output C; 

//assign C= PAD;
buf      (C, PAD);
specify
 (PAD *> C) = (1,1);
endspecify
endmodule
`endcelldefine


`celldefine
module PADBI(PAD,OEN,C,I);

inout PAD;
input OEN;
output C;
input I; 

//bufif0  (PAD, I, OEN);
//buf     (C, PAD);

assign C= PAD;
reg    pad_driver;
nmos i1 (PAD, pad_driver, 1'b1);

always @( I or OEN )
begin
    if ( I === 1'bx || !OEN)
        pad_driver = 1'bz;
    else
        pad_driver = I;
    end
always @(PAD)
    begin
    if (!$test$plusargs("bus_conflict_off"))
    if ($countdrivers(PAD) && (PAD === 1'bx))
    $display("%t ++BUS CONFLICT++ : %m", $realtime);
    end

specify
  (I => PAD)=(1,1);
  (OEN=>PAD)=(0,0,0,0,0,0);
  (PAD=>C)=(1,1);
endspecify

endmodule
`endcelldefine


`celldefine
module PADOUT(PAD,I);

output PAD;
input I; 

buf     (PAD, I);


specify
  (I => PAD)=(1,1);
endspecify

endmodule
`endcelldefine


