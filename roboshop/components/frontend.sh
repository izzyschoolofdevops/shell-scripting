#!/bin/bash
echo -e "***** \e[32m Confioguring frontend \e[0m*****"


echo "Installing Nginx ;"
yum install nginx -y 

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
