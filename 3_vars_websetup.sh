#!/bin/bash

# Variable Declaretion
PACKAGE="httpd wget unzip"
SVC="httpd"
URL='https://www.tooplate.com/zip-templates/2098_health.zip'
ART_NAME='2098_health'
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

wget $URL > /dev/null
unzip $ART_NAME.zip > /dev/null
sudo cp -r $ART_NAME/* /var/www/html/
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
