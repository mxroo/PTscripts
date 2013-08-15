#!/bin/bash

#
# by jamila khan / 2012 12 27
#
# checks if in logs of mfpl_backup if there are errors.
#

cnt=`cat /home/report/$1/mfpl_backup.log|grep "Error"|wc -l`
recent=`cat /home/report/$1/mfpl_backup.log|grep "Error"`
if [ $cnt -eq 0 ] ; then
        echo OK - no errors or warnings
        exit 0
fi

echo -e "CRITICAL - $cnt errors or warnings\n$recent"
exit 2
