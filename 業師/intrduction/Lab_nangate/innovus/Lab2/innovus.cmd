#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Fri May 12 11:39:05 2023                
#                                                     
#######################################################

#@(#)CDS: Innovus v21.13-s100_1 (64bit) 03/04/2022 14:32 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 21.13-s100_1 NR220220-0140/21_13-UB (database version 18.20.572) {superthreading v2.17}
#@(#)CDS: AAE 21.13-s034 (64bit) 03/04/2022 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 21.13-s042_1 () Mar  4 2022 08:38:36 ( )
#@(#)CDS: SYNTECH 21.13-s014_1 () Feb 17 2022 23:50:03 ( )
#@(#)CDS: CPE v21.13-s074
#@(#)CDS: IQuantus/TQuantus 20.1.2-s656 (64bit) Tue Nov 9 23:11:16 PST 2021 (Linux 2.6.32-431.11.2.el6.x86_64)

set init_remove_assigns 1
setLibraryUnit -cap 1pf
set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
encMessage warning 0
encMessage debug 0
is_common_ui_mode
restoreDesign /home/111-2/C108110249/lab1/Lab_nangate/innovus/Lab2/DBS/init.enc.dat CHIP
setDrawView fplan
encMessage warning 1
encMessage debug 0
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site FreePDK45_38x28_10R_NP_162NW_34O -r 1 0.7 50 50 50 50
uiSetTool select
getIoFlowFlag
fit
setDrawView fplan
setDrawView fplan
zoomOut
selectObject Module u_DCT
place_design -concurrent_macros
uiSetTool move
selectObject Module u_DCT
setObjFPlanBox Module u_DCT -394.826 3.717 -197.366 201.177
uiSetTool move
uiSetTool select
deselectAll
selectObject Module u_DCT
deselectAll
selectObject Module u_IDCT
deselectAll
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer metal10 -stacked_via_bottom_layer metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type core_rings -follow core -layer {top metal1 bottom metal1 left metal2 right metal2} -width {top 3 bottom 3 left 3 right 3} -spacing {top 1.5 bottom 1.5 left 1.5 right 1.5} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None -use_wire_group 1 -use_wire_group_bits 5 -use_interleaving_wire_group 1
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer metal10 -stacked_via_bottom_layer metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type core_rings -follow core -layer {top metal1 bottom metal1 left metal2 right metal2} -width {top 3 bottom 3 left 3 right 3} -spacing {top 1.5 bottom 1.5 left 1.5 right 1.5} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None -use_wire_group 1 -use_wire_group_bits 5 -use_interleaving_wire_group 1
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer metal10 -stacked_via_bottom_layer metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type core_rings -follow core -layer {top metal1 bottom metal1 left metal2 right metal2} -width {top 3 bottom 3 left 3 right 3} -spacing {top 1.5 bottom 1.5 left 1.5 right 1.5} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None -use_wire_group 1 -use_wire_group_bits 5 -use_interleaving_wire_group 1
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer metal10 -stacked_via_bottom_layer metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type core_rings -follow core -layer {top metal5 bottom metal5 left metal4 right metal4} -width {top 3 bottom 3 left 3 right 3} -spacing {top 1.5 bottom 1.5 left 1.5 right 1.5} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None -use_wire_group 1 -use_wire_group_bits 5 -use_interleaving_wire_group 1
undo
selectWire 204.3600 535.9200 575.0200 538.9200 1 VSS
deleteSelectedFromFPlan
selectWire 208.8600 567.4200 570.5200 570.4200 1 VDD
deselectAll
gui_select -rect {439.86550 568.09100 428.71550 501.19050}
