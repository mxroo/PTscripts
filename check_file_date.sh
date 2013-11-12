#!/bin/bash

today=`date "+%Y-%m-%d"`
yesterday=`date -d yesterday "+%Y-%m-%d"`
logon=%ENTER_USER_AND_SERVER_HERE%
cnt=`ssh $logon 'ls -l %ENTER_FILE_LOCATION_HERE%' | grep "$today\|$yesterday"|wc -l`

echo $cnt

if [ $cnt -gt 0 ] ; then
        echo "OK - file found from $yesterday"
        exit 0
fi

echo "CRITICAL - file not found"
exit 2
