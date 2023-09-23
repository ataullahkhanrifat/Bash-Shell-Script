#!/bin/bash

#Install dependecies
echo "######################################################"
echo " Install packages."
echo "######################################################"
echo
sudo yum install wget unzip httpd -y > /dev/null

#Start & Enable Service
echo "######################################################"
echo " Start and Enable Httpd Service"
echo "######################################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

#Creating temp Directory
echo "######################################################"
echo " Starting Artifact Deployment"
echo "######################################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

wget https://www.tooplate.com/zip-templates/2098_health.zip > /dev/null
unzip 2098_health.zip > /dev/null
sudo cp -r 2098_health/* /var/www/html/
echo

echo "######################################################"
echo " Restart HTTPD service"
echo "######################################################"
systemctl restart httpd
echo

echo "######################################################"
echo " Removing Temporary Files"
echo "######################################################"

rm -rf /tmp/webfiles
echo

sudo systemctl status httpd
ls /var/www/html/
