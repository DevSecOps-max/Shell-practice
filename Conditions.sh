#!/bin/bash

NUMBER=$1

#   -gt - Greater than
#   -ge - Greater than or equal to
#   -le - less than or equal to
#   -ne - not equal to
#   -eq - equal to 
#   -lt - less than

if [ $NUMBER -lt 10 ]
then
    echo "the entered $NUMBER is less than 10"
else
    echo "the entered $NUMBER is not less than 10"
fi

