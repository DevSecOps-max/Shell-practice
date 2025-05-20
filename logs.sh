#!/bin/bash


USERID=$(id -u)  #Shell will execute the command inside braces and store the value in the variable
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME= $(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "script started and executing at: $(date)" &>>$LOG_FILE



if [ $USERID -ne 0 ]
then
    echo -e "$R Error: Please run the script with the root access $N" &>>$LOG_FILE
    exit 11 #You can pass any value other than 0 upto 127
else
    echo "running with the root access" &>>$LOG_FILE
fi


LOGICCHECK (){
        if [ $1 -eq 0 ]
    then
        echo -e "Installation of $2 is $G success $N" &>>$LOG_FILE
    else
        echo -e "Installation of $2 is $R failed  $N" &>>$LOG_FILE
        exit 21
    fi

}

dnf list installed nodejs &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo "nodejs is not installed...will be installed shortly" &>>$LOG_FILE
    dnf install nodejs -y &>>$LOG_FILE
    LOGICCHECK $? "nodejs"
else
    echo -e "Nothing to do nodejs.. $Y already installed $N" &>>$LOG_FILE
fi

dnf list installed maven &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo "maven is not installed...will be installed shortly" &>>$LOG_FILE
    dnf install maven -y &>>$LOG_FILE
    LOGICCHECK $? "maven"
else
    echo -e "Nothing to do maven $Y already installed $N" &>>$LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo "python3 is not installed...will be installed shortly" &>>$LOG_FILE
    dnf install python3 -y &>>$LOG_FILE
    LOGICCHECK $? "python3"
else
    echo -e "Nothing to do python3 $Y already installed $N" &>>$LOG_FILE
fi








