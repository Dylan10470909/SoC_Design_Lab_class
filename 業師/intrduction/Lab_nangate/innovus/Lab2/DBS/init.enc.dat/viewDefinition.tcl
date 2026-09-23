if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name lib_typ\
   -timing\
    [list ${::IMEX::libVar}/mmmc/NangateOpenCellLibrary_typical.lib\
    ${::IMEX::libVar}/mmmc/rf_2p_hse_nldm_tt_0p90v_0p90v_25c_syn.lib\
    ${::IMEX::libVar}/mmmc/tpz_typ.lib]\
   -si\
    [list ${::IMEX::libVar}/mmmc/typical.cdb]
create_library_set -name lib_min\
   -timing\
    [list ${::IMEX::libVar}/mmmc/NangateOpenCellLibrary_fast.lib\
    ${::IMEX::libVar}/mmmc/rf_2p_hse_nldm_ff_0p99v_0p99v_m40c_syn.lib\
    ${::IMEX::libVar}/mmmc/tpz_fast.lib]\
   -si\
    [list ${::IMEX::libVar}/mmmc/fast.cdb]
create_library_set -name lib_max\
   -timing\
    [list ${::IMEX::libVar}/lib/typ/NangateOpenCellLibrary_slow.lib\
    ${::IMEX::libVar}/lib/typ/rf_2p_hse_nldm_ss_0p81v_0p81v_125c_syn.lib\
    ${::IMEX::libVar}/lib/typ/tpz_slow.lib]\
   -si\
    [list ${::IMEX::libVar}/mmmc/slow.cdb]
create_rc_corner -name RC_typ\
   -cap_table ${::IMEX::libVar}/mmmc/typical.captbl\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -qx_tech_file ${::IMEX::libVar}/mmmc/RC_typ/typical.tch
create_rc_corner -name RC_best\
   -cap_table ${::IMEX::libVar}/mmmc/best.captbl\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -qx_tech_file ${::IMEX::libVar}/mmmc/RC_best/best.tch
create_rc_corner -name RC_worst\
   -cap_table ${::IMEX::libVar}/mmmc/worst.captbl\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -qx_tech_file ${::IMEX::libVar}/mmmc/RC_worst/worst.tch
create_delay_corner -name DC_typ\
   -library_set lib_typ\
   -rc_corner RC_typ
create_delay_corner -name DC_min\
   -library_set lib_min\
   -rc_corner RC_best
create_delay_corner -name DC_max\
   -library_set lib_max\
   -rc_corner RC_worst
create_constraint_mode -name CM_func\
   -sdc_files\
    [list ${::IMEX::libVar}/mmmc/CHIP_func.sdc]
create_constraint_mode -name CM_scan\
   -sdc_files\
    [list ${::IMEX::libVar}/mmmc/CHIP_scan.sdc]
create_analysis_view -name AV_func_max -constraint_mode CM_func -delay_corner DC_max
create_analysis_view -name AV_scan_typ -constraint_mode CM_scan -delay_corner DC_typ
create_analysis_view -name AV_scan_min -constraint_mode CM_scan -delay_corner DC_min
create_analysis_view -name AV_scan_max -constraint_mode CM_scan -delay_corner DC_max
create_analysis_view -name AV_func_typ -constraint_mode CM_func -delay_corner DC_typ
create_analysis_view -name AV_func_min -constraint_mode CM_func -delay_corner DC_min
set_analysis_view -setup [list AV_func_max AV_func_typ AV_scan_max AV_scan_typ] -hold [list AV_func_min AV_scan_min]
