 // ** FILE : SynTest SRAM BIST memory wrapper file
 // ** NAME : RF_2P_ADV64x16_wrapper.v
 // ** TOOL : srambist V1.4.8 (05/24/04 1185) Solaris
 // ** TIME : Thu Sep 30 14:16:48 2004


`timescale 1ns / 10ps

 module RF_2P_ADV64x16_wrapper_RF_2P_ADV64x16 ( CLKA , CENA , QA , AA , CLKB , CENB , DB ,
 AB , mem_ctrl , bist_ctrl ) ;
 input CLKA ;
 input CENA ;
 output [ 15 : 0 ] QA ;
 input [ 5 : 0 ] AA ;
 input CLKB ;
 input CENB ;
 input [ 15 : 0 ] DB ;
 input [ 5 : 0 ] AB ;
 input [ 1 : 0 ] mem_ctrl ;
 input [ 22 : 0 ] bist_ctrl ;

 wire [ 5 : 0 ] BIST_A ;
 wire [ 15 : 0 ] BIST_D ;
 wire BistMode ;
 wire CENA_n ;
 wire [ 15 : 0 ] QA_n ;
 wire [ 5 : 0 ] AA_n ;

 wire CENB_n ;
 wire [ 15 : 0 ] DB_n ;
 wire [ 5 : 0 ] AB_n ;


 assign BIST_A =  bist_ctrl [ 5 : 0 ] ;
 assign BIST_D =  bist_ctrl [ 21 : 6 ] ;
 assign BistMode =  bist_ctrl [ 22 ] ;

 assign CENA_n =  ( BistMode ) ? mem_ctrl [ 1 ] : CENA ;
// for u18 mem
// assign CENA_n =  ( BistMode ) ? mem_ctrl [ 1 ] : ~CENA ;
 assign AA_n =  ( BistMode ) ? BIST_A : AA ;
 assign QA =  QA_n ;
 assign CENB_n =  ( BistMode ) ? mem_ctrl [ 0 ] : CENB ;
// for u18 mem
// assign CENB_n =  ( BistMode ) ? mem_ctrl [ 0 ] : ~CENB ;
 assign DB_n =  ( BistMode ) ? BIST_D : DB ;
 assign AB_n =  ( BistMode ) ? BIST_A : AB ;

//virutal memory
//RF_2P_ADV64_16 SRAM_i0 (
//.CLKA ( CLKA ) ,
//.CENA ( CENA_n ) ,
//.QA ( QA_n ) ,
//.AA ( AA_n ) ,
//.CLKB ( CLKB ) ,
//.CENB ( CENB_n ) ,
//.DB ( DB_n ) ,
//.AB ( AB_n ) ,
//.EMAA (3'b0),
//.EMAB (3'b0)
//) ;


rf_2p_hse SRAM_i0 (
     .CENYA(), .CENA(CENA_n), .AA(AA_n), .QA(QA_n), .CLKA(CLKA), .AYA(), 
     .CENYB(), .CENB(CENB_n), .AB(AB_n), .DB(DB_n), .CLKB(CLKB), .AYB(), .DYB(),  
    .EMAA(3'b0), .EMASA(1'b0), .EMAB(3'b0), .EMAWB(2'b0), 
    .TENA(1'b1), .TCENA(1'b0), .TAA(6'b0), .TQA(16'b0), .BENA(1'b1), 
    .TENB(1'b1), .TCENB(1'b0), .TAB(6'b0), .TDB(16'b0),
    .RET1N(1'b1), .STOVA(1'b0), .STOVB(1'b0), .COLLDISN(1'b0));

//U18 memory
//SJMA180_64X16X1BM1 SRAM_i0 (.A0(AA_n[0]),.A1(AA_n[1]),.A2(AA_n[2]),.A3(AA_n[3]),.A4(AA_n[4]),.A5(AA_n[5]),
//                           .B0(AB_n[0]),.B1(AB_n[1]),.B2(AB_n[2]),.B3(AB_n[3]),.B4(AB_n[4]),.B5(AB_n[5]),
//                          .DOA0(QA_n[0]),.DOA1(QA_n[1]),.DOA2(QA_n[2]),.DOA3(QA_n[3]),
//                          .DOA4(QA_n[4]),.DOA5(QA_n[5]),.DOA6(QA_n[6]),.DOA7(QA_n[7]),
//                          .DOA8(QA_n[8]),.DOA9(QA_n[9]),.DOA10(QA_n[10]),.DOA11(QA_n[11]),
//                          .DOA12(QA_n[12]),.DOA13(QA_n[13]),.DOA14(QA_n[14]),.DOA15(QA_n[15]),
//                          .DOB0(), .DOB1(),.DOB2(),.DOB3(),.DOB4(),.DOB5(),.DOB6(),.DOB7(),
//                          .DOB8(), .DOB9(),.DOB10(),.DOB11(),.DOB12(),.DOB13(),.DOB14(),.DOB15(),
//                          .DIA0(1'b0),.DIA1(1'b0),.DIA2(1'b0),.DIA3(1'b0),
//                          .DIA4(1'b0),.DIA5(1'b0),.DIA6(1'b0),.DIA7(1'b0),
//                          .DIA8(1'b0),.DIA9(1'b0),.DIA10(1'b0),.DIA11(1'b0),
//                          .DIA12(1'b0),.DIA13(1'b0),.DIA14(1'b0),.DIA15(1'b0),
//                          .DIB0(DB_n[0]),.DIB1(DB_n[1]),.DIB2(DB_n[2]),.DIB3(DB_n[3]),
//                          .DIB4(DB_n[4]),.DIB5(DB_n[5]),.DIB6(DB_n[6]),.DIB7(DB_n[7]),
//                          .DIB8(DB_n[8]),.DIB9(DB_n[9]),.DIB10(DB_n[10]),.DIB11(DB_n[11]),
//                          .DIB12(DB_n[12]),.DIB13(DB_n[13]),.DIB14(DB_n[14]),.DIB15(DB_n[15]),
//                          .WEAN(1'b1),.WEBN(1'b0),
//                          .CKA(CLKA),.CKB(CLKB),.CSA(CENA_n),.CSB(CENA_n),.OEA(1'b1),.OEB(1'b0));
//
 endmodule



