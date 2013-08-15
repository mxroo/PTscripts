#!/bin/sh

result=`cat /home/report/$1/backuptests/result_$2`

if [ $result -eq 0 ] ; then
        cat "/home/report/$1/backuptests/localbackuptest_$2"
        exit 0
fi

      	cat "/home/report/$1/backuptests/localbackuptest_$2"
exit 2
