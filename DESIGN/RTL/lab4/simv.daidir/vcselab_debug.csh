#!/bin/csh -f

cd /home/111-2/VLSI/C108110249/DESIGN/RTL/lab4

#This ENV is used to avoid overriding current script in next vcselab run 
setenv SNPS_VCSELAB_SCRIPT_NO_OVERRIDE  1

/usr/cad/synopsys/vcs/2022.06/linux/bin/vcselab $* \
    -o \
    simv \
    -nobanner \

cd -

