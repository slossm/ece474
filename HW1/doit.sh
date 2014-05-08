#!/bin/bash

if [ ! -d work ]		    	 #checking if work directory exists
then
    echo "***********************"
    echo "makeing /work directory"
    echo "***********************"

     vlib work		         #making work directory if it does not exist
fi

if [ -e fadder.sv ] && [ -e adder8.sv ]		 #if fadder.sv and adder8.sv exist
then
    echo "**************************"
    echo "compling fadder and adder8"
    echo "**************************"
    vlog fadder.sv				 #read and compile 
    vlog adder8.sv
fi

if [ -e adder8.do ]				    #if adder8.do exists
then
    echo "***************************"
    echo "running simulator on adder8"
    echo "***************************"
    vsim adder8 -do adder8.do -quiet -c -t 1ps	    #run simulator on do file 
    cp adder8.list rtl_results.txt
fi

if [ -e syn_adder8 ]				#checks if syn file exists
then
    echo "**********************"
    echo "running gate synthisis"
    echo "**********************"
    dc_shell-xg-t -f syn_adder8			#runs quiet mode gate design
    vlog adder8.gate.v
fi

grep "/nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/Digital_Standard_Cell_Library/verilog" work/_info &> /dev/null #grep for cell libray

if [ $? -ne ]
 then
    echo "**************************"
    echo "Libray not found, compling"
    echo "**************************"
    ./comp_lib.sh

fi

if [ -e adder8.do ] #if adder8 do file exists call vsim on gate level design
then
    echo "********************************"
    echo "Running simulator on gate design"
    echo "********************************"
    vsim adder8 -do adder8.do -quiet -c -t 1ps
    cp adder8.list gate_results.txt
fi

diff rtl_results.txt gate_results.txt #comparing results between RTL and gate level design

if [ $? -eq 0 ]
then 
    echo "***************************"
    echo "****** Results Match ******"
    echo "***************************"
else
    echo "*********************************"
    echo "****** Results Don't Match ******"
    echo "*********************************"
fi

    
