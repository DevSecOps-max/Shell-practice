#!/bin/bash 

DISK_USAGE=$( df -hT | grep -v Filesystem)
DISK_THRESHOLD=1 # Usually in realtime it will be above 70
MSG=""
IP_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)


while IFS= read line
do
    USAGE=$(echo $line | awk '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print $7F}')
    if [ $USAGE -gt $DISK_THRESHOLD ]
    then
        MSG+="High disk usage observed on $PARTITION: $USAGE <br>"  #represents single line break 
    fi
    
done <<< $DISK_USAGE

#echo -e $MSG

sh mail.sh "DevOps Team" "High Disk Usage" "$IP_ADDRESS" "$MSG" "joindevopsladdu@gmail.com" "Alert-High Disk Usage"








