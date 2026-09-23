 // ** FILE : SynTest SRAM BIST CONTROLLER file
 // ** NAME : RF_2P_ADV64x16_rb.v
 // ** TOOL : srambist V1.4.8 (05/24/04 1185) Solaris
 // ** TIME : Thu Sep 30 14:16:48 2004


`timescale 1ns / 10ps

 module ST_MAG_RF_2P_ADV64x16 ( Tclk , BistMode , S0 , S1 , S2 ,
 S3 , S4 ) ;

 input Tclk ;
 input BistMode ;
 output [ 5 : 0 ] S0 ;
 input S1 ;
 output S2 ;
 output S3 ;
 input S4 ;

 reg [ 5 : 0 ] S5 ;
 reg [ 5 : 0 ] S6 ;

 assign S0 = S5 ;

 always @ ( negedge Tclk )
 begin
 if ( BistMode == 1'b0 ) begin
 S5 <= # 1 6'b000000 ;
 end
 else begin
 S5 <= # 1 S6 ;
 end

 end

 always @ ( S4 or S1 or S5 )
 begin
 case ( { S4 , S1 } )
 2'b10 : S6 = S5 - 1 ;
 2'b11 : S6 = S5 + 1 ;
 default : S6 = S5 ;
 endcase

 end

 assign S2 = ( S5 == 6'b111111 ) ;
 assign S3 = ( S5 == 6'b000000 ) ;

 endmodule

 module ST_MPG_RF_2P_ADV64x16 ( S7 , S8 , S9 ) ;
 output [ 15 : 0 ] S7 ;
 input [ 1 : 0 ] S8 ;
 input S9 ;

 reg [ 15 : 0 ] S10 ;
 wire [ 2 : 0 ] S11 ;

 assign S7 = S10 ;

 assign S11 = { S8 , S9 } ;

 always @ ( S11 )
 case ( S11 )
 3'b000 : S10 = 16'h0000 ;
 3'b001 : S10 = 16'hffff ;
 3'b010 : S10 = 16'h5555 ;
 3'b011 : S10 = 16'haaaa ;
 3'b100 : S10 = 16'h3333 ;
 3'b101 : S10 = 16'hcccc ;
 3'b110 : S10 = 16'h0f0f ;
 3'b111 : S10 = 16'hf0f0 ;
 default : S10 = 16'h0000 ;
 endcase

 endmodule

 module ST_MAL_RF_2P_ADV64x16 ( Tclk , BistMode , BistFail , S12 , S13 ,
 S14 , ErrMap ) ;
 input Tclk ;
 input BistMode ;
 output BistFail ;
 input S12 ;
 input [ 15 : 0 ] S13 ;
 input [ 15 : 0 ] S14 ;
 output ErrMap ;


 reg S15 ;
 reg S16 ;
 reg S17 ;

 assign ErrMap = S16 ;
 assign BistFail = S17 ;

 always @ ( S13 or S14 )
 begin
 if ( S13 == S14 )
 S15 = 1'b0 ;
 else
 S15 = 1'b1 ;

 end

 always @ ( negedge Tclk )
 begin
 if ( BistMode == 1'b0 ) begin
 S16 <= # 1 1'b0 ;
 S17 <= # 1 1'b0 ;
 end
 else begin
 if ( S12 == 1'b1 ) begin
 S16 <= # 1 S15 ;
 end
 else begin
 S16 <= # 1 1'b0 ;
 end

 if ( S16 == 1'b1 )
 S17 <= # 1 1'b1 ;
 end
 end

 endmodule

 module ST_MTC_RF_2P_ADV64x16 ( Tclk , BistMode , S18 , S19 , S4 ,
 S2 , S3 , S1 , S8 ,
 S9 , S12 , Finish ) ;

 input Tclk ;
 input BistMode ;
 output S18 ;
 output S19 ;
 output S4 ;
 input S2 ;
 input S3 ;
 output S1 ;
 output [ 1 : 0 ] S8 ;
 output S9 ;
 output S12 ;
 output Finish ;

 reg [ 1 : 0 ] S20 ;
 wire S21 ;
 reg S4 ;
 reg S1 ;
 reg S12 ;
 reg S9 ;
 reg Finish ;
 reg S22 ;
 reg S18 ;
 reg S19 ;

 parameter
 S23 = 4'b0000 ,
 S24 = 4'b0001 ,
 S25 = 4'b0010 ,
 S26 = 4'b0011 ,
 S27 = 4'b0100 ,
 S28 = 4'b0101 ,
 S29 = 4'b0110 ,
 S30 = 4'b0111 ,
 S31 = 4'b1000 ,
 S32 = 4'b1001 ,
 S33 = 4'b1010 ,
 S34 = 4'b1011 ,
 S35 = 4'b1100 ;

 reg [ 3 : 0 ] State , NextState ;

 always @ ( negedge Tclk )
 begin
 if ( BistMode == 1'b0 ) begin
 State <= # 1 S23 ;
 end
 else begin
 State <= # 1 NextState ;
 end
 end

 assign S8 = S20 ;
 assign S21 = ( S20 == 2'b11 ) ? 1'b1 : 1'b0 ;

 always @ ( negedge Tclk )
 begin
 if ( BistMode == 1'b0 ) begin
 Finish <= # 1 1'b0 ;
 S20 <= # 1 2'b00 ;
 end
 else begin
 Finish <= # 1 S22 ;
 if ( State == S34 )
 S20 <= # 1 S20 + 1 ;
 else
 S20 <= S20 ;
 end
 end

 always @ ( S2 or S3 or State or S21 )
 begin
 case ( State )

 S23 : begin
 NextState = S24 ;
 S4 = 1'b0 ;
 S18 = 1'b1 ;
 S19 = 1'b0 ;
 S9 = 1'b0 ;
 S1 = 1'b1 ;
 S12 = 1'b0 ;
 S22 = 1'b0 ;
 end
 S24 : begin
 NextState = ( S2 ) ? S25 : S24 ;
 S4 = 1'b1 ;
 S18 = 1'b1 ;
 S19 = 1'b0 ;
 S9 = 1'b0 ;
 S1 = 1'b1 ;
 S12 = 1'b0 ;
 S22 = 1'b0 ;
 end
 S25 : begin
 NextState = S26 ;
 S4 = 1'b0 ;
 S18 = 1'b0 ;
 S19 = 1'b1 ;
 S9 = 1'b0 ;
 S1 = 1'b1 ;
 S12 = 1'b1 ;
 S22 = 1'b0 ;
 end
 S26 : begin
 NextState = ( S2 ) ? S27 : S25 ;
 S4 = 1'b1 ;
 S18 = 1'b1 ;
 S19 = 1'b0 ;
 S9 = 1'b1 ;
 S1 = 1'b1 ;
 S12 = 1'b0 ;
 S22 = 1'b0 ;
 end
 S27 : begin
 NextState = S28 ;
 S4 = 1'b0 ;
 S18 = 1'b0 ;
 S19 = 1'b1 ;
 S9 = 1'b1 ;
 S1 = 1'b1 ;
 S12 = 1'b1 ;
 S22 = 1'b0 ;
 end
 S28 : begin
 NextState = ( S2 ) ? S29 : S27 ;
 S4 = ~ S2 ;
 S18 = 1'b1 ;
 S19 = 1'b0 ;
 S9 = 1'b0 ;
 S1 = 1'b1 ;
 S12 = 1'b0 ;
 S22 = 1'b0 ;
 end
 S29 : begin
 NextState = S30 ;
 S4 = 1'b0 ;
 S18 = 1'b0 ;
 S19 = 1'b1 ;
 S9 = 1'b0 ;
 S1 = 1'b0 ;
 S12 = 1'b1 ;
 S22 = 1'b0 ;
 end
 S30 : begin
 NextState = ( S3 ) ? S31 : S29 ;
 S4 = 1'b1 ;
 S18 = 1'b1 ;
 S19 = 1'b0 ;
 S9 = 1'b1 ;
 S1 = 1'b0 ;
 S12 = 1'b0 ;
 S22 = 1'b0 ;
 end
 S31 : begin
 NextState = S32 ;
 S4 = 1'b0 ;
 S18 = 1'b0 ;
 S19 = 1'b1 ;
 S9 = 1'b1 ;
 S1 = 1'b0 ;
 S12 = 1'b1 ;
 S22 = 1'b0 ;
 end
 S32 : begin
 NextState = ( S3 ) ? S33 : S31 ;
 S4 = 1'b1 ;
 S18 = 1'b1 ;
 S19 = 1'b0 ;
 S9 = 1'b0 ;
 S1 = 1'b0 ;
 S12 = 1'b0 ;
 S22 = 1'b0 ;
 end
 S33 : begin
 NextState = ( S3 ) ? S34 : S33 ;
 S4 = ~ S3 ;
 S18 = 1'b0 ;
 S19 = 1'b1 ;
 S9 = 1'b0 ;
 S1 = 1'b0 ;
 S12 = 1'b1 ;
 S22 = 1'b0 ;
 end
 S34 : begin
 NextState = ( S21 ) ? S35 : S24 ;
 S4 = 1'b0 ;
 S18 = 1'b0 ;
 S19 = 1'b1 ;
 S9 = 1'b0 ;
 S1 = 1'b0 ;
 S12 = 1'b0 ;
 S22 = 1'b0 ;
 end
 S35 : begin
 NextState = S35 ;
 S4 = 1'b0 ;
 S18 = 1'b0 ;
 S19 = 1'b1 ;
 S9 = 1'b0 ;
 S1 = 1'b0 ;
 S12 = 1'b0 ;
 S22 = 1'b1 ;
 end
 default : begin
 NextState = S23 ;
 S4 = 1'b0 ;
 S18 = 1'b0 ;
 S19 = 1'b1 ;
 S9 = 1'b0 ;
 S1 = 1'b0 ;
 S12 = 1'b0 ;
 S22 = 1'b0 ;
 end
 endcase
 end

 endmodule

 module BistCtrl_RF_2P_ADV64x16 ( Tclk , mem_ctrl , QA_i , bist_ctrl , BistFail ,
 ErrMap , Finish , BistMode ) ;

 input Tclk ;
 output [ 1 : 0 ] mem_ctrl ;
 input [ 15 : 0 ] QA_i ;
 output [ 22 : 0 ] bist_ctrl ;
 output BistFail ;
 output ErrMap ;
 output Finish ;
 input BistMode ;

 wire [ 5 : 0 ] BIST_A ;
 wire [ 15 : 0 ] BIST_D ;
 wire [ 1 : 0 ] S36 ;
 wire S37 ;
 wire S38 ;
 wire S39 ;
 wire S40 ;
 wire S41 ;
 wire S42 ;
 wire S17 ;

 assign bist_ctrl [ 5 : 0 ] = BIST_A ;
 assign bist_ctrl [ 21 : 6 ] = BIST_D ;
 assign bist_ctrl [ 22 ] = BistMode ;
 assign BistFail = S17 ;

 ST_MAG_RF_2P_ADV64x16 S43 (
 .Tclk ( Tclk ) ,
 .BistMode ( BistMode ) ,
 .S0 ( BIST_A ) ,
 .S1 ( S38 ) ,
 .S2 ( S40 ) ,
 .S3 ( S41 ) ,
 .S4 ( S39 )
 ) ;

 ST_MPG_RF_2P_ADV64x16 ST_MPG_i0 (
 .S7 ( BIST_D ) ,
 .S8 ( S36 ) ,
 .S9 ( S37 )
 ) ;

 ST_MAL_RF_2P_ADV64x16 ST_MAL_i0 (
 .Tclk ( Tclk ) ,
 .BistMode ( BistMode ) ,
 .BistFail ( S17 ) ,
 .S12 ( S42 ) ,
 .S13 ( BIST_D ) ,
 .S14 ( QA_i ) ,
 .ErrMap ( ErrMap )
 ) ;

 ST_MTC_RF_2P_ADV64x16 S44 (
 .Tclk ( Tclk ) ,
 .BistMode ( BistMode ) ,
 .S18 ( mem_ctrl [ 1 ] ) ,
 .S19 ( mem_ctrl [ 0 ] ) ,
 .S4 ( S39 ) ,
 .S2 ( S40 ) ,
 .S3 ( S41 ) ,
 .S1 ( S38 ) ,
 .S8 ( S36 ) ,
 .S9 ( S37 ) ,
 .S12 ( S42 ) ,
 .Finish ( Finish )
 ) ;

 endmodule

