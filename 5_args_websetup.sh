#!/bin/bash

# Variable Declaretion
PACKAGE="httpd wget unzip"
SVC="httpd"
#URL='https://www.tooplate.com/zip-templates/2098_health.zip'
#ART_NAME='2098_health'
TEMPDIR="/tmp/webfiles"

#Install dependecies
echo "######################################################"
echo " Install packages. "
echo "######################################################"
echo
sudo yum install $PACKAGE -y > /dev/null

#Start & Enable Service
echo "######################################################"
echo " Start and Enable Httpd Service"
echo "######################################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

#Creating temp Directory
echo "######################################################"
echo " Starting Artifact Deployment"
echo "######################################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo

wget $1 > /dev/null
unzip $2.zip > /dev/null
sudo cp -r $2/* /var/www/html/
echo

echo "######################################################"
echo " Restart HTTPD service"
echo "######################################################"
systemctl restart $SVC
echo

echo "######################################################"
echo " Removing Temporary Files"
echo "######################################################"

rm -rf $TEMPDIR
echo

sudo systemctl status $SVC
ls /var/www/html/

#https://www.tooplate.com/zip-templates/2128_tween_agency.zip
#2128_tween_agency