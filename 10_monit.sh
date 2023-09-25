#!/bin/bash
echo "##############################################"
date 
ls /var/run/httpd/httpd.pid &> /dev/null

if [ $? -eq 0 ]
then 
    echo "Httpd process is running"
else
    echo "Httpd process is not running"
    echo "start the process"
    systemctl start httpd

    if [ $? -eq 0 ]
    then 
        echo "process start succesfully."
    else
        echo "Process starting Faield, Contact the admin."
    fi
fi
echo "##############################################"
echo 


# /opt/scripts/10_monit.sh
# crontab -e
# MM HH DOM mm DOW Command
# 30 20 * * 1-5 Command 
#* * * * * /opt/scripts/10_monit.sh &>> /var/log/monit_httpd.log