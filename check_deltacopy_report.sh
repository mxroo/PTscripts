#!/bin/bash

# by jamila khan / 2012 12 13
#
# checks deltacopy logs
#
# this is for a setup with two deltacopy jobs called 
# externalbackup and internalbackup that copy all of their logs
# to the icinga server, in a subdirectory (passed as a variable $1)
# of the /home/report directory.
# It checks if logs exist that ran yesterday or today,
# looks for errors in them, and then passes
# the last lines of those logs when successful.


today=`date "+%Y%m%d"`
yesterday=`date -d yesterday "+%Y%m%d"`
extcnt=`ls -l /home/report/$1/externalbackup*|grep "$today\|$yesterday"| wc -l`
staticcnt=`ls -l /home/report/$1/staticbackup*|grep "$today\|$yesterday"| wc -l`
errorcnt=`cat /home/report/$1/*backup_$yesterday*|grep "error"| wc -l`
errors=`cat /home/report/$1/*backup_$yesterday*|grep "error"`
externalrecent=`tail -n 1 /home/report/$1/externalbackup_$yesterday*`
staticrecent=`tail -n 1 /home/report/$1/staticbackup_$yesterday*`


if [ $extcnt -eq 0 ] ; then
        echo -e "CRITICAL - External backup did not run on $yesterday!"
        exit 2
fi

if [ $staticcnt -eq 0 ] ; then
        echo -e "CRITICAL - Static  backup did not run on $yesterday!"
        exit 2
fi

if [ $errorcnt -ne 0 ] ; then
        echo -e "CRITICAL - Errors in backup!\n$errors"
        exit 2
fi

echo -e "OK - Backup last ran $today\n$externalrecent\n$staticrecent"

exit 0
