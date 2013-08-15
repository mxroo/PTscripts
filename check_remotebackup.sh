#!/bin/sh

server=ali.mayfirst.org
scpuser=srlp-sync
#directory=~/backups/sylvia/var/log/syslog

today=`date -d "10 days ago" "+%b %_d"`
#yesterday=`date -d "11 days ago" "+%b %_d"`

ssh $scpuser@$server 'rdiff-backup --force -r 10D ~/backups/sylvia/var/log/syslog ~/remotesyslog'

# retrieve remotesyslog from remote backup server

scp $scpuser@$server:~/remotesyslog /tmp/remotesyslog

# get number of times today or yesterday's date occurs
cnt=`tail -n 20 /tmp/remotesyslog|grep "$today"|wc -l`

if [ $cnt -ge 20 ] ; then
        echo "OK - Backup from $today is good."
        exit 0
fi

echo "CRITICAL - Backup did not run properly $today"
exit 2

