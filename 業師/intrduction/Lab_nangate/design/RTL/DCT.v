module DCT(CLK,HALT,RESET_,DoDCT,X,Z,Mode);
parameter inputsize = 12;
parameter blocksize=8;
parameter frac2=6;
parameter frac3=4;

parameter countersize=2; // log(blocksize/2)
parameter adrsize=6; // 2*log(blocksize) 

input CLK,HALT,RESET_,DoDCT;
input [inputsize-1:0] X;
input Mode;
output [inputsize-1:0] Z; 
reg [inputsize-1:0] Z;

wire [inputsize+3:0] Y;
wire [inputsize+4:0] ToBDEG,ToACF;

wire [inputsize+1+frac3:0] ACC0,ACC1,ACC2,ACC3,ACC4,ACC5,ACC6,ACC7;
wire [inputsize+3:0] ToMEM;

//Mode 
//0  normal operation mode
//1  ram bist

wire [inputsize-1:0] IDRUout; 

reg [inputsize-1:0] buf_X;
reg buf_RESET_;
always@(posedge CLK) begin
    buf_RESET_<= RESET_;
    buf_X <= X;
end
DRU DRU (.X(buf_X),.Y(Y),.ToBDEG(ToBDEG),.ToACF(ToACF),.CLK(CLK),.HALT(HALT),.DoDCT(DoDCT),.RESET_(buf_RESET_));

acf acf (.RESET_(buf_RESET_), .CLK(CLK), .ACFin(ToACF), .DoDCT(DoDCT), .HALT(HALT), .ACFout0(ACC0), .ACFout1(ACC1), .ACFout2(ACC2), .ACFout3(ACC3));

bdeg  bdeg(.RESET_(buf_RESET_), .CLK(CLK), .BDEGin(ToBDEG), .DoDCT(DoDCT), .HALT(HALT), .BDEGout0(ACC4), .BDEGout1(ACC5), .BDEGout2(ACC6), .BDEGout3(ACC7)); 

IDRU8 IDRU8 (.ACC0(ACC0),.ACC1(ACC1),.ACC2(ACC2),.ACC3(ACC3),.ACC4(ACC4),.ACC5(ACC5),.ACC6(ACC6),.ACC7(ACC7),.CLK(CLK),.HALT(HALT),.RESET_(buf_RESET_),.DoDCT(DoDCT),.Z(IDRUout),.ToMEM(ToMEM));
always @(posedge CLK) begin
    if (Mode==0) begin
        Z <= IDRUout; //normal operation
    end
    else
    begin
        Z <= Y; //ram bist
    end
end
tposemem tposemem (.Datain(ToMEM),.CLK(CLK),.HALT(HALT),.RESET_(buf_RESET_),.Y(Y),.BistMode(Mode));

endmodule
