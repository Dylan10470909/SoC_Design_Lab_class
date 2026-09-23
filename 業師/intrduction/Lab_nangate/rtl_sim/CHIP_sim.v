`timescale 1ns/10ps
`include "parameter.v"
`define clock 10
`define OUTPUTDATA "DCTout"
`define INPUTDATA "a.map"
`define GOLDEN "golden_result"
`define blocknum 1
module test;
parameter inputsize = 12;
parameter blocksize=8;
parameter frac2=`FRAC2;
parameter frac3=`FRAC3;

parameter countersize=2; // log(blocksize/2)
parameter adrsize=6;
reg CLK,HALT,RESET_,DoDCT;
reg  Mode;
reg [inputsize-1:0] X;
reg [inputsize-1:0] DCTin[`blocknum*64:0];
wire signed [inputsize-1:0] Z;
integer i,cycle;
integer outfile;
integer nanosim_vec;
integer blocks;
reg [adrsize-1:0] p;
reg TEST_MODE;
reg SCAN_EN;
reg [inputsize-1:0] golden_result[63:0];

CHIP CHIP(.CLK(CLK),.HALT(HALT),.RESET_(RESET_),.DoDCT(DoDCT),.X(X),.Z(Z),.Mode(Mode),.TEST_MODE(TEST_MODE),.SCAN_EN(SCAN_EN));
always #(`clock/2) CLK=~CLK; 

always @(posedge CLK) 
begin
    if (RESET_ == 0)
        cycle<=0;
    else 
    begin
        if(HALT == 0)
            cycle<=cycle+1;
    end
end



initial $readmemh( `INPUTDATA , DCTin);
initial $readmemh( `GOLDEN, golden_result);
//initial $sdf_annotate("CHIP.sdf",CHIP);
integer correct=1;

initial
begin
    /*
    $fsdbDumpfile("CHIP.fsdb");
    $fsdbDumpvars;
    */
    
    #0 CLK=0;HALT=0;DoDCT=1;X=0;Mode=0;TEST_MODE=0;SCAN_EN=0;
    @(negedge CLK)  RESET_ = 1'b0;
    @(negedge CLK)  RESET_ = 1'b1;
    for (i = 0; i < 64*`blocknum ; i = i + 1) 
    begin
        #(`clock/4) X=DCTin[i];
        @(negedge CLK) X= 12'bz;
    end
        #(`clock/4) X=12'b0;
    //#656 HALT=1;
    //#34 HALT=0;
    //#(`clock *86);
    #(`clock *172);
    $fclose(outfile);
    if  (correct == 1) 
        $display("\nRESULT CORRECT\n");
    else
        $display("\nRESULT INCORRECT\n");
    $finish;
end

integer out_index=0;

initial outfile = $fopen(`OUTPUTDATA);
always @(posedge CLK) 
begin
    if((cycle > 170) && (cycle <= (`blocknum*64+170)))
    begin
        if(HALT == 0) begin
            //$display ("%d : %d",cycle,Z);
            $fdisplay (outfile,"%h",Z);
            if (Z !== golden_result[out_index]) 
               correct=0;
            out_index<=out_index+1;
        end
    end
end

initial 
begin
    blocks=0;p=-5;
end

always @(posedge CLK) 
begin 
    if(HALT == 0) 
    begin 
        if (p==0) 
        begin 
            $display ("block %d",blocks); 
            blocks=blocks+1; 
        end 
        p=p+1; 
    end 
end 

endmodule
