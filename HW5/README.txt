Readme file for HW5
Matthew Sloss

****************************************
Report : area
Design : gcd
Version: E-2010.12-SP2
Date   : Mon May 26 17:59:34 2014
****************************************

Information: Updating design information... (UID-85)
Library(s) Used:

    saed90nm_typ (File: /nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/Digital_Standard_Cell_Library/synopsys/models/saed90nm_typ_pg.db)

Number of ports:                          100
Number of nets:                           779
Number of cells:                          664
Number of combinational cells:            566
Number of sequential cells:                98
Number of macros:                           0
Number of buf/inv:                        169
Number of references:                      41

Combinational area:       5501.140065
Noncombinational area:    3162.931049
Net Interconnect area:     379.482952  

Total cell area:          8664.071114
Total area:               9043.554066

Total number of cells 8664.071114 / 5.5296 = 1566 gates


Setup time path
 
****************************************
Report : timing
        -path full
        -delay max
        -max_paths 1
Design : gcd
Version: E-2010.12-SP2
Date   : Mon May 26 17:59:34 2014
****************************************

Operating Conditions: TYPICAL   Library: saed90nm_typ
Wire Load Model Mode: top

  Startpoint: reg_a_reg[6]
              (rising edge-triggered flip-flop clocked by my_clock)
  Endpoint: reg_a_reg[23]
            (rising edge-triggered flip-flop clocked by my_clock)
  Path Group: my_clock
  Path Type: max

  Des/Clust/Port     Wire Load Model       Library
  ------------------------------------------------
  gcd                8000                  saed90nm_typ

  Point                                    Incr       Path
  -----------------------------------------------------------
  clock my_clock (rise edge)               0.00       0.00
  clock network delay (ideal)              0.00       0.00
  reg_a_reg[6]/CLK (DFFARX1)               0.00       0.00 r
  reg_a_reg[6]/Q (DFFARX1)                 0.24       0.24 f
  U291/QN (INVX0)                          0.04       0.28 r
  U384/Q (OR2X2)                           0.09       0.37 r
  U473/QN (INVX0)                          0.04       0.41 f
  U293/Q (OR2X1)                           0.09       0.49 f
  U292/QN (NAND2X2)                        0.04       0.53 r
  U389/QN (NAND2X4)                        0.03       0.57 f
  U413/QN (NOR2X4)                         0.03       0.59 r
  U444/QN (NOR2X4)                         0.03       0.63 f
  U420/QN (NOR2X4)                         0.03       0.66 r
  U407/QN (NOR2X4)                         0.04       0.70 f
  U406/QN (NOR2X4)                         0.03       0.73 r
  U408/QN (NOR2X4)                         0.03       0.77 f
  U425/Q (OR3X2)                           0.10       0.87 f
  U208/QN (NAND2X2)                        0.03       0.90 r
  U400/QN (NAND2X4)                        0.03       0.93 f
  U390/QN (NAND2X4)                        0.03       0.95 r
  U257/QN (NAND3X0)                        0.05       1.01 f
  U369/QN (NAND2X2)                        0.05       1.05 r
  U725/QN (NAND2X4)                        0.03       1.08 f
  U726/QN (NOR2X4)                         0.05       1.13 r
  U723/QN (INVX4)                          0.02       1.15 f
  U727/QN (NAND2X4)                        0.03       1.18 r
  U167/QN (NAND2X4)                        0.03       1.20 f
  U166/QN (NAND2X4)                        0.03       1.23 r
  U728/QN (NAND2X4)                        0.03       1.26 f
  U729/QN (NOR2X4)                         0.03       1.29 r
  U368/QN (NOR2X4)                         0.03       1.32 f
  U366/QN (NAND2X4)                        0.03       1.35 r
  U170/QN (NAND2X4)                        0.03       1.38 f
  U258/QN (NAND2X4)                        0.03       1.42 r
  U317/QN (INVX8)                          0.03       1.44 f
  U169/QN (NAND2X4)                        0.03       1.47 r
  U396/QN (NAND2X4)                        0.05       1.52 f
  U660/QN (INVX8)                          0.03       1.55 r
  U682/QN (NAND2X4)                        0.05       1.60 f
  U731/QN (INVX8)                          0.03       1.63 r
  U270/Q (NBUFFX2)                         0.09       1.72 r
  U331/QN (NAND2X1)                        0.05       1.77 f
  U328/QN (NAND2X2)                        0.03       1.80 r
  U329/QN (INVX2)                          0.02       1.82 f
  U247/QN (NAND2X1)                        0.04       1.86 r
  reg_a_reg[23]/D (DFFARX1)                0.00       1.86 r
  data arrival time                                   1.86

  clock my_clock (rise edge)               2.00       2.00
  clock network delay (ideal)              0.00       2.00
  clock uncertainty                       -0.02       1.98
  reg_a_reg[23]/CLK (DFFARX1)              0.00       1.98 r
  library setup time                      -0.12       1.86
  data required time                                  1.86
  -----------------------------------------------------------
  data required time                                  1.86
  data arrival time                                  -1.86
  -----------------------------------------------------------
  slack (MET)                                         0.00

Hold Time Path


 
****************************************
Report : timing
        -path full
        -delay min
        -max_paths 1
Design : gcd
Version: E-2010.12-SP2
Date   : Mon May 26 17:59:34 2014
****************************************

Operating Conditions: TYPICAL   Library: saed90nm_typ
Wire Load Model Mode: top

  Startpoint: result_reg[0]
              (rising edge-triggered flip-flop clocked by my_clock)
  Endpoint: result[0] (output port clocked by my_clock)
  Path Group: my_clock
  Path Type: min

  Des/Clust/Port     Wire Load Model       Library
  ------------------------------------------------
  gcd                8000                  saed90nm_typ

  Point                                    Incr       Path
  -----------------------------------------------------------
  clock my_clock (rise edge)               0.00       0.00
  clock network delay (ideal)              0.00       0.00
  result_reg[0]/CLK (DFFARX1)              0.00       0.00 r
  result_reg[0]/Q (DFFARX1)                0.25       0.25 r
  result[0] (out)                          0.00       0.25 r
  data arrival time                                   0.25

  clock my_clock (rise edge)               0.00       0.00
  clock network delay (ideal)              0.00       0.00
  clock uncertainty                        0.02       0.02
  output external delay                    0.15       0.17
  data required time                                  0.17
  -----------------------------------------------------------
  data required time                                  0.17
  data arrival time                                  -0.25
  -----------------------------------------------------------
  slack (MET)                                         0.08

Latch Removal

In my design there was only one latch that i found. The latch was on the
result output bus.  This latch existied becuase I initlally tried to form the
outputs of the gcd within the always_comb block that controlled the state
machine that controlled the output logic.  This was not a good idea.  To fix
the latch i moved the output forming logic into its own allways_ff block.
This removed the latch.
