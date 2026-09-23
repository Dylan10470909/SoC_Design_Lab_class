set_ccopt_property buffer_cells   { CLKBUF_X1 CLKBUF_X2 CLKBUF_X3 }
#set_ccopt_property inverter_cells { }
set_ccopt_property clock_gating_cells { CLKGATE_X1 CLKGATE_X2 CLKGATE_X4 CLKGATE_X8  }
#set_ccopt_property use_inverters true
set_ccopt_property update_io_latency false
create_ccopt_clock_tree_spec
#ccopt_design -cts
ccopt_design

#set_interactive_constraint_modes [all_constraint_modes]
#set_propagated_clock [all_clocks]
