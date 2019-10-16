#!/bin/bash

max_time=3s
RED="\033[31m"
GREEN="\033[32m"
NORMAL="\033[0;39m"
BLUE="\e[34m"


echo -e "┌───────────────────────────────────────────┐"
echo -e "│▀▛▘     ▐        ▌    ▞▀▖            ▗▚▘   │"
echo -e "│ ▌▞▀▖▞▀▘▜▀ ▞▀▖ ▞▀▌▞▀▖ ▌  ▞▀▖▛▀▖▞▀▖▚▗▘▝▀▖▞▀▖│"
echo -e "│ ▌▛▀ ▝▀▖▐ ▖▛▀  ▌ ▌▛▀  ▌ ▖▌ ▌▌ ▌▛▀ ▗▚ ▞▀▌▌ ▌│"
echo -e "│ ▘▝▀▘▀▀  ▀ ▝▀▘ ▝▀▘▝▀▘ ▝▀ ▝▀ ▘ ▘▝▀▘▘ ▘▝▀▘▝▀ │"
echo -e "└───────────────────────────────────────────┘"
while true; do
echo -e "\nEscolha o protocolo"
echo -e " 1 - TCP"
echo -e " 2 - UPD"
echo -e " 3 - ICMP"
echo -e " 4 - EXIT"


    read NUM
    case $NUM in

    1)
    read -p "Digite o host/port : (Ex; www.google.com/80): " END

    for (( c=1; c<=5; c++ ))
        do
            for ip in "$END"
            do
                if timeout $max_time bash -c "true <>/dev/tcp/$ip" 2>/dev/null
                then
                    echo -e "Host: ${ip}  .................................. $GREEN[OK]$NORMAL"
                else
                    echo -e "Host: ${ip}  .................................. $RED[FAIL]$NORMAL"
                fi
            done
    done
    ;;

    2)
    read -p "Digite o host/port : (Ex; www.google.com/53): " END

    for (( c=1; c<=5; c++ ))
        do
            for ip in "$END"
            do
                if timeout $max_time bash -c "true <>/dev/udp/$ip" 2>/dev/null
                then
                    echo -e "Host: ${ip}  .................................. $GREEN[OK]$NORMAL"
                else
                    echo -e "Host: ${ip}  .................................. $RED[FAIL]$NORMAL"
                fi
            done
    done

    ;;
    3)
    echo -e "Digite o endereço: "
    read END
    ping -c5 $END

    ;;

    4)
    echo -e "$BLUE Goodbye $GREEN;-)$NORMAL"
    exit
    esac
done