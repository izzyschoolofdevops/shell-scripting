#!/bin/bash

# conditions 

#$1 REFRES TO TAKE THE 1ST ARGUEMENT 


ACTION=$1       
case $ACTION in 
    start) 
           echo -e "\e[starting shipping service \e[0m"
           exit 0
           ;;
    stop) 
        echo -e "\e[33m stopping shipping service \e[0m"
        exit 1
        ;;
    restart)

       echo -e "\e[33m Restarting the shipping service\e[0m"
         exit 3
         ;;
        *)
          echo -e "\e[35m valid options are start or stop or restart only \e[0m"
          echo -e "\e{33m Example Usage: \e[0m \n\t\t bash script.sh start"


    esac