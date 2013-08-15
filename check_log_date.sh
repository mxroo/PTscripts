#!/bin/bash

today=`date "+%b %e"`
yesterday=`date -d yesterday "+%b %e"`
created=`ls -l $1 | cut -d ' ' -f 6-8`

cnt=`cat $1|grep "$today\|$yesterday"|wc -l`
if [ $cnt -gt 0 ] ; then
        echo "OK - file created $created"
        exit 0
fi

echo "CRITICAL - file created $created"
exit 2
