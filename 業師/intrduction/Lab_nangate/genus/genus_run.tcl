#### Template Script for RTL->Gate-Level Flow (generated from GENUS 17.21-s010_1) 

if {[file exists /proc/cpuinfo]} {
  sh grep "model name" /proc/cpuinfo
  sh grep "cpu MHz"    /proc/cpuinfo
}

puts "Hostname : [info hostname]"

##############################################################################
## Preset global variables and attributes
##############################################################################


set DESIGN CHIP
set GEN_EFF medium
set MAP_OPT_EFF high
set DATE [clock format [clock seconds] -format "%b%d-%T"] 
set _OUTPUTS_PATH outputs_${DATE}
set _REPORTS_PATH reports_${DATE}
set _LOG_PATH logs_${DATE}
set ET_WORKDIR ET 
set_db / .init_lib_search_path {. ../library/lib ../library/lef ../library/fireice ../library/memory} 
set_db / .script_search_path {. <path>} 
set_db / .init_hdl_search_path {. ../design/RTL} 
##Uncomment and specify machine names to enable super-threading.
##set_db / .super_thread_servers {<machine names>} 
##For design size of 1.5M - 5M gates, use 8 to 16 CPUs. For designs > 5M gates, use 16 to 32 CPUs
##set_db / .max_cpus_per_server 8

##Default undriven/unconnected setting is 'none'.  
##set_db / .hdl_unconnected_value 0 | 1 | x | none

set_db / .information_level 7 
##set_db / .retime_reg_naming_suffix __retimed_reg
#set_db / .library {NangateOpenCellLibrary_slow.lib tpz_slow.lib rf_2p_hse_nldm_ss_0p81v_0p81v_125c_syn.lib}
read_libs {NangateOpenCellLibrary_slow.lib tpz_slow.lib rf_2p_hse_nldm_ss_0p81v_0p81v_125c_syn.lib}
#read_power_intent -module <topModuleName> -cpf template.cpf
read_physical -lef {NangateOpenCellLibrary.tech.lef NangateOpenCellLibrary.macro.lef tpz.lef rf_2p_hse.lef}

## Provide either cap_table_file or the qrc_tech_file
#set_db / .cap_table_file worst.captbl
read_qrc worst.tch
##generates <signal>_reg[<bit_width>] format
#set_db / .hdl_array_naming_style %s\[%d\] 
## 


set_db / .lp_insert_clock_gating true 

## Power root attributes
#set_db / .lp_clock_gating_prefix <string>
#set_db / .lp_power_analysis_effort <high> 
#set_db / .lp_power_unit mW 
#set_db / .lp_toggle_rate_unit /ns 
## The attribute has been set to default value "medium"
## you can try setting it to high to explore MVT QoR for low power optimization
set_db / .leakage_power_effort medium  


####################################################################
## Load Design
####################################################################


read_hdl {CHIP.v DCT.v DRU.v IDRU.v acc.v acf.v bdeg.v RF_2P_ADV64x16_top.v RF_2P_ADV64x16_rb.v RF_2P_ADV64x16_wrapper.v tposemem.v}
elaborate $DESIGN
puts "Runtime & Memory after 'read_hdl'"
time_info Elaboration

#set_db / .auto_ungroup none
set_db hinst:CHIP/u_DCT .ungroup_ok false
set_db hinst:CHIP/u_DCT/DRU .ungroup_ok false
set_db hinst:CHIP/u_DCT/IDRU8 .ungroup_ok false
set_db hinst:CHIP/u_DCT/acf .ungroup_ok false
set_db hinst:CHIP/u_DCT/bdeg .ungroup_ok false
set_db hinst:CHIP/u_IDCT .ungroup_ok false
set_db hinst:CHIP/u_IDCT/DRU .ungroup_ok false
set_db hinst:CHIP/u_IDCT/IDRU8 .ungroup_ok false
set_db hinst:CHIP/u_IDCT/acf .ungroup_ok false
set_db hinst:CHIP/u_IDCT/bdeg .ungroup_ok false

## Create new modes
create_mode -name {func_mode scan_mode}

check_design -unresolved

####################################################################
## Constraints Setup
####################################################################

## Use separate 'read_sdc -mode' statements for each mode created to read in
## the constraints.
read_sdc -mode func_mode ../design/CHIP_func.sdc
read_sdc -mode scan_mode ../design/CHIP_scan.sdc


#set_db "design:$DESIGN" .force_wireload <wireload name> 

if {![file exists ${_LOG_PATH}]} {
  file mkdir ${_LOG_PATH}
  file mkdir ${_LOG_PATH}
  if {[file exists logs]} {
      if {[file type logs] == "link"} {
          file delete logs
      }
  }
  if {![file exists logs]} {
      file link logs ${_LOG_PATH}
  }
  puts "Creating directory ${_LOG_PATH}"
}

if {![file exists ${_OUTPUTS_PATH}]} {
  file mkdir ${_OUTPUTS_PATH}
  puts "Creating directory ${_OUTPUTS_PATH}"
  if {[file exists outputs]} {
      if {[file type outputs] == "link"} {
          file delete outputs
      }
  }
  if {![file exists outputs]} {
      file link outputs ${_OUTPUTS_PATH}
  }
}

if {![file exists ${_REPORTS_PATH}]} {
  file mkdir ${_REPORTS_PATH}
  puts "Creating directory ${_REPORTS_PATH}"
  if {[file exists reports]} {
      if {[file type reports] == "link"} {
          file delete reports
      }
  }
  if {![file exists reports]} {
      file link reports ${_REPORTS_PATH}
  }
}
## Check timing intent
foreach mode [vfind / -mode *] {
  check_timing_intent -mode $mode
}

###################################################################################
## Define cost groups (clock-clock, clock-output, input-clock, input-output)
###################################################################################

## Uncomment to remove already existing costgroups before creating new ones.
## delete_obj [vfind /designs/* -cost_group *]

if {[llength [all_registers]] > 0} {
  set list_mod [vfind / -mode *]
  if {[llength $list_mod] >= 1} {
    foreach mode $list_mod {
      define_cost_group -name I2C_[vbasename $mode] -design $DESIGN
      define_cost_group -name C2O_[vbasename $mode] -design $DESIGN
      define_cost_group -name C2C_[vbasename $mode] -design $DESIGN
    }
  } else {
    define_cost_group -name I2C -design $DESIGN
    define_cost_group -name C2O -design $DESIGN
    define_cost_group -name C2C -design $DESIGN
  }

  foreach mode [vfind / -mode *] {
    path_group -from [all_registers] -to [all_registers] -group C2C_[vbasename $mode] -name C2C_[vbasename $mode] -mode $mode
    path_group -from [all_registers] -to [all_outputs] -group C2O_[vbasename $mode] -name C2O_[vbasename $mode] -mode $mode 
    path_group -from [all_inputs]  -to [all_registers] -group I2C_[vbasename $mode] -name I2C_[vbasename $mode] -mode $mode
  }
}

set list_mod [vfind / -mode *]
if {[llength $list_mod] >= 1} {
  foreach mode $list_mod {
    define_cost_group -name I2O_[vbasename $mode] -design $DESIGN
  }
} else {
  define_cost_group -name I2O -design $DESIGN 
}
foreach mode [vfind / -mode *] {
  path_group -from [all_inputs]  -to [all_outputs] -group I2O_[vbasename $mode] -name I2O_[vbasename $mode] -mode $mode
}

write_snapshot -outdir $_REPORTS_PATH -tag initial
report_summary -directory $_REPORTS_PATH

foreach cg [vfind / -cost_group *] {
  foreach mode [vfind / -mode *] {
    report_timing -group [list $cg] -mode $mode >> $_REPORTS_PATH/${DESIGN}_pretim_${cg}.rpt
  }
}
##################################################################################################
## DFT Setup
##################################################################################################

set_db / .dft_scan_style muxed_scan 

## Uncomment for clocked_LSSD 
#set_db / .dft_scan_style clocked_lssd_scan
#define_dft scan_clock_a -name <scanClockAObject> -period <delay in pico sec, default 50000> -rise <integer> -fall <integer> <portOrpin> 
#define_dft scan_clock_b -name <scanClockAObject> -period <delay in pico sec, default 50000> -rise <integer> -fall <integer> <portOrpin> 

set_db / .dft_prefix DFT_ 
# For VDIO customers, it is recommended to set the value of the next two attributes to false.
set_db / .dft_identify_top_level_test_clocks true 
set_db / .dft_identify_test_signals true 

set_db / .dft_identify_internal_test_clocks false 
set_db / .use_scan_seqs_for_non_dft false 

set_db "design:$DESIGN" .dft_scan_map_mode tdrc_pass 
set_db "design:$DESIGN" .dft_connect_shift_enable_during_mapping tie_off 
set_db "design:$DESIGN" .dft_connect_scan_data_pins_during_mapping loopback 
set_db "design:$DESIGN" .dft_scan_output_preference auto 
set_db "design:$DESIGN" .dft_lockup_element_type preferred_level_sensitive 
#set_db "design:$DESIGN" .dft_mix_clock_edges_in_scan_chains true 

#set_db <instance or subdesign> .dft_dont_scan true 
#set_db "<from pin> <inverting|non_inverting>" .dft_controllable <to pin>

#define_dft test_clock -name TEST_CLOCK  -domain DFT_DOMAIN1 -period 50000  -rise 50 -fall 90  -hookup_pin ipad_CLK/C CLK
define_dft test_clock -domain DFT_DOMAIN1 CLK -hookup_pin ipad_CLK/C -hookup_polarity non_inverted  
#define_dft test_clock -name TEST_CLOCK  -domain DFT_DOMAIN1 ipad_CLK/C 
define_dft shift_enable -name SCAN_EN -active high -hookup_pin ipad_SCAN_EN/C SCAN_EN
define_dft test_mode -name TEST_MODE -active high -hookup_pin ipad_TEST_MODE/C TEST_MODE
define_dft test_mode -name RESET_ -active high -hookup_pin ipad_RESET_/C RESET_
#set_compatible_test_clocks -all

## If you intend to insert compression logic, define your compression test signals or clocks here:
## define_dft test_mode...  [-shared_in]
## define_dft test_clock...
#########################################################################
## Segments Constraints (support fixed, floating, preserved and abstract)
## only showing preserved, and abstract segments as these are most often used
#############################################################################

##define_dft preserved_segment -name <segObject> -sdi <pin|port|subport> -sdo <pin|port|subport> -analyze 
## If the block is complete from a DFT perspective, uncomment to prevent any non-scan flops from being scan-replaced
#set_db [filter dft_mapped false [vfind /designs/* -instance <subDesignInstance>/instances_seq/*]] dft_dont_scan true 

##define_dft abstract_segment -name <segObject> <-module|-insts|-libcell> -sdi <pin> -sdo <pin> -clock_port <pin> [-rise|-fall] -shift_enable_port <pin> -active <high|low> -length <integer> 
## Uncomment if abstract segments are modeled in CTL format
##read_dft_abstract_model -ctl <file>

#define_dft scan_chain -name <ChainName> -sdi <topLeveLSDIPort>	-sdo <topLevelSDOPort> [-hookup_pin_sdi <coreSideSDIDrivingPin>] [-hookup_pin_sdo <coreSideSDOLoadPin>] [-shift_enable <ShiftEnableObject>] [-shared_output | -non_shared_output] [-terminal_lockup <level | edge>]
define_dft scan_chain -name scan1 -sdi X[0] -sdo Z[0] -shift_enable SCAN_EN -hookup_pin_sdi ipad_X0/C -hookup_pin_sdo opad_Z0/I -domain DFT_DOMAIN1 -shared_input -shared_out
define_dft scan_chain -name scan2 -sdi X[1] -sdo Z[1] -shift_enable SCAN_EN -hookup_pin_sdi ipad_X1/C -hookup_pin_sdo opad_Z1/I -domain DFT_DOMAIN1 -shared_input -shared_out
define_dft scan_chain -name scan3 -sdi X[2] -sdo Z[2] -shift_enable SCAN_EN -hookup_pin_sdi ipad_X2/C -hookup_pin_sdo opad_Z2/I -domain DFT_DOMAIN1 -shared_input -shared_out

## Run the DFT rule checks
check_dft_rules > $_REPORTS_PATH/${DESIGN}-tdrcs
report dft_registers > $_REPORTS_PATH/${DESIGN}-DFTregs
report dft_setup > $_REPORTS_PATH/${DESIGN}-DFTsetup_tdrc

## Fix the DFT Violations
## Uncomment to fix dft violations
set numDFTviolations [check_dft_rules]
if {$numDFTviolations > "0"} {
  report dft_violations > $_REPORTS_PATH/${DESIGN}-DFTviols  
  fix_dft_violations -async_set -async_reset -clock -test_control TEST_MODE
  check_dft_rules
}

##  Run the Advanced DFT rule checks to identify:
## ...  x-source generators, internal tristate nets, and clock and data race violations
## Note:  tristate nets are reported for busses in which the enables are driven by
## tristate devices.  Use 'check_design' to report other types of multidriven nets.

check_design -multiple_driver
check_dft_rules -advanced  > $_REPORTS_PATH/${DESIGN}-Advancedtdrcs
#report dft_violations [-tristate] [-xsource] [-xsource_by_instance] > $_REPORTS_PATH/${DESIGN}-AdvancedDFTViols
report dft_violations    > $_REPORTS_PATH/${DESIGN}-AdvancedDFTViols

## Fix the Avanced DFT Violations
## ... x-source violations are fixed by inserting registered shadow logic
## ... tristate net violations are fixed by selectively enabling and disabiling the tristate enable signals
##  in shift-mode. 
## ... clock and data race violations are not auto-fixed by the tool.
## Note: The fixing of tristate net violations using the 'fix_dft_violations -tristate_net' command
## should be deferred until a full-chip representation of the design is available.

## Uncomment to fix x-source violations (or alternatively, insert the shadow logic using the
## 'insert_dft shadow_logic' command).
#fix_dft_violations -xsource -test_control <TestModeObject> -test_clock_pin <ClockPinOrPort> [-exclude_xsource <instance>]
#check_dft_rules -advanced

## Update DFT status
## report dft_registers > $_REPORTS_PATH/${DESIGN}-DFTregs_tdrc
## report dft_setup > $_REPORTS_PATH/${DESIGN}-DFTsetup_tdrc

#####################################################################################
#### Retime
#####################################################################################


#set rt_modules {module:<design_name>/<module name1> module:<design_name>/<module name2> module:<design_name>/<module name3>}
#foreach mod $rt_modules {
#  set_db $mod .retime true
#  ####Uncomment to prevent registers from being moved across the module boundaries (also best for LEC)
#  ##set_db $mod .retime_hard_region true
#  ####Uncomment to minimize issues with Conformal LEC
#  ##set_db $mod .boundary_opto false 
#}
#####Setting 'retime' attribute on the top-level as shown below 
#####is not recommended due to possible verification/ECO issues unless for very small designs
###set_db "design:$DESIGN" .retime true   

####set dont_retime on registers which should not be retimed
#set dont_rt_flops "inst:<path_to_myflop1> inst:<path_to_myflop2> inst:<path_to_myflop3> ..."
#foreach rtf $rt_flops {
#  set_db $rtf .dont_retime true
#}
## Enable verification flow 
#set_db / .retime_verification_flow true
#######################################################################################
## Leakage/Dynamic power/Clock Gating setup.
#######################################################################################

#set_db "design:$DESIGN" .lp_clock_gating_cell [vfind /lib* -lib_cell CLKGATE_X1]
#set_db "design:$DESIGN" .max_leakage_power 0.0 
#set_db "design:$DESIGN" .lp_power_optimization_weight <value from 0 to 1> 
#set_db "design:$DESIGN" .max_dynamic_power <number> 

set_db "design:$DESIGN" .lp_clock_gating_test_signal TEST_MODE
## read_tcf <TCF file name>
## read_saif <SAIF file name>
## read_vcd <VCD file name>


#### uniquify the subdesign if it is multiple instantiated
#### and you would like to assign one of the instantiations
#### to a different library domain
set_db / .ui_respects_preserve false
edit_netlist uniquify CHIP
#check_cpf


#### To turn off sequential merging on the design 
#### uncomment & use the following attributes.
##set_db / .optimize_merge_flops false 
##set_db / .optimize_merge_latches false 
#### For a particular instance use attribute 'optimize_merge_seqs' to turn off sequential merging. 

#commit_power_intent
#verify_power_structure -lp_only -post_synth -detail > $_REPORTS_PATH/${DESIGN}_verify_power_struct.rpt


####################################################################################################
## Synthesizing to generic 
####################################################################################################

set_db / .syn_generic_effort $GEN_EFF
syn_generic
puts "Runtime & Memory after 'syn_generic'"
time_info GENERIC
report_dp > $_REPORTS_PATH/generic/${DESIGN}_datapath.rpt
write_snapshot -outdir $_REPORTS_PATH -tag generic
report_summary -directory $_REPORTS_PATH
edit_netlist uniquify CHIP


#### Build RTL power models
##build_rtl_power_models -design $DESIGN -clean_up_netlist [-clock_gating_logic] [-relative <hierarchical instance>]
#report power -rtl


######################################################################################################
## Optional DFT commands (section 1)
######################################################################################################

#############
## Identify Functional Shift Registers
#############
#identify_shift_register_scan_segments

#############
## Add testability logic as required
#############
#insert_dft shadow_logic -around <instance> -mode <no_share|share|bypass> -test_control <TestModeObject>
#insert_dft test_point -location <port|pin> -test_control <test_signal> -type <string>

#######################
## Add Boundary Scan and Programmable MBIST logic
########################

## Uncomment to define the existing 3rd party TAP controller to be used as the master controller for
## DFT logic such as boundary-scan, compression, Programmable MBIST and ptam.
#define_dft jtag_macro -name <objectName> ....

## Define JTAG Instructions for the existing Macro or when building the JTAG_Macro with user-defined instructions. 
## ... For current release, name the mandatory JTAG instructions as: EXTEST, SAMPLE, PRELOAD, BYPASS

##define_jtag_instruction_register -name <string> -length <integer> -capture <string>
##define_jtag_instruction -name <string> -opcode <string> ;# [-register <string> -length <integer>] [-private]

## Uncomment to build a JTAG_Macro with Programmable MBIST instructions.
## Names of the mandatory instructions are: MBISTTPN, MBISTSCH, MBISTCHK
#define_jtag_instruction -name <string> -opcode <string> -register <string> -length <integer>

## Uncomment to define the MBIST clock if inserting Programmable MBIST logic
#define_mbist_clock -name <objectNameOfMBISTClock> -period <integer> <port> ..

## Uncomment to read memory view files for programmable MBIST
#read_pmbist_memory_view -cdns_memory_view_file <string> -arm_mbif <string> -directory <string> <design>

#insert_dft boundary_scan -tck <tckpin> -tdi <tdipin> -tms <tmspin> -trst <trstpin> -tdo <tdopin> -exclude_ports <list of ports excluded from boundary register> -preview

## Uncomment to read block-level interface files for programmable MBIST
#read_dft_pmbist_interface_files -directory <locationOfInterfaceFiles> <lib_cell|module|design>

## Uncomment to insert Programmable BIST (PMBIST) for memories
#add_pmbist -config_file <filename> -connect_to_jtag -directory <PMBISTworkDir> -dft_cfg_mode <dft_configuration_mode> -amu_location <design|module|inst|hinst> ..

## Uncomment to write interface files for programmable MBIST
#write_dft_pmbist_interface_files -directory <locationOfInterfaceFiles> [<design>]

## Uncomment to write out data and script files to generate PMBIST patterns
#write_dft_pmbist_testbench [-create_embedded_test_options <string>] [-irun_options <string>] [-directory <string>] [-testbench_directory <string>] [-ncsim_library <string>] [-script_only] [-no_deposit_script] [-no_build_model] [<design>]

##Write out BSDL file
#write_bsdl -bsdlout <BSDLfileName> -directory <work directory>


####################################################################################################
## Synthesizing to gates
####################################################################################################


## Add '-auto_identify_shift_registers' to 'syn_map' to automatically 
## identify functional shift register segments. Not applicable for n2n flow.
set_db / .syn_map_effort $MAP_OPT_EFF
syn_map
puts "Runtime & Memory after 'syn_map'"
time_info MAPPED
write_snapshot -outdir $_REPORTS_PATH -tag map
report_summary -directory $_REPORTS_PATH
report_dp > $_REPORTS_PATH/map/${DESIGN}_datapath.rpt


foreach cg [vfind / -cost_group *] {
  foreach mode [vfind / -mode *] {
    report_timing -group [list $cg] -mode $mode >> $_REPORTS_PATH/${DESIGN}_[vbasename $cg]_post_map.rpt
  }
}

write_do_lec -revised_design fv_map -logfile ${_LOG_PATH}/rtl2intermediate.lec.log > ${_OUTPUTS_PATH}/rtl2intermediate.lec.do

## ungroup -threshold <value>

#######################################################################################################
## Optimize Netlist
#######################################################################################################
set_db / .syn_opt_effort $MAP_OPT_EFF
syn_opt
write_snapshot -outdir $_REPORTS_PATH -tag syn_opt
report_summary -directory $_REPORTS_PATH

puts "Runtime & Memory after 'syn_opt'"
time_info OPT

foreach cg [vfind / -cost_group *] {
  foreach mode [vfind / -mode *] {
    report_timing -group [list $cg] -mode $mode >> $_REPORTS_PATH/${DESIGN}_[vbasename $cg]_post_opt.rpt
  }
}

######################################################################################################
## Optional additional DFT commands. (section 2)
######################################################################################################

## Re-run DFT rule checks
check_dft_rules -advanced
set numDFTviolations [check_dft_rules]
if {$numDFTviolations > "0"} {
  report dft_violations > $_REPORTS_PATH/${DESIGN}-DFTviols  
  fix_dft_violations -async_set -async_reset -clock -test_control TEST_MODE
  check_dft_rules
}
##Build the full scan chanins
replace_scan
#connect_scan_chains [-preview] [-auto_create_chains]
connect_scan_chains  -preview
connect_scan_chains  -auto_create_chains
report dft_chains > $_REPORTS_PATH/${DESIGN}-DFTchains

## Inserting Compression logic
## compress_scan_chains -ratio <integer>  -mask <string> [-auto_create] [-preview]
##report dft_chains > $_REPORTS_PATH/${DESIGN}-DFTchains_compression
## Reapply CPF rules
#commit_cpf

#######################################################################################################
## Optimize Netlist
#######################################################################################################
 
## Uncomment to remove assigns & insert tiehilo cells during Incremental synthesis
set_db / .remove_assigns true 
#set_remove_assign_options -buffer_or_inverter BUF_X1 -design <design|subdesign>
#set_remove_assign_options -buffer_or_inverter BUF_X1 -design CHIP
set_remove_assign_options -buffer_or_inverter BUF_X1 -dont_respect_boundary_optimization -ignore_preserve_setting -dont_skip_unconstrained_paths -include_local_constant_assign -verbose
##set_db / .use_tiehilo_for_const <none|duplicate|unique> 
 
## An effort of low was selected to minimize runtime of incremental opto.
## If your timing is not met, rerun incremental opto with a different effort level
set_db / .syn_opt_effort low
syn_opt -incremental
write_snapshot -outdir $_REPORTS_PATH -tag syn_opt_low_incr 
report_summary -directory $_REPORTS_PATH
puts "Runtime & Memory after 'syn_opt'"
time_info INCREMENTAL_POST_SCAN_CHAINS

#############################################
## DFT Reports
#############################################

report dft_setup > $_REPORTS_PATH/${DESIGN}-DFTsetup_final
write_scandef > ${DESIGN}-scan.def
write_dft_abstract_model > ${DESIGN}-scanAbstract
write_hdl -abstract > ${DESIGN}-logicAbstract
write_script -analyze_all_scan_chains > ${DESIGN}-writeScript-analyzeAllScanChains
## check_atpg_rules -library <Verilog simulation library files> -compression -directory <Encounter Test workdir directory>
## write_et_bsv -library <Verilog structural library files> -directory $ET_WORKDIR 
write_dft_atpg -library {CHIP.v DCT.v DRU.v IDRU.v acc.v acf.v bdeg.v RF_2P_ADV64x16_top.v RF_2P_ADV64x16_rb.v RF_2P_ADV64x16_wrapper.v tposemem.v} -compression -directory $ET_WORKDIR 


######################################################################################################
## write backend file set (verilog, SDC, config, etc.)
######################################################################################################



report_clock_gating > $_REPORTS_PATH/${DESIGN}_clockgating.rpt
report_power -depth 0 > $_REPORTS_PATH/${DESIGN}_power.rpt
report_gates -power > $_REPORTS_PATH/${DESIGN}_gates_power.rpt

report_dp > $_REPORTS_PATH/${DESIGN}_datapath_incr.rpt
report_messages > $_REPORTS_PATH/${DESIGN}_messages.rpt
write_snapshot -outdir $_REPORTS_PATH -tag final
report_summary -directory $_REPORTS_PATH
write_hdl  > ${_OUTPUTS_PATH}/${DESIGN}_syn.v
write_name_mapping
## write_script > ${_OUTPUTS_PATH}/${DESIGN}_m.script
foreach mode [vfind / -mode *] {
  write_sdc -mode $mode > ${_OUTPUTS_PATH}/${DESIGN}_m_${mode}.sdc
}
write_sdf -no_escape -edges check_edge > ${_OUTPUTS_PATH}/${DESIGN}_syn.sdf


#################################
### write_do_lec
#################################


write_do_lec -golden_design fv_map -revised_design ${_OUTPUTS_PATH}/${DESIGN}_m.v -logfile  ${_LOG_PATH}/intermediate2final.lec.log > ${_OUTPUTS_PATH}/intermediate2final.lec.do
##Uncomment if the RTL is to be compared with the final netlist..
##write_do_lec -revised_design ${_OUTPUTS_PATH}/${DESIGN}_m.v -logfile ${_LOG_PATH}/rtl2final.lec.log > ${_OUTPUTS_PATH}/rtl2final.lec.do

puts "Final Runtime & Memory."
time_info FINAL
puts "============================"
puts "Synthesis Finished ........."
puts "============================"

file copy [get_db / .stdout_log] ${_LOG_PATH}/.

##quit
