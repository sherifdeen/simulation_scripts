#!/bin/bash
clear

myVar=0
while [ $myVar -lt 11 ]; do
    for ((myCap=1; myCap<=50; myCap++))
    do
    	echo "Sim: reserved = $myVar & CSB = $myCap "
	echo "mix1 "
	./sim-outorder -redir:sim mix1.out -max:inst 1000000 -rf:size 512 astarNS.1.arg gccNS.1.arg gobmkNS.1.arg dealIINS.1.arg -myVar $myVar -myCap $myCap

	echo "mix2 "
	./sim-outorder -redir:sim mix2.out -max:inst 1000000 -rf:size 512 namdNS.1.arg calculixNS.1.arg povrayNS.1.arg libquantumNS.1.arg -myVar $myVar -myCap $myCap

	echo "mix3 "
	./sim-outorder -redir:sim mix3.out -max:inst 1000000 -rf:size 512 namdNS.1.arg soplexNS.1.arg lbmNS.1.arg xalancbmkNS.1.arg -myVar $myVar -myCap $myCap

	echo "mix4 "
	./sim-outorder -redir:sim mix4.out -max:inst 1000000 -rf:size 512 specrandNS.1.arg astarNS.1.arg milcNS.1.arg sjengNS.1.arg -myVar $myVar -myCap $myCap

	echo "mix5 "
	./sim-outorder -redir:sim mix5.out -max:inst 1000000 -rf:size 512 leslie3dNS.1.arg gromacsNS.1.arg perlbenchNS.1.arg lbmNS.1.arg -myVar $myVar -myCap $myCap

	echo "mix6 "
	./sim-outorder -redir:sim mix6.out -max:inst 1000000 -rf:size 512 bzip2NS.1.arg xalancbmkNS.1.arg gobmkNS.1.arg cactusADMNS.1.arg -myVar $myVar -myCap $myCap

	echo "mix7 " 
   	./sim-outorder -redir:sim mix7.out -max:inst 1000000 -rf:size 512 milcNS.1.arg lbmNS.1.arg gromacsNS.1.arg gccNS.1.arg -myVar $myVar -myCap $myCap

	echo "mix8 "
	./sim-outorder -redir:sim mix8.out -max:inst 1000000 -rf:size 512 sjengNS.1.arg perlbenchNS.1.arg hmmerNS.1.arg soplexNS.1.arg -myVar $myVar -myCap $myCap

	echo "mix9 "
	./sim-outorder -redir:sim mix9.out -max:inst 1000000 -rf:size 512 bzip2NS.1.arg gromacsNS.1.arg namdNS.1.arg leslie3dNS.1.arg -myVar $myVar -myCap $myCap

	echo "mix10 "
	./sim-outorder -redir:sim mix10.out -max:inst 1000000 -rf:size 512 milcNS.1.arg dealIINS.1.arg astarNS.1.arg povrayNS.1.arg -myVar $myVar -myCap $myCap

	echo "mix11 "
	./sim-outorder -redir:sim mix11.out -max:inst 1000000 -rf:size 512 xalancbmkNS.1.arg calculixNS.1.arg cactusADMNS.1.arg soplexNS.1.arg -myVar $myVar -myCap $myCap

	echo "mix12 "
	./sim-outorder -redir:sim mix12.out -max:inst 1000000 -rf:size 512 perlbenchNS.1.arg gobmkNS.1.arg specrandNS.1.arg namdNS.1.arg -myVar $myVar -myCap $myCap

    
    	./grepIPC.sh
	
	python average.py
    done
    
    let myVar=myVar+1

done


