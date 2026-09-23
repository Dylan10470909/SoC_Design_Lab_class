run 500ns
dumptcf -scope test.CHIP -output CHIP.tcf -inctoggle -overwrite
#dumpsaif -scope test.CHIP -output CHIP.saif -overwrite
run 1000ns
dumptcf -end
#dumpsaif -end
run 
exit
