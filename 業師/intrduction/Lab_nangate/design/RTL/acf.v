module  acf(RESET_, CLK, ACFin, DoDCT, HALT,
            ACFout0, ACFout1, ACFout2, ACFout3);

parameter inputsize = 12;
parameter blocksize=8;
parameter frac2= 6;
parameter frac3= 4;

parameter countersize=2; // log(blocksize/2)
parameter adrsize=6; // 2*log(blocksize)

input   RESET_, CLK, DoDCT, HALT;
input   [inputsize+4:0]  ACFin; //[16:2].[1:0] 2 bit fraction
output  [inputsize+1+frac3:0]    ACFout0, ACFout1, ACFout2, ACFout3;

wire    [inputsize+1+frac3:0]  ACFout0, ACFout1, ACFout2, ACFout3;
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
        Count <= 1 ;
    end
    else if (!HALT)
    begin
        Count <= Count+1;
    end
end

wire [inputsize+5+8:0] multaout;   //11 bit fraction
wire [inputsize+5+9:0] multcout;   //12 bit fraction
wire [inputsize+5+14:0] multfout;   //16 bit fraction

DW02_mult_3_stage #(inputsize+5,9) mult_a (ACFin,9'b010110101,1'b1,CLK,multaout);
DW02_mult_3_stage #(inputsize+5,10) mult_c (ACFin,10'b0111011001,1'b1,CLK,multcout);
DW02_mult_3_stage #(inputsize+5,15) mult_f (ACFin,15'b001100001111101,1'b1,CLK,multfout);

//a 0.010110101
//c 0.0111011001
//f 0.001100001111101

reg     [inputsize+1+frac2:0]  toACC0t,toACC1t,toACC2t,toACC3t;
always  @(selACCin0 or multaout or multcout or multfout)
begin
    case(selACCin0)
        2'd0 : toACC0t <= multaout[inputsize+5+7 : 5+7-1-frac2];
        2'd1 : toACC0t <= multcout[inputsize+5+8 : 5+8-1-frac2];
        2'd2 : toACC0t <= multfout[inputsize+5+13 : 5+13-1-frac2];
        2'd3 : toACC0t <= 0;
    endcase
end 

always  @(selACCin1 or multaout or multcout or multfout)
begin
    case(selACCin1)
        2'd0 : toACC1t <= multaout[inputsize+5+7 : 5+7-1-frac2];  
        2'd1 : toACC1t <= multcout[inputsize+5+8 : 5+8-1-frac2];  
        2'd2 : toACC1t <= multfout[inputsize+5+13 : 5+13-1-frac2];
        2'd3 : toACC1t <= 0;
    endcase
end 

always  @(selACCin2 or multaout or multcout or multfout)
begin
    case(selACCin2)
        2'd0 : toACC2t <= multaout[inputsize+5+7 : 5+7-1-frac2];  
        2'd1 : toACC2t <= multcout[inputsize+5+8 : 5+8-1-frac2];  
        2'd2 : toACC2t <= multfout[inputsize+5+13 : 5+13-1-frac2];
        2'd3 : toACC2t <= 0;
    endcase
end 

always  @(selACCin3 or multaout or multcout or multfout)
begin
    case(selACCin3)
        2'd0 : toACC3t <= multaout[inputsize+5+7 : 5+7-1-frac2];  
        2'd1 : toACC3t <= multcout[inputsize+5+8 : 5+8-1-frac2];  
        2'd2 : toACC3t <= multfout[inputsize+5+13 : 5+13-1-frac2];
        2'd3 : toACC3t <= 0;
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
         .Count(Count), .accout(ACFout0));
ACC ACC1(.RESET_(RESET_), .CLK(CLK), .ACCin(toACC1), .HALT(HALT), 
         .Count(Count), .accout(ACFout1));
ACC ACC2(.RESET_(RESET_), .CLK(CLK), .ACCin(toACC2), .HALT(HALT), 
         .Count(Count), .accout(ACFout2));
ACC ACC3(.RESET_(RESET_), .CLK(CLK), .ACCin(toACC3), .HALT(HALT), 
         .Count(Count), .accout(ACFout3));

reg [1:0] A0,A1,A2,A3;
reg [1:0] AT0,AT1,AT2,AT3;
reg [3:0] Aneg,ATneg;

parameter a = 2'b00;
parameter c = 2'b01;
parameter f = 2'b10;

always @(Count)
begin
    case(Count)
        2'd0 : {A0,A1,A2,A3,Aneg} <= {a,c,a,f,4'b0101} ; // a -c  a -f
        2'd1 : {A0,A1,A2,A3,Aneg} <= {a,f,a,c,4'b0110} ; // a -f -a  c
        2'd2 : {A0,A1,A2,A3,Aneg} <= {a,f,a,c,4'b0011} ; // a  f -a -c
        2'd3 : {A0,A1,A2,A3,Aneg} <= {a,c,a,f,4'b0000} ; // a  c  a  f
    endcase
end

always @(Count)
begin
    case(Count)
        2'd0 : {AT0,AT1,AT2,AT3,ATneg} <= {a,a,a,a,4'b0110} ; // a -a -a  a
        2'd1 : {AT0,AT1,AT2,AT3,ATneg} <= {c,f,f,c,4'b0011} ; // c  f -f -c
        2'd2 : {AT0,AT1,AT2,AT3,ATneg} <= {f,c,c,f,4'b0101} ; // f -c  c -f
        2'd3 : {AT0,AT1,AT2,AT3,ATneg} <= {a,a,a,a,4'b0000} ; // a  a  a  a
    endcase
end
always @(DoDCT or A0 or A1 or A2 or A3 or AT0 or AT1 or AT2 or AT3)
begin
    if(DoDCT==1)
        {selACCin0,selACCin1,selACCin2,selACCin3} <= {A0,A1,A2,A3} ;
    else
        {selACCin0,selACCin1,selACCin2,selACCin3} <= {AT0,AT1,AT2,AT3} ;
end
always @(DoDCT or Aneg or ATneg)
begin
    if(DoDCT==1)
        negACCin <= Aneg;
    else
        negACCin <= ATneg;
end
endmodule


