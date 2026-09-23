#======================================================
#
# Synopsys Synthesis Scripts (Design Vision dctcl mode)
#
#======================================================

#======================================================
#  Set Libraries
#======================================================


set search_path {/lib/SAED90_EDK/SAED_EDK90nm_ccs_models_lvt}

set synthetic_library dw_foundation.sldb

set link_library { saed90nm_typ_htl_lvt_ccs.db dw_foundation.sldb}

set target_library {saed90nm_typ_htl_lvt_ccs.db}



#======================================================
#  Global Parameters
#======================================================
set DESIGN "alu"
set CLK_period 10
define_design_lib DESIGN_LIB -path ./LIB

#======================================================
#  Read RTL Code
#======================================================

# ----- ALU -----
read_verilog -rtl /home/111-2/VLSI/C108110249/DESIGN/RTL/lab3/alu.v

current_design $DESIGN

#======================================================
#  Global Setting
#======================================================
set_wire_load_mode top

#======================================================
#  Set Design Constraints
#======================================================
create_clock -name "CLK" -period $CLK_period clk 
#set_input_delay  [ expr $CLK_period*0.1 ] -clock CLK [all_inputs]
#set_output_delay [ expr $CLK_period*0.1 ] -clock CLK [all_outputs]
set_load 0.00 [all_outputs]

#======================================================
#  Optimization
#======================================================
uniquify
set_fix_multiple_port_nets -all -buffer_constants
set_fix_hold [all_clocks]
compile_ultra

#======================================================
#  Output Reports 
#======================================================
report_timing >  Report/$DESIGN\.timing
report_area >  Report/$DESIGN\.area

#======================================================
#  Change Naming Rule
#======================================================
set bus_inference_style "%s\[%d\]"
set bus_naming_style "%s\[%d\]"
set hdlout_internal_busses true
change_names -hierarchy -rule verilog
define_name_rules name_rule -allowed "a-z A-Z 0-9 _" -max_length 255 -type cell
define_name_rules name_rule -allowed "a-z A-Z 0-9 _[]" -max_length 255 -type net
define_name_rules name_rule -map {{"\\*cell\\*" "cell"}}
change_names -hierarchy -rules name_rule

#======================================================
#  Output Results
#======================================================

set verilogout_higher_designs_first true
write -format verilog -output Netlist/$DESIGN\_SYN.v -hierarchy
write_sdf -version 2.1 -context verilog -load_delay cell Netlist/$DESIGN\_SYN.sdf

#======================================================
#  Finish and Quit
#======================================================
check_design
exit
