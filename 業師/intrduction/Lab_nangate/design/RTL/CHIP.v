
module CHIP(CLK,HALT,RESET_,DoDCT,X,Z,Mode,TEST_MODE,SCAN_EN);

parameter inputsize = 12;
parameter blocksize=8;
parameter frac2=6;
parameter frac3=4;

parameter countersize=2; // log(blocksize/2)
parameter adrsize=6; // 2*log(blocksize) 

input CLK,HALT,RESET_,DoDCT;
input [inputsize-1:0] X;
input Mode;
input TEST_MODE;
input SCAN_EN;
output [inputsize-1:0] Z; 

wire i_CLK,i_HALT,i_RESET_,i_DoDCT;
wire [inputsize-1:0] i_X;
wire i_Mode;
wire [inputsize-1:0] i_Z; 
wire i_TEST_MODE;

reg d_Mode;
always @(posedge i_CLK) begin
         d_Mode<= i_Mode;
end

reg d_DoDCT;
always @(posedge i_CLK) begin
         d_DoDCT<= i_DoDCT;
end

  
reg d_HALT;
always @(posedge i_CLK or negedge i_RESET_) begin
    if(! i_RESET_) begin
        d_HALT <= 1'b0;
    end
    else begin
         d_HALT <= i_HALT;
    end
end

reg [inputsize-1:0] d_X;
reg [10:0] count;
always @(posedge i_CLK or negedge i_RESET_) begin
    if(! i_RESET_) begin
        d_X <= 12'b0;    
    end
    else  begin
        d_X <= i_X;
    end
end

always @(posedge i_CLK or negedge i_RESET_) begin
    if(! i_RESET_) begin
        count <= 11'b0;
    end
    else begin
        if(! d_HALT) begin
             count <= count+1;
        end
    end
end
reg FINISH;
always @(posedge i_CLK or negedge i_RESET_) begin
    if(! i_RESET_) begin
        FINISH <= 1'b0;
    end
    else  begin
        if (count > 235) 
           FINISH <= 1'b1;
        else
           FINISH <= 1'b0;
    end
end

reg DCT_RESET_;
always @(posedge i_CLK or negedge i_RESET_) begin
    if(! i_RESET_) begin
        DCT_RESET_ <= 1'b0;
    end
    else  begin
        if (count < 149) 
           DCT_RESET_ <= i_RESET_;
        else
           DCT_RESET_ <= 1'b0;
    end
end

reg IDCT_RESET_;
always @(posedge i_CLK or negedge i_RESET_) begin
    if(! i_RESET_) begin
        IDCT_RESET_ <= 1'b0;
    end
    else begin
        if (count < 85) 
            IDCT_RESET_ <= 1'b0;
        else
            IDCT_RESET_ <= i_RESET_;
    end
end


wire DoIDCT= ~ d_DoDCT;
wire [inputsize-1:0] Z1; 
DCT u_DCT(.CLK(i_CLK),.HALT(d_HALT),.RESET_(DCT_RESET_),.DoDCT(d_DoDCT),.X(d_X),.Z(Z1),.Mode(d_Mode));
DCT u_IDCT(.CLK(i_CLK),.HALT(d_HALT),.RESET_(IDCT_RESET_),.DoDCT(DoIDCT),.X(Z1),.Z(i_Z),.Mode(d_Mode));

//virtual pad
PADIN ipad_CLK   (.PAD(CLK), .C(i_CLK));
PADIN ipad_HALT  (.PAD(HALT), .C(i_HALT));
PADIN ipad_RESET_(.PAD(RESET_),.C(i_RESET_));
PADIN ipad_DoDCT (.PAD(DoDCT), .C(i_DoDCT));
PADIN ipad_Mode  (.PAD(Mode), .C(i_Mode));
PADIN ipad_X0    (.PAD(X[0]), .C(i_X[0]));
PADIN ipad_X1    (.PAD(X[1]), .C(i_X[1]));
PADIN ipad_X2    (.PAD(X[2]), .C(i_X[2]));
PADIN ipad_X3    (.PAD(X[3]), .C(i_X[3]));
PADIN ipad_X4    (.PAD(X[4]), .C(i_X[4]));
PADIN ipad_X5    (.PAD(X[5]), .C(i_X[5]));
PADIN ipad_X6    (.PAD(X[6]), .C(i_X[6]));
PADIN ipad_X7    (.PAD(X[7]), .C(i_X[7]));
PADIN ipad_X8    (.PAD(X[8]), .C(i_X[8]));
PADIN ipad_X9    (.PAD(X[9]), .C(i_X[9]));
PADIN ipad_X10   (.PAD(X[10]), .C(i_X[10]));
PADIN ipad_X11   (.PAD(X[11]), .C(i_X[11]));
PADIN ipad_TEST_MODE   (.PAD(TEST_MODE), .C(i_TEST_MODE));
PADIN ipad_SCAN_EN   (.PAD(SCAN_EN), .C(i_SCAN_EN));


PADOUT opad_Z0  (.I(i_Z[0]),  .PAD(Z[0]));
PADOUT opad_Z1  (.I(i_Z[1]),  .PAD(Z[1]));
PADOUT opad_Z2  (.I(i_Z[2]),  .PAD(Z[2]));
PADOUT opad_Z3  (.I(i_Z[3]),  .PAD(Z[3]));
PADOUT opad_Z4  (.I(i_Z[4]),  .PAD(Z[4]));
PADOUT opad_Z5  (.I(i_Z[5]),  .PAD(Z[5]));
PADOUT opad_Z6  (.I(i_Z[6]),  .PAD(Z[6]));
PADOUT opad_Z7  (.I(i_Z[7]),  .PAD(Z[7]));
PADOUT opad_Z8  (.I(i_Z[8]),  .PAD(Z[8]));
PADOUT opad_Z9  (.I(i_Z[9]),  .PAD(Z[9]));
PADOUT opad_Z10 (.I(i_Z[10]),  .PAD(Z[10]));
PADOUT opad_Z11 (.I(i_Z[11]),  .PAD(Z[11]));

// U18 pad
//XMD ipad_CLK   (.I(CLK), .O(i_CLK), .PU(1'b0), .PD(1'b0), .SMT(1'b1));
//XMD ipad_HALT  (.I(HALT), .O(i_HALT), .PU(1'b0), .PD(1'b0), .SMT(1'b1));
//XMD ipad_RESET_(.I(RESET_),.O(i_RESET_), .PU(1'b0), .PD(1'b0), .SMT(1'b1));
//XMD ipad_DoDCT (.I(DoDCT), .O(i_DoDCT), .PU(1'b0), .PD(1'b0), .SMT(1'b1));
//XMD ipad_Mode  (.I(Mode), .O(i_Mode), .PU(1'b0), .PD(1'b0), .SMT(1'b1));
//XMD ipad_X0    (.I(X[0]), .O(i_X[0]), .PU(1'b0), .PD(1'b0), .SMT(1'b1));
//XMD ipad_X1    (.I(X[1]), .O(i_X[1]), .PU(1'b0), .PD(1'b0), .SMT(1'b1));
//XMD ipad_X2    (.I(X[2]), .O(i_X[2]), .PU(1'b0), .PD(1'b0), .SMT(1'b1));
//XMD ipad_X3    (.I(X[3]), .O(i_X[3]), .PU(1'b0), .PD(1'b0), .SMT(1'b1));
//XMD ipad_X4    (.I(X[4]), .O(i_X[4]), .PU(1'b0), .PD(1'b0), .SMT(1'b1));
//XMD ipad_X5    (.I(X[5]), .O(i_X[5]), .PU(1'b0), .PD(1'b0), .SMT(1'b1));
//XMD ipad_X6    (.I(X[6]), .O(i_X[6]), .PU(1'b0), .PD(1'b0), .SMT(1'b1));
//XMD ipad_X7    (.I(X[7]), .O(i_X[7]), .PU(1'b0), .PD(1'b0), .SMT(1'b1));
//XMD ipad_X8    (.I(X[8]), .O(i_X[8]), .PU(1'b0), .PD(1'b0), .SMT(1'b1));
//XMD ipad_X9    (.I(X[9]), .O(i_X[9]), .PU(1'b0), .PD(1'b0), .SMT(1'b1));
//XMD ipad_X10   (.I(X[10]), .O(i_X[10]), .PU(1'b0), .PD(1'b0), .SMT(1'b1));
//XMD ipad_X11   (.I(X[11]), .O(i_X[11]), .PU(1'b0), .PD(1'b0), .SMT(1'b1));
//XMD ipad_TEST_MODE   (.I(TEST_MODE), .O(i_TEST_MODE), .PU(1'b0), .PD(1'b0), .SMT(1'b1));
//XMD ipad_SCAN_EN   (.I(SCAN_EN), .O(i_SCAN_EN), .PU(1'b0), .PD(1'b0), .SMT(1'b1));
//
//YA2GSD opad_Z0  (.I(i_Z[0]),  .O(Z[0]), .E(1'b1), .E2(1'b1), .E4(1'b1), .E8(1'b0), .SR(1'b1));
//YA2GSD opad_Z1  (.I(i_Z[1]),  .O(Z[1]), .E(1'b1), .E2(1'b1), .E4(1'b1), .E8(1'b0), .SR(1'b1));
//YA2GSD opad_Z2  (.I(i_Z[2]),  .O(Z[2]), .E(1'b1), .E2(1'b1), .E4(1'b1), .E8(1'b0), .SR(1'b1));
//YA2GSD opad_Z3  (.I(i_Z[3]),  .O(Z[3]), .E(1'b1), .E2(1'b1), .E4(1'b1), .E8(1'b0), .SR(1'b1));
//YA2GSD opad_Z4  (.I(i_Z[4]),  .O(Z[4]), .E(1'b1), .E2(1'b1), .E4(1'b1), .E8(1'b0), .SR(1'b1));
//YA2GSD opad_Z5  (.I(i_Z[5]),  .O(Z[5]), .E(1'b1), .E2(1'b1), .E4(1'b1), .E8(1'b0), .SR(1'b1));
//YA2GSD opad_Z6  (.I(i_Z[6]),  .O(Z[6]), .E(1'b1), .E2(1'b1), .E4(1'b1), .E8(1'b0), .SR(1'b1));
//YA2GSD opad_Z7  (.I(i_Z[7]),  .O(Z[7]), .E(1'b1), .E2(1'b1), .E4(1'b1), .E8(1'b0), .SR(1'b1));
//YA2GSD opad_Z8  (.I(i_Z[8]),  .O(Z[8]), .E(1'b1), .E2(1'b1), .E4(1'b1), .E8(1'b0), .SR(1'b1));
//YA2GSD opad_Z9  (.I(i_Z[9]),  .O(Z[9]), .E(1'b1), .E2(1'b1), .E4(1'b1), .E8(1'b0), .SR(1'b1));
//YA2GSD opad_Z10 (.I(i_Z[10]),  .O(Z[10]), .E(1'b1), .E2(1'b1), .E4(1'b1), .E8(1'b0), .SR(1'b1));
//YA2GSD opad_Z11 (.I(i_Z[11]),  .O(Z[11]), .E(1'b1), .E2(1'b1), .E4(1'b1), .E8(1'b0), .SR(1'b1));
  
endmodule                                                             
