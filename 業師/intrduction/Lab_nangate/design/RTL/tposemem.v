module tposemem (Datain,CLK,HALT,RESET_,Y,BistMode);
parameter inputsize = 12;
parameter blocksize=8;
parameter countersize=2; // log(blocksize/2)
parameter adrsize=6; //2*log(blocksize)
input [inputsize+3:0] Datain;
input CLK,HALT,RESET_,BistMode;
output [inputsize+3:0] Y;
wire [inputsize+3:0] Y;

wire [adrsize-1:0] Radr;

reg [adrsize-1:0] Count;
reg Transport;
wire BistFail, ErrMap , Finish , BistMode;

always @(posedge CLK)
begin 
    if(RESET_==0)
    begin
        Count <= #1 -3; 
        Transport <= #1 1;
    end
    else if (!HALT)
    begin
        {Transport,Count} <= #1 {Transport,Count} +1;
    end
end

assign #1 Radr = (Transport==0)? Count[adrsize-1:0]:
                        {Count[adrsize/2-1:0],Count[adrsize-1:adrsize/2]};
wire [adrsize-1:0] Count_d6 ;
assign Count_d6 = Count - 10; //
reg [adrsize-1:0] Wadr;
reg  Transport_d;
always @(posedge CLK)
begin
    if (!HALT)
    begin
        if(Transport_d==0)
            Wadr <= #1 Count_d6;
        else
            Wadr <= #1 {Count_d6[adrsize/2-1:0],Count_d6[adrsize-1:adrsize/2]};
    end
end

always @(posedge CLK)
begin
    if(RESET_ == 0)
        Transport_d <= #1 1;
    else if(HALT==0)
    begin
        if (|Count_d6 ==0)
            Transport_d <= #1 ~Transport_d;
    end
end


wire RWEN = HALT;                           
wire [inputsize+3:0] QA;
assign CLKB= ~CLK;
assign Y = (BistMode == 0)? QA:{QA[inputsize+3:3],ErrMap,Finish,BistFail};
Bisted_RF_2P_ADV64x16 Bisted_RF_2P_ADV64x16 ( .QA(QA), .AA(Radr), .CLKA(CLK), 
   .CENA(1'b0) , .AB(Wadr), .DB(Datain), .CLKB(CLKB), .CENB(1'b0), 
   .BistFail(BistFail), .ErrMap(ErrMap), .Finish(Finish), .BistMode(BistMode)); 
endmodule
