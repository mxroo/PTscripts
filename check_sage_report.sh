#!/bin/bash

# modified by jamila khan / 2013 03 28
#
# checks in Sage Backup logs if there are errors.
#

today=`date "+%m%d%y"`
today2=`date "+%Y-%m-%d"`
#yesterday=`date -d yesterday "+%m%d%y"`

cnt=`cat /home/report/$1/sagebackup.log|grep "$today.ptb"|wc -l`
usage=`cat /home/report/$1/appsrvfiles/appsrvfiles_$today2.txt | grep Peachtree`
lastrun=`tail -n 2 /home/report/$1/sagebackup.log | head -n 1 | cut -d ' ' -f 4`
#recent=`tail -n 9 /home/report/$1/sagebackup.log`

if [ $cnt -gt 0 ] ; then
        echo -e "OK - backup ran on $today" 
        exit 0
fi

echo -e "CRITICAL - backup did not run properly $today\n backup last ran $lastrun\n the following files were open \n $usage"
exit 2
