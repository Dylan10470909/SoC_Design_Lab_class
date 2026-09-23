setStreamOutMode -specifyViaName default -SEvianames false -virtualConnection false -uniquifyCellNamesPrefix false -snapToMGrid false -textSize 1 -version 3

streamOut CHIP.gds -mapFile streamOut.map \
      -merge { ../../library/gds/NangateOpenCellLibrary.macro.gds \
               ../../library/memory/rf_2p_hse.gds \
               ../../library/gds/tpz.gds } \
      -stripes 1 -units 2000 -mode ALL

