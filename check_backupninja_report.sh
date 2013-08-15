#!/bin/bash

#
# by pawel kudzia / 2009 03 02
#
# modified by jamila khan / 2012 02 15
#
# checks if in logs of backup ninja there are messages other then debug or info . [ eg warning or error ].
#

today=`date "+%b %d"`
yesterday=`date -d yesterday "+%b %d"`
cnt=`cat /home/report/$1/backupninja.log|grep ^"$today\|$yesterday"|grep -v " Debug:"|grep -v " Info:"|wc -l`
recent=`cat /home/report/$1/backupninja.log|grep "$today\|$yesterday"|grep "warning\|Warning"`
if [ $cnt -eq 0 ] ; then
        echo OK - no errors or warnings
        exit 0
fi

echo -e "CRITICAL - $cnt errors or warnings\n$recent"
exit 2
