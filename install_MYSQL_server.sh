#!bin/bash


USERID=$(id -u)  #Shell will execute the command inside braces and store the value in the variable

if [ $USERID -ne 0 ]
then
    echo "Error: Please run the script with the root access"
    exit 11 #You can pass any value other than 0 upto 127
else
    echo "running with the root access"
fi

dnf list installed mysql


if [ $? -ne 0 ]
then
    echo "MYSQL is not installed...will be installed shortly"
    dnf install mysql -y
        if [ $? -eq 0 ]
    then
        echo "Installation of MYSQL is success......."
    else
        echo "Installation of MYSQL is failed........"
        exit 21
    fi
else
    echo "MYSQL is already installed.. Nothing to do"
fi




# dnf install mysql -y      #mysql installation command

# if [ $? -eq 0 ]
# then
#     echo "Installation of MYSQL is success......."
# else
#     echo "Installation of MYSQL is failed........"
#     exit 21
# fi








