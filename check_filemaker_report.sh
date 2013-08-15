#!/bin/bash

# modified by jamila khan / 2013 07 01
#
# checks Filemaker Backup logs.
#

today=`date "+%b %e"`
yesterday=`date -d yesterday "+%b %e"`

cnt=`tail -n 20 /home/report/$1/Events.log|grep "$today\|$yesterday"|wc -l`
if [ $cnt -gt 0 ] ; then
        echo -e "OK - backup ran on $today" 
        exit 0
fi

echo -e "CRITICAL - backup did not run properly"
exit 2
