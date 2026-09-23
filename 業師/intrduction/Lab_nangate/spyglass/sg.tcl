read_file -type verilog { \
../design/RTL/acc.v  \
../design/RTL/acf.v  \
../design/RTL/bdeg.v  \
../design/RTL/CHIP.v  \
../design/RTL/DCT.v  \
../design/RTL/DRU.v  \
../design/RTL/IDRU.v  \
../design/RTL/RF_2P_ADV64x16_rb.v  \
../design/RTL/RF_2P_ADV64x16_top.v  \
../design/RTL/RF_2P_ADV64x16_wrapper.v  \
../design/RTL/timescale.v  \
../design/RTL/tposemem.v  \
../design/RTL/DW/DW02_mult.v  \
../design/RTL/DW/DW02_mult_3_stage.v  \
../design/RTL/DW/DW_mult_pipe.v}

read_file -type gateslib { \
../library/lib/NangateOpenCellLibrary_typical.lib 
../library/lib/tpz_typ.lib 
../library/memory/rf_2p_hse_nldm_tt_0p90v_0p90v_25c_syn.lib}

current_goal Design_Read -alltop

link_design -force

current_goal lint/lint_rtl -alltop
run_goal
current_goal lint/lint_turbo_rtl -alltop
run_goal
current_goal lint/lint_abstract -alltop
run_goal
current_goal cdc/cdc_setup_check -alltop
run_goal
current_goal cdc/clock_reset_integrity -alltop
run_goal
current_goal cdc/cdc_verify_struct -alltop
run_goal
current_goal cdc/cdc_verify -alltop
run_goal
current_goal cdc/cdc_abstract -alltop
run_goal
current_goal dft/dft_scan_ready -alltop
run_goal
current_goal dft/dft_best_practice -alltop
run_goal
current_goal dft/dft_bist_ready -alltop
run_goal
current_goal dft/dft_dsm_best_practice -alltop
run_goal
current_goal dft/dft_dsm_random_resistance -alltop
run_goal
current_goal dft/dft_abstract -alltop
run_goal
current_goal lint/lint_rtl -alltop

save_project 
