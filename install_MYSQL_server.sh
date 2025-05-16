#!bin/bash


USERID=$(id -u)  #Shell will execute the command inside braces and store the value in the variable

if [ $USERID -ne 0 ]
then
    echo "Error: Please run the script with the root access"
else
    echo "running with the root access"
fi

dnf install mysql -y      #mysql installation command






