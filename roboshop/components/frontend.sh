#!/bin/bash

USER_ID=$(id -u)
COMPONENT=$1
LOGFILE="/tmp/${COMPONENT.log}"

stat() {
if [ $1 -eq 0 ] ; then 
    echo -e "\e[32m success \e[0m"
else 
    echo -e "\e[32m Failure \e[0m"

fi

}


if [ $UID -ne 0 ] ; then 
    echo -e "\e[32m This script is expected to be excuted with sudo or as a root user \e[0m"
    echo -e "\e[35m Example Usage: \n\t\t \e[0m sudo bash scriptName componentName"
    exit 1 
fi

echo -e "***** \e[32m Configuring $COMPONENT \e[0m*****"

echo -n "Installing Nginx :"
yum install nginx -y      &>> $LOGFILE
stat $?

echo -n "Downloading Component $COMPONENT :"
curl -s -L -o /tmp/$COMPONENT.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"


echo -n "Cleanup of $1 component :"
cd /usr/share/nginx/html
rm -rf *    &>> $LOGFILE
stat $?

echo -n "Extracting $1: "
unzip /tmp/frontend.zip      &>> $LOGFILE
stat $?

echo -n "configuring $1 :"
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf
stat $?

echo -n "Restarting $1 :"
systemctl enable nginx     &>> $LOGFILE
systemctl daemon-reload    &>> $LOGFILE
systemctl start nginx      &>> $LOGFILE
stat $?

echo -e "***** \e[34m $1 Configuring is completed  \e[0m*****"