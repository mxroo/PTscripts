#!/bin/bash

# by jamila khan / 2013 5 30
#
# checks rdiff error logs
#
# It checks if error logs exist from backups that ran 
# yesterday or today. If they exist and are empty
# then this passes an OK.


today=`date "+%Y-%m-%d"`
yesterday=`date -d yesterday "+%Y-%m-%d"`
cnt=`ls -l /home/report/$1/|grep "$today\|$yesterday"| wc -l`

errorcnt=`find /home/report/$1/ \( -name **"$today"** -o -name **"$yesterday"** \) -exec cat {} \; | wc -l`
errors=`find /home/report/$1/ \( -name **"$today"** -o -name **"$yesterday"** \) -exec cat {} \;`

# for testing
#echo -e "$today \n $yesterday \n $cnt \n $errorcnt \n $errors"


if [ $cnt -eq 0 ] ; then
        echo -e "CRITICAL - External backup did not run on $yesterday!"
        exit 2
fi

if [ $errorcnt -ne 0 ] ; then
        echo -e "CRITICAL - Errors in backup!\n$errors"
        exit 2
fi

echo -e "OK - Backup ran $yesterday with no errors"

exit 0
