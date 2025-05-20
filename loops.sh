#!/bin/bash


USERID=$(id -u)  #Shell will execute the command inside braces and store the value in the variable
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

PACKAGES=("nodejs" "maven" "python3" "httpd")

mkdir -p $LOGS_FOLDER
echo "script started and executing at: $(date)" | tee -a $LOG_FILE


if [ $USERID -ne 0 ]
then
    echo -e "$R Error: Please run the script with the root access $N" | tee -a $LOG_FILE
    exit 11 #You can pass any value other than 0 upto 127
else
    echo "running with the root access" | tee -a $LOG_FILE
fi

LOGICCHECK (){
        if [ $1 -eq 0 ]
    then
        echo -e "Installation of $2 is $G success $N" | tee -a $LOG_FILE
    else
        echo -e "Installation of $2 is $R failed  $N" | tee -a $LOG_FILE
        exit 21
    fi

}

for package in ${PACKAGES[@]}
do

    dnf list installed $package &>>$LOG_FILE

    if [ $? -ne 0 ]
    then
        echo "$package is not installed...will be installed shortly" | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        LOGICCHECK $? "$package"
    else
        echo -e "Nothing to do $package.. $Y already installed $N" | tee -a $LOG_FILE
    fi

done






