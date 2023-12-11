#!/bin/bash

echo -e "Demo on If , If Else If usage"
ACTION=$1

if [ "$ACTION" == "start" ] ; then 
    echo -e "\e[32m starting shipping service \e[0m"
    exit 0

fi
 