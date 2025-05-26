#!/bin/bash 

DISK_USAGE=$( df -hT | grep -v Filesystem)
DISK_THRESHOLD=1 # Usually in realtime it will be above 70


while IFS= read line
do
    USAGE=$(echo $line | awk '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print $6F}')
    echo "$PARTITION: $USAGE"
    
done <<< $DISK_USAGE






