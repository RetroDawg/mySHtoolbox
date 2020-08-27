#!/bin/sh
# Compress local /home directory 
# Get current date
VAR_CURRENTDATE=`date +%Y-%m-%d`
echo "Todays date: $VAR_CURRENTDATE"
# Tar /home
tar -cJf /mnt/backup/home_bak-$VAR_CURRENTDATE.tar.xz /home

VAR_PASTDATE=`date +%Y-%m-%d -d "22 day ago"`
echo "22 day ago: $VAR_PASTDATE"
VAR_TARFILES=/mnt/backup/*.tar.xz
for file in $VAR_TARFILES
do
    if [[ $file == *$VAR_PASTDATE* ]] ; then
        echo "Removing: $file"
        rm -f $file 
    else
        continue
    fi
done
