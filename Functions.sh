#!/bin/bash


USERID=$(id -u)  #Shell will execute the command inside braces and store the value in the variable

if [ $USERID -ne 0 ]
then
    echo "Error: Please run the script with the root access"
    exit 11 #You can pass any value other than 0 upto 127
else
    echo "running with the root access"
fi


LOGICCHECK (){
        if [ $1 -eq 0 ]
    then
        echo "Installation of $2 is success......."
    else
        echo "Installation of $2 is failed........"
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
    echo "nodejs is already installed.. Nothing to do"
fi

dnf list installed maven

if [ $? -ne 0 ]
then
    echo "maven is not installed...will be installed shortly"
    dnf install maven -y
    LOGICCHECK $? "maven"
else
    echo "maven is already installed.. Nothing to do"
fi

dnf list installed python3

if [ $? -ne 0 ]
then
    echo "python3 is not installed...will be installed shortly"
    dnf install python3 -y
    LOGICCHECK $? "python3"
else
    echo "python3 is already installed.. Nothing to do"
fi








