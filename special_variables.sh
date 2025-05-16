#!/bin/bash

echo "All the variables passed to the script: $@"
echo "Number of variables: $#"
echo "script file name is: $0"
echo "Present working directory is: $PWD"
echo "user running the script: $USER"
echo "home directory of the user: $HOME"
echo "PID of the script: $$"
sleep 30 &
echo "PID of the last running command is: $!"

