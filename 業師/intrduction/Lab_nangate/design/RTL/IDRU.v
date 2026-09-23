module IDRU8 (ACC0,ACC1,ACC2,ACC3,ACC4,ACC5,ACC6,ACC7,CLK,HALT,RESET_,DoDCT,Z,ToMEM);
parameter inputsize = 12;
parameter blocksize=8;
parameter countersize=2; // log(blocksize/2)
parameter frac2=6;
parameter frac3=4;

input [inputsize+1+frac3:0] ACC0,ACC1,ACC2,ACC3,ACC4,ACC5,ACC6,ACC7;
//ACC contain 14 bit integer and 4 bit decimal fraction
input CLK,HALT,RESET_,DoDCT;
output [inputsize-1:0] Z;
output [inputsize+3:0] ToMEM;  //2 bit fraction
reg [inputsize-1:0] Z;

reg [countersize:0] Count;
always @(posedge CLK)
begin 
    if(RESET_==0) 
    begin 
        Count <= -6 ; //pipeline level 
    end 
    else if (!HALT) 
    begin 
        Count <= Count+1; 
    end 
end 
wire IsXstate = Count[2]; 

wire [countersize-1:0] MUXAaddr = (DoDCT==0)? Count:{Count[0],Count[1]};
wire [countersize-1:0] MUXBaddr = (DoDCT==0)? Count:{!Count[0],!Count[1]};

reg [inputsize+1+frac3:0] SWAout0,SWAout1;
always @(DoDCT or ACC2 or ACC4)
begin
    if (DoDCT == 0)
    begin
        SWAout0 <= ACC2;
        SWAout1 <= ACC4;
    end
    else
    begin
        SWAout0 <= ACC4;
        SWAout1 <= ACC2;
    end
end

reg [inputsize+1+frac3:0] SWBout0,SWBout1;
always @(DoDCT or ACC3 or ACC5)
begin
    if (DoDCT == 0)
    begin
        SWBout0 <= ACC3;
        SWBout1 <= ACC5;
    end
    else
    begin
        SWBout0 <= ACC5;
        SWBout1 <= ACC3;
    end
end
 
// Count :         0       1       2       3
// ---------------- AT DCT ------------------
// MUXAaddr :      0       2       1       3
// output :       ACC0    ACC4    ACC1    ACC5
// ---------------- AT IDCT ------------------
// MUXAaddr :      0       1       2       3
// output :       ACC0    ACC1    ACC2    ACC3
wire [inputsize+1+frac3:0] MUXAout =    (MUXAaddr==0)?  ACC0:
                                        (MUXAaddr==1)?  ACC1:
                                        (MUXAaddr==2)?  SWAout0:
                                                        SWBout0;

// Count :         0       1       2       3
// ---------------- AT DCT ------------------
// MUXBaddr :      3       1       2       0
// output :       ACC7    ACC3    ACC6    ACC2
// ---------------- AT IDCT ------------------
// MUXBaddr :      0       1       2       3
// output :       ACC4    ACC5    ACC6    ACC7
wire [inputsize+1+frac3:0] MUXBout =    (MUXBaddr==0)?  SWAout1:
                                        (MUXBaddr==1)?  SWBout1:
                                        (MUXBaddr==2)?  ACC6:
                                                        ACC7;

wire [inputsize+1+frac3:0] ADDout = MUXAout + MUXBout;
wire [inputsize+1+frac3:0] SUBout = MUXAout - MUXBout;

wire [inputsize+3:0] #1 MUXCout=(DoDCT==1)? MUXAout[inputsize+1+frac3:frac3-2]: 
                                            ADDout[inputsize+1+frac3:frac3-2];
wire [inputsize+3:0] #1 MUXDout=(DoDCT==1)? MUXBout[inputsize+1+frac3:frac3-2]: 
                                            SUBout[inputsize+1+frac3:frac3-2];

wire [countersize-1:0] #1 LIFOaddr=(IsXstate==0)?Count:~Count;
reg [inputsize+3:0] LIFO [(blocksize/2)-1:0] ;
always @(posedge CLK)
begin
    if(!HALT)
    begin
        if(LIFOaddr == 0) LIFO[0] <= MUXDout;
        if(LIFOaddr == 1) LIFO[1] <= MUXDout;
        if(LIFOaddr == 2) LIFO[2] <= MUXDout;
        if(LIFOaddr == 3) LIFO[3] <= MUXDout;
    end
end
//wire [inputsize+1:0] LIFOtmp0=LIFO[0];
//wire [inputsize+1:0] LIFOtmp1=LIFO[1];
//wire [inputsize+1:0] LIFOtmp2=LIFO[2];
//wire [inputsize+1:0] LIFOtmp3=LIFO[3];

wire [inputsize+3:0] LIFOout = LIFO[LIFOaddr];
assign #1 ToMEM = (IsXstate == 0)? MUXCout: LIFOout;

wire [inputsize-1:0] Z_p = (IsXstate == 0)? LIFOout[inputsize+1:2]:
                                            MUXCout[inputsize+1:2];
wire [inputsize-1:0] Z_p2;
assign #1 Z_p2 = (DoDCT == 1)? Z_p: 
              ((Z_p[inputsize-1]==1)&&(&Z_p[inputsize-2:7]==0))? {5'b1,7'b0}:
                                                                //underflow
              ((Z_p[inputsize-1]==0)&&(|Z_p[inputsize-2:7]==1))? {5'b0,7'b1}: 
                                                                //overflow
                                                                 Z_p;
always @(posedge CLK)
begin
    if(RESET_ ==0)
    begin
        Z <=  0;
    end
    else if(!HALT)
    begin
        Z <=  Z_p2;
    end
end
endmodule

