#!/bin/bash

USER_ID=$(id -u)
COMPONENT=frontend 
LOGFILE="/tmp/${COMPONENT}.log"

stat() {
if [ $1 -eq 0 ] ; then 
    echo -e "\e[32m success \e[0m"
else 
    echo -e "\e[32m Failure \e[0m"

fi

}


if [ $USER_ID -ne 0 ] ; then 
    echo -e "\e[32m This script is expected to be excuted with sudo or as a root user \e[0m"
    echo -e "\e[35m Example Usage: \n\t\t \e[0m sudo bash scriptName componentName"
    exit 1 
fi

echo -e "***** \e[32m Configuring $COMPONENT \e[0m*****"

echo -n "Installing Nginx :"
yum install nginx -y      &>> $LOGFILE
stat $?

echo -n "Downloading ${COMPONENT} Component  :"
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"
stat $?


echo -n "Clean up of ${COMPONENT} :"
cd /usr/share/nginx/html
rm -rf *    &>> $LOGFILE
stat $?

echo -n "Extracting $COMPONENT :"
unzip /tmp/${COMPONENT}.zip      &>> $LOGFILE
stat $?

echo -n "configuring $COMPONENT :"
mv ${COMPONENT}-main/* .
mv static/* .
rm -rf ${COMPONENT}-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf
stat $?

echo -n "Restarting $1 :"
systemctl enable nginx     &>> $LOGFILE
systemctl daemon-reload    &>> $LOGFILE
systemctl start nginx      &>> $LOGFILE
stat $?

echo -e "***** \e[34m ${COMPONENT} Configuring is completed  \e[0m*****"