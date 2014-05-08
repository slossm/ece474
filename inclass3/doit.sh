#!/bin/bash

if [ ! -d "work" ]		    	 #checking if work directory exists
then
    echo "***********************"
    echo "makeing /work directory"
    echo "***********************"

     vlib work		         #making work directory if it does not exist
fi

if [ -e "rtl_results.txt" ] || ["gate_results.txt"] 
  then
    echo "**********************************"
    echo "*** Deleting old results files ***"
    echo "**********************************"

    rm -f rtl_results.txt
    rm -f gate_results.txt

fi
if [ -e "rtl_src/alu.sv" ]	 #if alu.sv exist
then
    echo "***************"
    echo "compling alu.sv"
    echo "***************"
    vlog -novopt alu.sv			 #read and compile 
fi

if [ -e "alu.do" ]				    #if adder8.do exists
then
    echo "***************************"
    echo "running simulator on alu.sv"
    echo "***************************"
    vsim alu -do alu.do -quiet -c -t 1ps	    #run simulator on do file 
    cp alu.list rtl_results.txt
fi

if [ -e "syn_alu" ]				#checks if syn file exists
then
    echo "**********************"
    echo "running gate synthisis"
    echo "**********************"
    dc_shell-xg-t -f syn_alu			#runs quiet mode gate design
    vlog -novopt alu.gate.v
fi

grep "/nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/Digital_Standard_Cell_Library/verilog" work/_info &> /dev/null #grep for cell libray

if [ $? -ne ]
 then
    echo "**************************"
    echo "Libray not found, compling"
    echo "**************************"
    ./comp_lib.sh

fi

if [ -e alu.do ] #if adder8 do file exists call vsim on gate level design
then
    echo "********************************"
    echo "Running simulator on gate design"
    echo "********************************"
    vsim alu -do alu.do -quiet -c -t 1ps
    cp alu.list gate_results.txt
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
