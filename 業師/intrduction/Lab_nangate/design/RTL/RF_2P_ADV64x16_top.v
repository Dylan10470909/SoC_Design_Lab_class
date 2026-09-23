
 // ** FILE : SynTest SRAM BIST top module file
 // ** NAME : RF_2P_ADV64x16_top.v
 // ** TOOL : srambist V1.4.8 (05/24/04 1185) Solaris
 // ** TIME : Thu Sep 30 14:16:48 2004


`timescale 1ns / 10ps

 module Bisted_RF_2P_ADV64x16 ( CLKA , CENA , QA , AA , CLKB , CENB , DB , AB , BistFail ,
 ErrMap , Finish , BistMode ) ;
 input CLKA ;
 input CENA ;
 output [ 15 : 0 ] QA ;
 input [ 5 : 0 ] AA ;
 input CLKB ;
 input CENB ;
 input [ 15 : 0 ] DB ;
 input [ 5 : 0 ] AB ;
 output BistFail ;
 output ErrMap ;
 output Finish ;
 input BistMode ;

 wire [ 1 : 0 ] mem_ctrl_n ;
 wire [ 15 : 0 ] QA_n ;
 wire [ 22 : 0 ] bist_ctrl_n ;


 assign QA = QA_n ;

 BistCtrl_RF_2P_ADV64x16 BistCtrl_i0 (
 .Tclk ( CLKA ) ,
 .mem_ctrl ( mem_ctrl_n ) ,
 .QA_i ( QA_n ) ,
 .bist_ctrl ( bist_ctrl_n ) ,
 .BistFail ( BistFail ) ,
 .ErrMap ( ErrMap ) ,
 .Finish ( Finish ) ,
 .BistMode ( BistMode )
 ) ;

 RF_2P_ADV64x16_wrapper_RF_2P_ADV64x16 RF_2P_ADV64x16_u0 (
 .CLKA ( CLKA ) ,
 .CENA ( CENA ) ,
 .AA ( AA ) ,
 .QA ( QA_n ) ,
 .CLKB ( CLKB ) ,
 .CENB ( CENB ) ,
 .DB ( DB ) ,
 .AB ( AB ) ,
 .mem_ctrl ( mem_ctrl_n ) ,
 .bist_ctrl ( bist_ctrl_n )
 ) ;



 endmodule

