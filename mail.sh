#!/bin/bash


TO_TEAM=$1
ALERT_TYPE=$2
IP_ADDRESS=$3
MSG=$4
FINAL_MSG=$(printf '%s\n' "$MSG" | sed -e 's/[]\/$*.^[]/\\&/g')
TO_ADDRESS=$5
SUBJECT=$6


FINAL_BODY=$(sed -e "s/TO_TEAM/$1/g" -e "s/ALERT_TYPE/$2/g" -e "s/IP_ADDRESS/$3/g" -e "s/MSG/$4/g" template.html)


{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo ""
echo "$FINAL_BODY"
} | msmtp "$TO_ADDRESS"