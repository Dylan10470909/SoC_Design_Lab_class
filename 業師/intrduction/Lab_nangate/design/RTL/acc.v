module ACC (RESET_, CLK, ACCin, HALT, Count, accout);
parameter inputsize = 12;
parameter blocksize=8;
parameter frac2=6;  //6
parameter frac3=4;

parameter countersize=2; // log(blocksize/2)
parameter adrsize=6; // 2*log(blocksize) 

input   RESET_, CLK;
input   [inputsize+1+frac2:0] ACCin; //6 bit fraction
input   [countersize-1:0] Count;
input   HALT;

output  [inputsize+1+frac3:0]  accout;
reg     [inputsize+1+frac3:0]  accout;

reg [inputsize+1+frac2:0] Z1,Z2;
wire [inputsize+1+frac2:0] node2;
wire [inputsize+1+frac2:0] rn;   // 6 bit fraction

always @(posedge CLK)
begin
    if(HALT == 1'b0)
    begin
        Z1 <= (Count == 2'd0)? 0 : ACCin ;
        Z2 <= (Count == 2'd0)? rn: 0 ;
    end
end

always @(posedge CLK)
begin
    if((HALT == 1'b0)&&(Count == 2))
    begin
        accout <= rn[inputsize+1+frac2:frac2-frac3];
    end
end

add_pipe1 adder1(Z1,ACCin,CLK,node2,HALT);
add_pipe1 adder2(Z2,node2,CLK,rn,HALT);
endmodule

module add_pipe1(A,B,CLK,Sum,HALT);
parameter inputsize = 12;
parameter frac2=6;  //6
parameter frac3=4;
input [inputsize+1+frac2:0] A,B;
input CLK;
input HALT;
output [inputsize+1+frac2:0] Sum;

parameter pipe_cut=(inputsize+1+frac2+1)/2;

reg C1;
reg [inputsize+1+frac2-pipe_cut-1:0] APreS2;
reg [inputsize+1+frac2-pipe_cut-1:0] BPreS2;
reg [pipe_cut:0] PostS1;

always @(posedge CLK)
begin
    if(HALT == 1'b0)
    begin
        {C1,PostS1} <= A[pipe_cut:0]+B[pipe_cut:0];
        APreS2 <= A[inputsize+1+frac2:pipe_cut+1];
        BPreS2 <= B[inputsize+1+frac2:pipe_cut+1];
    end
end

assign Sum[inputsize+1+frac2:pipe_cut+1] = APreS2 + BPreS2 + C1;
assign Sum[pipe_cut:0] = PostS1 ;
endmodule

