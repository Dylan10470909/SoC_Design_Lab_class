define_metric -name rail.ir.worstiv.net:<net> -description "The worst instance voltage in the report file" -cmp lessBetter
set_metric -name rail.worstivreport.power_domain:PD -value ".//PD_25C_dynamic_1//VDD_VSS.worst.iv "
set_metric -name rail.ir.dynamic.min.net:VDD -value "1.09013 V"
set_metric -name rail.ir.dynamic.max.net:VDD -value "1.1 V"
set_metric -name rail.ir.dynamic.avg.net:VDD -value "1.09405 V"
set_metric -name rail.ir.dynamic.violations.net:VDD -value 0
set_metric -name rail.thresholdvoltage.net:VDD -value "1.09 V"
set_metric -name rail.referencevoltage.net:VDD -value "1.1 V"
set_metric -name rail.worstircycle.net:VDD -value "0.838 uS"
set_metric -name rail.rj.min.net:VDD -value NA
set_metric -name rail.rj.max.net:VDD -value NA
set_metric -name rail.rj.avg.net:VDD -value NA
set_metric -name rail.rj.violations.net:VDD -value 0
set_metric -name rail.gridcap.net:VDD -value "10.706 pF"
set_metric -name rail.intrinsiccap.net:VDD -value "30.483 pF"
set_metric -name rail.loadingcap.net:VDD -value "27.809 pF"
set_metric -name rail.totalcap.net:VDD -value "68.998 pF"
set_metric -name rail.ir.dynamic.min.net:VSS -value "0 V"
set_metric -name rail.ir.dynamic.max.net:VSS -value "0.00958711 V"
set_metric -name rail.ir.dynamic.avg.net:VSS -value "0.00569616 V"
set_metric -name rail.ir.dynamic.violations.net:VSS -value 0
set_metric -name rail.thresholdvoltage.net:VSS -value "0.05 V"
set_metric -name rail.referencevoltage.net:VSS -value "0 V"
set_metric -name rail.worstircycle.net:VSS -value "0.910 uS"
set_metric -name rail.rj.min.net:VSS -value NA
set_metric -name rail.rj.max.net:VSS -value NA
set_metric -name rail.rj.avg.net:VSS -value NA
set_metric -name rail.rj.violations.net:VSS -value 0
set_metric -name rail.gridcap.net:VSS -value "10.742 pF"
set_metric -name rail.intrinsiccap.net:VSS -value "30.483 pF"
set_metric -name rail.loadingcap.net:VSS -value "27.809 pF"
set_metric -name rail.totalcap.net:VSS -value "69.034 pF"
