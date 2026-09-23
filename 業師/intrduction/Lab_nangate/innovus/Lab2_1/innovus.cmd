#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Fri May 19 11:33:37 2023                
#                                                     
#######################################################

#@(#)CDS: Innovus v21.13-s100_1 (64bit) 03/04/2022 14:32 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 21.13-s100_1 NR220220-0140/21_13-UB (database version 18.20.572) {superthreading v2.17}
#@(#)CDS: AAE 21.13-s034 (64bit) 03/04/2022 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 21.13-s042_1 () Mar  4 2022 08:38:36 ( )
#@(#)CDS: SYNTECH 21.13-s014_1 () Feb 17 2022 23:50:03 ( )
#@(#)CDS: CPE v21.13-s074
#@(#)CDS: IQuantus/TQuantus 20.1.2-s656 (64bit) Tue Nov 9 23:11:16 PST 2021 (Linux 2.6.32-431.11.2.el6.x86_64)

setLibraryUnit -cap 1pf
set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
encMessage warning 0
encMessage debug 0
is_common_ui_mode
restoreDesign /home/111-2/C108110249/lab1/Lab_nangate/innovus/Lab2_1/DBS/powerplan_fixdrc.enc.dat CHIP
setDrawView fplan
encMessage warning 1
encMessage debug 0
setLayerPreference layerBlk -isVisible 0
createBasicPathGroups -expanded
place_opt_design
setDrawView ameba
setDrawView place
setDrawView fplan
setDrawView place
checkPlace CHIP.checkPlace
setDrawView place
fit
saveDesign DBS/place.enc
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -preCTS
saveDesign DBS/pre-cts.enc
