#!/bin/bash
# Developer: Jose Arrisola Jr.
# Goal: Runs rsync, retrying on errors up to a maximum number of tries.
# Simply edit the rsync line in the script to whatever parameters you need.

# Trap interrupts and exit instead of continuing the loop
trap "echo Exited!; exit;" SIGINT SIGTERM
MAX_RETRIES=5
i=1

# Set the initial return value to failure
false

while [ $? -ne 0 -a $i -lt $MAX_RETRIES ]
do
 i=$(($i+1))

rsync -auvvh  -e ssh /localhostpath root@hostname:/hostpath

done

if [ $i -eq $MAX_RETRIES ]
then
  echo "Hit maximum number of retries, giving up."
fi
