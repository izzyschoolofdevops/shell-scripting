#!/bin/bash

USER_ID=$(id -u)
COMPONENT=$1


if [ $UID -ne 0 ] ; then 
    echo -e "\e[32m This script is expected to be excuted with sudo or as a root user \e[0m"
    echo -e "\e[35m Example Usage: \n\t\t \e[0m sudo bash scriptName componentName"
    exit 1 
fi

echo -e "***** \e[32m Confioguring frontend \e[0m*****"

echo -n "Installing Nginx :"
yum install nginx -y      &>> /tmp/frontend.log
if [ $? -eq 0 ] ; then 
    echo -e "\e[32m success \e[0m"
else 
    echo -e "\e[32m Failure \e[0m"

fi

echo -n "Downloading Component $1 :


#systemctl enable nginx
#systemctl start nginx
#curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
#cd /usr/share/nginx/html
# -rf *
#unzip /tmp/frontend.zip
#mv frontend-main/* .
#mv static/* .
#rm -rf frontend-main README.md
#mv localhost.conf /etc/nginx/default.d/roboshop.conf
