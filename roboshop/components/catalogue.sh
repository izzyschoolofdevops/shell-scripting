#!/bin/bash

USER_ID=$(id -u)
COMPONENT=catalogue 
LOGFILE="/tmp/${COMPONENT}.log"
APPUSER="roboshop"

stat() {
if [ $1 -eq 0 ] ; then 
    echo -e "\e[32m success \e[0m"
else 
    echo -e "\e[32m Failure \e[0m"

fi

}

if [ $USER_ID -ne 0 ] ; then 
    echo -e "\e[32m This script is expected to be excuted with sudo or as a root user \e[0m"
    echo -e "\e[32m Example Usage: \n\t\t \e[0m sudo bash scriptName componentName"
    exit 1 
fi

echo -n "Installing Nodejs :"
yum install nodejs -y          &>> $LOGFILE
stat $?

id $APPUSER             &>> $LOGFILE
if [ $? -ne 0 ] : then 
   echo -e "Creating $APPUSER
   useradd $APPUSER
   stat $?
else
   echo -e "\e[35m skipping \e[0m"
fi