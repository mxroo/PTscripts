#!/bin/bash

#
# by pawel kudzia / 2009 03 02
#
# modified by jamila khan / 2012 02 21
#
# checks if in logs of timemachine if there are errors.
#

today=`date "+%b %_d"`
yesterday=`date -d yesterday "+%b %_d"`
cnt=`cat /home/report/$1/timemachine.txt|grep "$today\|$yesterday"|grep "Error"|wc -l`
recent=`cat /home/report/$1/timemachine.txt|grep "$today\|$yesterday"|grep "Error"`
if [ $cnt -eq 0 ] ; then
        echo OK - no errors or warnings
        exit 0
fi

echo -e "CRITICAL - $cnt errors or warnings\n$recent"
exit 2
