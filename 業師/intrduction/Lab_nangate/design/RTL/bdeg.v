module  bdeg(RESET_, CLK, BDEGin, DoDCT, HALT,
            BDEGout0, BDEGout1, BDEGout2, BDEGout3);

parameter inputsize = 12;
parameter blocksize=8;
parameter frac2= 6;
parameter frac3= 4;

parameter countersize=2; // log(blocksize/2)
parameter adrsize=6; // 2*log(blocksize)

input   RESET_, CLK, DoDCT, HALT;
input   [inputsize+4:0]  BDEGin;
output  [inputsize+1+frac3:0]    BDEGout0, BDEGout1, BDEGout2, BDEGout3;

wire    [inputsize+1+frac3:0]  BDEGout0, BDEGout1, BDEGout2, BDEGout3;
reg [1:0]   selACCin0;
reg [1:0]   selACCin1;
reg [1:0]   selACCin2;
reg [1:0]   selACCin3;
reg [3:0]   negACCin;
reg [countersize-1:0] Count;

// cadence sync_set_reset "RESET_, HALT"
always @(posedge CLK)
begin
    if(RESET_==0)
    begin
        Count <= 2'b01 ; 
    end
    else if (!HALT)
    begin
        Count <= Count+1;
    end
end

wire [inputsize+5+12:0] multbout;
wire [inputsize+5+13:0] multdout;
wire [inputsize+5+13:0] multeout;
wire [inputsize+5+12:0] multgout;

DW02_mult_3_stage #(inputsize+5,13) mult_b (BDEGin,13'b0111110110001,1'b1,CLK,multbout);
DW02_mult_3_stage #(inputsize+5,14) mult_d (BDEGin,14'b01101010011011,1'b1,CLK,multdout);
DW02_mult_3_stage #(inputsize+5,14) mult_e (BDEGin,14'b01000111000111,1'b1,CLK,multeout);
DW02_mult_3_stage #(inputsize+5,13) mult_g (BDEGin,13'b0001100011111,1'b1,CLK,multgout);

//b 0.0111110110001
//d 0.011010100110110
//e 0.010001110001110
//g 0.000110001111100

reg     [inputsize+1+frac2:0]  toACC0t,toACC1t,toACC2t,toACC3t;
always  @(selACCin0 or multbout or multdout or multeout or multgout)
begin
    case(selACCin0)
        2'd0 : toACC0t <= multbout[inputsize+5+11 : 5+11-1-frac2];
        2'd1 : toACC0t <= multdout[inputsize+5+12 : 5+12-1-frac2];
        2'd2 : toACC0t <= multeout[inputsize+5+12 : 5+12-1-frac2];
        2'd3 : toACC0t <= multgout[inputsize+5+11 : 5+11-1-frac2];
    endcase
end 

always  @(selACCin1 or multbout or multdout or multeout or multgout)
begin
    case(selACCin1)
        2'd0 : toACC1t <= multbout[inputsize+5+11 : 5+11-1-frac2];  
        2'd1 : toACC1t <= multdout[inputsize+5+12 : 5+12-1-frac2];  
        2'd2 : toACC1t <= multeout[inputsize+5+12 : 5+12-1-frac2];
        2'd3 : toACC1t <= multgout[inputsize+5+11 : 5+11-1-frac2];
    endcase
end 

always  @(selACCin2 or multbout or multdout or multeout or multgout)
begin
    case(selACCin2)
        2'd0 : toACC2t <= multbout[inputsize+5+11 : 5+11-1-frac2];  
        2'd1 : toACC2t <= multdout[inputsize+5+12 : 5+12-1-frac2];  
        2'd2 : toACC2t <= multeout[inputsize+5+12 : 5+12-1-frac2];
        2'd3 : toACC2t <= multgout[inputsize+5+11 : 5+11-1-frac2];
    endcase
end 

always  @(selACCin3 or multbout or multdout or multeout or multgout)
begin
    case(selACCin3)
        2'd0 : toACC3t <= multbout[inputsize+5+11 : 5+11-1-frac2];  
        2'd1 : toACC3t <= multdout[inputsize+5+12 : 5+12-1-frac2];  
        2'd2 : toACC3t <= multeout[inputsize+5+12 : 5+12-1-frac2];
        2'd3 : toACC3t <= multgout[inputsize+5+11 : 5+11-1-frac2];
    endcase
end 
wire  [inputsize+1+frac2:0]  toACC0t2 = (negACCin[3]==0)?toACC0t:~toACC0t;
wire  [inputsize+1+frac2:0]  toACC1t2 = (negACCin[2]==0)?toACC1t:~toACC1t;
wire  [inputsize+1+frac2:0]  toACC2t2 = (negACCin[1]==0)?toACC2t:~toACC2t;
wire  [inputsize+1+frac2:0]  toACC3t2 = (negACCin[0]==0)?toACC3t:~toACC3t;

reg     [inputsize+1+frac2:0]  toACC0,toACC1,toACC2,toACC3;
// cadence sync_set_reset "HALT"
always  @(posedge CLK) 
begin
    if (!HALT) begin
        toACC0 <= toACC0t2 ;
        toACC1 <= toACC1t2 ;
        toACC2 <= toACC2t2 ;
        toACC3 <= toACC3t2 ;
    end
end

ACC ACC0(.RESET_(RESET_), .CLK(CLK), .ACCin(toACC0), .HALT(HALT), 
         .Count(Count), .accout(BDEGout0));
ACC ACC1(.RESET_(RESET_), .CLK(CLK), .ACCin(toACC1), .HALT(HALT), 
         .Count(Count), .accout(BDEGout1));
ACC ACC2(.RESET_(RESET_), .CLK(CLK), .ACCin(toACC2), .HALT(HALT), 
         .Count(Count), .accout(BDEGout2));
ACC ACC3(.RESET_(RESET_), .CLK(CLK), .ACCin(toACC3), .HALT(HALT), 
         .Count(Count), .accout(BDEGout3));

reg [1:0] A0,A1,A2,A3;
reg [1:0] AT0,AT1,AT2,AT3;
reg [3:0] Aneg,ATneg;

parameter b = 2'b00;
parameter d = 2'b01;
parameter e = 2'b10;
parameter g = 2'b11;

always @(Count)
begin
    case(Count)
        2'd0 : {A0,A1,A2,A3,Aneg} <= {g,e,d,b,4'b0101} ; // g -e  d -b
        2'd1 : {A0,A1,A2,A3,Aneg} <= {e,b,g,d,4'b0100} ; // e -b  g  d
        2'd2 : {A0,A1,A2,A3,Aneg} <= {d,g,b,e,4'b0111} ; // d -g -b -e
        2'd3 : {A0,A1,A2,A3,Aneg} <= {b,d,e,g,4'b0000} ; // b  d  e  g
    endcase
end

always @(Count)
begin
    case(Count)
        2'd0 : {AT0,AT1,AT2,AT3,ATneg} <= {d,g,b,e,4'b0111} ; // d -g -b -e
        2'd1 : {AT0,AT1,AT2,AT3,ATneg} <= {e,b,g,d,4'b0100} ; // e -b  g  d
        2'd2 : {AT0,AT1,AT2,AT3,ATneg} <= {b,d,e,g,4'b0000} ; // b  d  e  g
        2'd3 : {AT0,AT1,AT2,AT3,ATneg} <= {g,e,d,b,4'b0101} ; // g -e  d -b
    endcase
end
always @(DoDCT or A0 or A1 or A2 or A3 or AT0 or AT1 or AT2 or AT3  )
begin
    if(DoDCT)
        {selACCin0,selACCin1,selACCin2,selACCin3} <= {A0,A1,A2,A3} ;
    else
        {selACCin0,selACCin1,selACCin2,selACCin3} <= {AT0,AT1,AT2,AT3} ;
end

always @(DoDCT or Aneg or ATneg)
begin
    if(DoDCT)
        negACCin <= Aneg;
    else
        negACCin <= ATneg;
end
endmodule

