#!/bin/bash


#### LOG POSITION ######
LOG_FOLDER=/home/fandikurnia/scripts/logs/

#ls -t1 $LOG_FOLDER | head -n 1
# Get the lastest modify files
files=$(ls -lrt $LOG_FOLDER | tail -1 | awk '{print $NF}')
echo $LOG_FOLDER$files
count=0


grep -e '500' $LOG_FOLDER$files | (
date=$(date -d "10 minutes ago" +"%s")
while read line; do
[ "$(date -d"$(echo $line | cut -d']' -f1 | sed -e 's/.*\[//;s/\// /g;s/:/ /;')" +"%s")" -ge "$date" ] && echo $line;
done) | wc -l
