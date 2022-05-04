#!/bin/bash

# Name: Process ID Monitor
# Author: Mayowa Bodunwa
# Description: Checks the status of a PID in realtime with specified time intervals

#Variable Declaration
PID="$1";
RE_NUM='^[0-9]+$'
TIMER="$2"
Red='\033[0;31m'
Color_Off='\033[0m'

#Process and Timer Function
pid_func() {
        while true; do
            clear
            echo -e "${Red}Real-Time Process ID Monitor${Color_Off}"
            echo "Time: `date +%H:%M:%S`"
            ps -q $PID -o comm,user,%cpu,%mem,start,stat 2> /dev/null
            read -s -t $TIMER -n 1 -p "Press "q" to Quit: " QUIT_PID
            if [[ $QUIT_PID = [Qq] ]]; then
                printf "\n"
                exit 0
                sleep $TIMER   
            fi    
        done
    }

#Argument Conditions
if [[ $# = 0 ]]; then
    echo "No Argument Passed. Usage: procidmon #PID #TIME(s)"
    exit 1
elif [[ $PID =~ $RE_NUM && $TIMER =~ $RE_NUM ]]; then
    pid_func
else echo "Bad Usage: Enter #PID Number as First Argument, #TIMER Number in (s) as Second Argument"
    exit
fi   
