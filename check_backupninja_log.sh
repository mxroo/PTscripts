#!/bin/bash

#
# by pawel kudzia / 2009 03 02
#
# modified by jamila khan / 2012 02 15
#
# checks if in logs of backup ninja there are messages other then debug or info . [ eg warning or error ].
#

cnt=`tail -n 20 /var/log/backupninja.log|grep -v " Debug:"|grep -v " Info:"|wc -l`
if [ $cnt -eq 0 ] ; then
        echo OK - no errors or warnings
        exit 0
fi

echo "CRITICAL - $cnt errors or warnings"
exit 2
