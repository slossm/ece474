#!/bin/bash

#make directories needed if they don't exist

if [ ! -s bin ]; then
    mkdir bin
fi
if [ ! -s logs ]; then
    mkdir log
fi
if [ ! -s rtl_src ]; then
    mkdir rtl_src
fi
if [ ! -s tb_src ]; then
    mkdir tb_src
fi
if [ ! -s sdfout ]; then
    mkdir sdfout
fi
if [ ! -s vectors ]; then
    mkdir vectors
fi
if [ ! -s vlogout ]; then
    mkdir vlogout
fi

#remove previous results from /vectors and /reports

if [ -e reports/area ]; then
    rm reports/area
fi

if [ -e reports/cells_used ]; then
    rm reports/cells_used
fi

if [ -e reports/check_design ]; then
    rm reports/check_design
fi

if [ -e reports/delay ]; then
    rm reports/delay
fi

if [ -e reports/gate_miscompares ]; then
    rm reports/gate_miscompares
fi

if [ -e reports/gate_sdf_miscompares ]; then
    rm reports/gate_sdf_miscompares
fi

if [ -e reports/hold_error ]; then
    rm reports/hold_error
fi

if [ -e reports/rtl_miscompares ]; then
    rm reports/rtl_miscompares
fi

if [ -e reports/rtl_synth_error ]; then
    rm reports/rtl_synth_error
fi
#removing old vectors
if [ -e vectors/output_data_rtl ]; then
    rm vectors/output_data_rtl
fi

if [ -e vectors/output_data_gate ]; then
    rm vectors/output_data_gate
fi

if [ -e vectors/outout_data_sdf ]; then
    rm vectors/output_data_sdf
fi

#check for work directory and make if necessary 

if [ ! -s work ]; then
    vlib work
fi

#compile and run c code to produce Golden Vector

if [ -e golden_code.c ]; then
    gcc -o golden_code golden_code.c
    golden_code
fi

#compile verilog modules

vlog rtl_src/gcd.sv  
vlog  tb_src/tb.sv  

#simulate the rtl design
vsim tb -do dofile -quiet -c -t 1ps

#rename the output_data

if [ -e vectors/output_data ]; then
    mv vectors/output_data vectors/output_data_rtl
fi

#remove the old output_data file

if [ -e vectors/output_data ]; then
    rm vectors/output_data
fi

#diff output_data and golden_data
echo "diff output with golden vectors"
diff vectors/golden_data vectors/output_data_rtl > reports/rtl_miscompares

#report the results

if [ $? -eq 0 ]; then
    echo " "
    echo " "
    echo "  0     0					         "
    echo "     |    	rtl simulation results match		 "
    echo "  \_____/						 "
    echo " "
    echo " "
else
    echo " "
    echo " "
    echo "  X     X					    	"
    echo "     |	rtl simulation results DO NOT MATCH	"
    echo "  _______			    			"
    echo " "
    echo " "
fi   
#compile synthesis library into work if needed

grep "/nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/Digital_Standard_Cell_Library/verilog" work/_info &> /dev/null
if [ $? -ne 0 ]
then
    echo " "
    echo "*** Compiling Libraries ***"
    echo " "
./comp_lib.sh
else
    echo
    echo "*** Libraries already compiled ***"
    echo
fi

#synthesize the design using dc_syn and redirect output to the logfile

dc_shell-xg-t -f bin/dc_syn > logs/synth_log

#check for latches in synthesized design
##grep.....

#check for errors in synthesis from latches being included
#if latches are found, report it

#fix missing timing parameter in sdf file
sed '/(HOLD (posedge RSTB)/d' < sdfout/gcd.gate.sdf  > sdfout/$$tempfile
sed '/(HOLD (posedge SETB)/d' < sdfout/$$tempfile    > sdfout/gcd.gate.sdf
rm sdfout/$$tempfile

#compile the gate level gcd 
vlog vlogout/gcd.gate.v  -work work

#simulate gate-level gcd 
vsim tb -do dofile  +nowarnTFMPC -quiet -c -t 1ps 
#rename the output_data

if [ -e vectors/output_data ]; then
    mv vectors/output_data vectors/output_data_gate
fi

#remove the old output_data file

if [ -e vectors/output_data ]; then
    rm vectors/output_data
fi

#diff output_data and golden_data
echo "diff output with golden vectors"
diff vectors/golden_data vectors/output_data_gate > reports/gate_miscompares

#report the results

if [ $? -eq 0 ]; then
    echo " "
    echo " "
    echo "  0     0					         "
    echo "     |    	gate simulation results match		 "
    echo "  \_____/						 "
    echo " "
    echo " "
else
    echo " "
    echo " "
    echo "  X     X					    	"
    echo "     |	gate simulation results DO NOT MATCH	"
    echo "  _______			    			"
    echo " "
    echo " "
fi   

#simulate the gate-level gcd with the sdf file
vsim tb -do dofile +nowarnTFMPC -quiet -c -sdfmax /tb/gcd_0=sdfout/gcd.gate.sdf -t 1ps  +nowarn3448

#rename the output_data

if [ -e vectors/output_data ]; then
    mv vectors/output_data vectors/output_data_gate_sdf
fi

#remove the old output_data file

if [ -e vectors/output_data ]; then
    rm vectors/output_data
fi

#diff output_data and golden_data
echo "diff output with golden vectors"
diff vectors/golden_data vectors/output_data_gate_sdf > reports/gate_sdf_miscompares

#report the results

if [ $? -eq 0 ]; then
    echo " "
    echo " "
    echo "  0     0						         "
    echo "     |    	gate-sdf simulation results match		 "
    echo "  \_____/							 "
    echo " "
    echo " "
else
    echo " "
    echo " "
    echo "  X     X			    			    	"
    echo "     |	gate_sdf simulation results DO NOT MATCH	"
    echo "  _______				    			"
    echo " "
    echo " "
fi   

