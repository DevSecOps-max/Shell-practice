#!/bin/bash


USERID=$(id -u)  #Shell will execute the command inside braces and store the value in the variable
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]
then
    echo -e "$R Error: Please run the script with the root access $N"
    exit 11 #You can pass any value other than 0 upto 127
else
    echo "running with the root access"
fi


LOGICCHECK (){
        if [ $1 -eq 0 ]
    then
        echo -e "Installation of $2 is $G success $N"
    else
        echo -e "Installation of $2 is $R failed  $N"
        exit 21
    fi

}

dnf list installed nodejs

if [ $? -ne 0 ]
then
    echo "nodejs is not installed...will be installed shortly"
    dnf install nodejs -y
    LOGICCHECK $? "nodejs"
else
    echo -e "Nothing to do nodejs.. $Y already installed $N"
fi

dnf list installed maven

if [ $? -ne 0 ]
then
    echo "maven is not installed...will be installed shortly"
    dnf install maven -y
    LOGICCHECK $? "maven"
else
    echo -e "Nothing to do maven $Y already installed $N"
fi

dnf list installed python3

if [ $? -ne 0 ]
then
    echo "python3 is not installed...will be installed shortly"
    dnf install python3 -y
    LOGICCHECK $? "python3"
else
    echo -e "Nothing to do python3 $Y already installed $N"
fi








