#!/bin/bash
read -p "Enter a number: " NUM
echo 

if [ $NUM -gt 100 ]
then
    echo "We have entered in If block"
    sleep 3
    echo "Your Number is Greter than 100"
    echo
    date
else
    echo "Your Number is Less than 100" 
fi 

echo "Script execution completed successfully."