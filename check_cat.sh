#!/bin/bash

#
# checks in files if there are instances of a given string.
# $1 is the file
# $2 is the string
# $3 is the threshold, any more than $3 and it will be Critical

cnt=`cat $1|grep $2|wc -l`
recent=`cat $1|grep $2`
if [ $cnt -eq $3 ] ; then
        echo OK - no errors or warnings
        exit 0
fi

echo -e "CRITICAL - String $2 appeared $cnt times\n$recent"
exit 2
