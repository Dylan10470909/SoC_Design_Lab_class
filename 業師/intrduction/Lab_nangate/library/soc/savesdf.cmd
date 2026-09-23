setAnalysisMode -analysisType bcwc
write_sdf -max_view AV_func_max -typ_view AV_func_typ -min_view AV_func_min -remashold -splitrecrem CHIP.sdf
saveNetlist CHIP.v
#saveNetlist -includePowerGround CHIP_pg.v
