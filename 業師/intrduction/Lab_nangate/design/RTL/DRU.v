

module DRU (X,Y,ToBDEG,ToACF,CLK,HALT,DoDCT,RESET_);

parameter inputsize = 12;
parameter blocksize=8;
parameter countersize=2; // log(blocksize/2)

input CLK,HALT,DoDCT,RESET_;
input [inputsize-1:0] X;
input [inputsize+3:0] Y;
output [inputsize+4:0] ToBDEG;
output [inputsize+4:0] ToACF; 
reg [inputsize+4:0] ToBDEG;
reg [inputsize+4:0] ToACF; 

reg [inputsize+3:0] LIFO [(blocksize/2)-1:0] ;
reg [countersize:0] Count;
wire IsXstate = ~Count[2];

always @(posedge CLK or negedge RESET_)
//always @(posedge CLK )
begin 
    if(RESET_==0) 
    begin 
        Count <=  #1 4;
    end 
    else if (! HALT) 
         begin 
             Count <= #1 Count+1;
         end 
end


//  control LIFO address
wire [countersize-1:0] LIFOaddr=(IsXstate==1)?Count:~Count;

//
//  data path specify
//
wire [inputsize+3:0] MUXAout = (IsXstate==0)?Y:{{2{X[inputsize-1]}},X,2'b0};
wire [inputsize+3:0] MUXBout = (IsXstate==1)?Y:{{2{X[inputsize-1]}},X,2'b0};

always @(posedge CLK)
begin
    if(!HALT)
    begin
        if(LIFOaddr == 0)   LIFO[0] <= #1 MUXBout;
        if(LIFOaddr == 1)   LIFO[1] <= #1 MUXBout;
        if(LIFOaddr == 2)   LIFO[2] <= #1 MUXBout;
        if(LIFOaddr == 3)   LIFO[3] <= #1 MUXBout;
    end
end

wire [inputsize+3:0] LIFOout = LIFO[LIFOaddr];

wire [inputsize+4:0] ADDout;
assign ADDout = {LIFOout[inputsize+1],LIFOout}+{MUXAout[inputsize+1],MUXAout};
wire [inputsize+4:0] SUBout;
assign SUBout = {LIFOout[inputsize+1],LIFOout}-{MUXAout[inputsize+1],MUXAout};
wire [inputsize+3:0] MUXCout = (Count[0] == 0)?  MUXAout:LIFOout;
wire [inputsize+3:0] MUXDout = (Count[0] == 1)?  MUXAout:LIFOout;

always @(posedge CLK)
begin
    if(!HALT)
    begin
        if(DoDCT == 1) 
        begin
            ToACF <= #1 ADDout;
            ToBDEG <= #1 SUBout;
        end
        else
        begin
            ToACF <=  {MUXCout[inputsize+3],MUXCout};
            ToBDEG <=  {MUXDout[inputsize+3],MUXDout};
        end
    end
end
endmodule
