****************************************
Report : area
Design : tas
Version: E-2010.12-SP2
Date   : Wed Jun 11 01:39:56 2014
****************************************

Information: Updating design information... (UID-85)
Library(s) Used:

    saed90nm_typ (File:
/nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/Digital_Standard_Cell_Library/synopsys/models/saed90nm_typ_pg.db)

Number of ports:                           25
Number of nets:                           491
Number of cells:                          403
Number of combinational cells:            292
Number of sequential cells:               111
Number of macros:                           0
Number of buf/inv:                         53
Number of references:                      23

Combinational area:       2901.760008
Noncombinational area:    3570.274048
Net Interconnect area:     304.390831  

Total cell area:          6472.034056
Total area:               6776.424887

Totle number of gates = Total cell area / Area of NAND
Total number of gate 1178

 
****************************************
Report : timing
        -path full
        -delay max
        -max_paths 1
Design : tas
Version: E-2010.12-SP2
Date   : Wed Jun 11 01:39:56 2014
****************************************

Operating Conditions: TYPICAL   Library: saed90nm_typ
Wire Load Model Mode: top

  Startpoint: fifo_0/wr_addr_reg[2]
              (rising edge-triggered flip-flop clocked by my_clock_50)
  Endpoint: ctrl_2mhz_0/reset_ac_ps_reg
            (rising edge-triggered flip-flop clocked by my_clock_2)
  Path Group: my_clock_2
  Path Type: max

  Des/Clust/Port     Wire Load Model       Library
  ------------------------------------------------
  tas                8000                  saed90nm_typ

  Point                                                   Incr       Path
  --------------------------------------------------------------------------
  clock my_clock_50 (rise edge)                         480.00     480.00
  clock network delay (ideal)                             0.00     480.00
  fifo_0/wr_addr_reg[2]/CLK (DFFARX1)                     0.00     480.00 r
  fifo_0/wr_addr_reg[2]/Q (DFFARX1)                       0.31     480.31 f
  U153/Q (XNOR2X1)                                        0.16     480.47 r
  U66/QN (NAND3X0)                                        0.05     480.52 f
  U64/QN (NOR2X0)                                         0.52     481.04 r
  U20/QN (INVX0)                                          0.87     481.92 f
  U114/QN (NAND2X0)                                       0.18     482.09 r
  U113/Q (XNOR2X1)                                        0.18     482.27 r
  U23/Q (OR2X1)                                           0.08     482.36 r
  ctrl_2mhz_0/reset_ac_ps_reg/D (DFFARX1)                 0.00     482.36 r
  data arrival time                                                482.36

  clock my_clock_2 (rise edge)                          500.00     500.00
  clock network delay (ideal)                             0.00     500.00
  clock uncertainty                                      -0.02     499.98
  ctrl_2mhz_0/reset_ac_ps_reg/CLK (DFFARX1)               0.00     499.98 r
  library setup time                                     -0.11     499.87
  data required time                                               499.87
  --------------------------------------------------------------------------
  data required time                                               499.87
  data arrival time                                               -482.36
  --------------------------------------------------------------------------
  slack (MET)                                                       17.51


  Startpoint: data_ena (input port clocked by my_clock_50)
  Endpoint: ctrl_50mhz_0/temp_pkt_ps_reg
            (rising edge-triggered flip-flop clocked by my_clock_50)
  Path Group: my_clock_50
  Path Type: max

  Des/Clust/Port     Wire Load Model       Library
  ------------------------------------------------
  tas                8000                  saed90nm_typ

  Point                                                   Incr       Path
  --------------------------------------------------------------------------
  clock my_clock_50 (rise edge)                           0.00       0.00
  clock network delay (ideal)                             0.00       0.00
  input external delay                                    1.00       1.00 r
  data_ena (in)                                           0.02       1.02 r
  U145/Q (NBUFFX2)                                        0.13       1.15 r
  U24/QN (INVX0)                                          0.28       1.43 f
  U74/QN (NAND2X0)                                        0.16       1.58 r
  U25/QN (INVX0)                                          0.14       1.73 f
  U69/Q (XOR2X1)                                          0.15       1.88 r
  U68/QN (NAND2X0)                                        0.09       1.97 f
  U26/QN (INVX0)                                          0.08       2.05 r
  U102/QN (NOR3X0)                                        0.09       2.14 f
  U101/QN (OAI22X1)                                       0.17       2.31 r
  ctrl_50mhz_0/temp_pkt_ps_reg/D (DFFARX1)                0.00       2.31 r
  data arrival time                                                  2.31

  clock my_clock_50 (rise edge)                          20.00      20.00
  clock network delay (ideal)                             0.00      20.00
  clock uncertainty                                      -0.02      19.98
  ctrl_50mhz_0/temp_pkt_ps_reg/CLK (DFFARX1)              0.00      19.98 r
  library setup time                                     -0.11      19.87
  data required time                                                19.87
  --------------------------------------------------------------------------
  data required time                                                19.87
  data arrival time                                                 -2.31
  --------------------------------------------------------------------------
  slack (MET)                                                       17.55


 
****************************************
Report : timing
        -path full
        -delay min
        -max_paths 1
Design : tas
Version: E-2010.12-SP2
Date   : Wed Jun 11 01:39:56 2014
****************************************

Operating Conditions: TYPICAL   Library: saed90nm_typ
Wire Load Model Mode: top

  Startpoint: averager_0/ac_reg[9]
              (rising edge-triggered flip-flop clocked by my_clock_2)
  Endpoint: ram_data[7]
            (output port clocked by my_clock_2)
  Path Group: my_clock_2
  Path Type: min

  Des/Clust/Port     Wire Load Model       Library
  ------------------------------------------------
  tas                8000                  saed90nm_typ

  Point                                    Incr       Path
  -----------------------------------------------------------
  clock my_clock_2 (rise edge)             0.00       0.00
  clock network delay (ideal)              0.00       0.00
  averager_0/ac_reg[9]/CLK (DFFARX1)       0.00       0.00 r
  averager_0/ac_reg[9]/Q (DFFARX1)         0.26       0.26 r
  ram_data[7] (out)                        0.00       0.26 r
  data arrival time                                   0.26

  clock my_clock_2 (rise edge)             0.00       0.00
  clock network delay (ideal)              0.00       0.00
  clock uncertainty                        0.02       0.02
  output external delay                    0.15       0.17
  data required time                                  0.17
  -----------------------------------------------------------
  data required time                                  0.17
  data arrival time                                  -0.26
  -----------------------------------------------------------
  slack (MET)                                         0.09


  Startpoint: data_ena (input port clocked by my_clock_50)
  Endpoint: ctrl_50mhz_0/comp_byte_ps_reg
            (rising edge-triggered flip-flop clocked by my_clock_50)
  Path Group: my_clock_50
  Path Type: min

  Des/Clust/Port     Wire Load Model       Library
  ------------------------------------------------
  tas                8000                  saed90nm_typ

  Point                                                   Incr       Path
  --------------------------------------------------------------------------
  clock my_clock_50 (rise edge)                           0.00       0.00
  clock network delay (ideal)                             0.00       0.00
  input external delay                                    0.10       0.10 f
  data_ena (in)                                           0.03       0.13 f
  ctrl_50mhz_0/comp_byte_ps_reg/D (DFFARX1)               0.00       0.13 f
  data arrival time                                                  0.13

  clock my_clock_50 (rise edge)                           0.00       0.00
  clock network delay (ideal)                             0.00       0.00
  clock uncertainty                                       0.02       0.02
  ctrl_50mhz_0/comp_byte_ps_reg/CLK (DFFARX1)             0.00       0.02 r
  library hold time                                      -0.05      -0.03
  data required time                                                -0.03
  --------------------------------------------------------------------------
  data required time                                                -0.03
  data arrival time                                                 -0.13
  --------------------------------------------------------------------------
  slack (MET)                                                        0.15



