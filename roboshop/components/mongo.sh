#!/bin/bash

USER_ID=$(id -u)
COMPONENT=mongo 
LOGFILE="/tmp/${COMPONENT}.log"
MONGO_REPO="https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo"
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

echo -n "configuring $COMPONENT repo :"
curl -s -o /etc/yum.repos.d/mongodb.repo  $MONGO_REPO
stat $?

echo -n "Installing  $COMPONENT :"
yum install -y mongodb-org  &>> ${LOGFILE}
stat $?

echo -n "Enabling $COMPONENT visibility :"
sed -i -e 's/0.0.0.0/0.0.0.1/' /etc/mongod.conf
stat $?

echo -n "Starting $COMPONENT :"
systemctl enable mongo     &>> $LOGFILE
systemctl daemon-reload    &>> $LOGFILE
systemctl start mongod     &>> $LOGFILE
stat $?