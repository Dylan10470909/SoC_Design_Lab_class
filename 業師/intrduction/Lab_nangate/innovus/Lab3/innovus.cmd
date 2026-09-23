#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Fri Jun 12 14:44:46 2020                
#                                                     
#######################################################

#@(#)CDS: Innovus v19.12-s087_1 (64bit) 11/11/2019 17:32 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 19.12-s087_1 NR191024-1807/19_12-UB (database version 18.20, 485.7.1) {superthreading v1.51}
#@(#)CDS: AAE 19.12-s033 (64bit) 11/11/2019 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 19.12-s033_1 () Oct 24 2019 14:09:28 ( )
#@(#)CDS: SYNTECH 19.12-s008_1 () Oct  6 2019 23:25:36 ( )
#@(#)CDS: CPE v19.12-s079
#@(#)CDS: IQuantus/TQuantus 19.1.3-s095 (64bit) Fri Aug 30 18:16:09 PDT 2019 (Linux 2.6.32-431.11.2.el6.x86_64)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
encMessage warning 0
encMessage debug 0
encMessage info 0
is_common_ui_mode
restoreDesign /user/DSD/nschang/work/class/innovus/n/Lab_nangate/innovus/Lab7/DBS/postcts.enc.dat CHIP
setDrawView fplan
encMessage warning 1
encMessage debug 0
encMessage info 1
zoomBox 273.98200 263.19050 291.96750 240.40900
zoomBox 283.37300 251.94300 284.74300 249.26650
gui_select -rect {283.87650 250.86100 284.08950 250.94750}
zoomOut
zoomOut
zoomOut
zoomBox 268.03750 252.77750 271.27200 250.45300
zoomOut
zoomOut
zoomOut
zoomBox 296.82700 252.80100 299.65200 250.65450
zoomOut
zoomOut
zoomOut
zoomBox 281.41550 253.15800 285.75700 249.30950
setLayerPreference pinObj -isVisible 1
selectWire 284.0500 204.3200 284.4900 574.9200 6 VSS
deselectAll
gui_select -rect {283.89250 250.83750 284.72350 251.10750}
deleteSelectedFromFPlan
saveDesign DBS/postcts.enc
