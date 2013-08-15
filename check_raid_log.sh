#!/bin/bash

# by jamila khan / 2013 5 30
#
# checks raid error logs
#
# It checks if raid error logs exist, makes sure they
# were modified in the last day

exitcode=`tail -n 1 /home/report/$1/raidlog.txt| cut -d ' ' -f 3`
end=`tail -n 1 /home/report/$1/raidlog.txt`

if [[ "$exitcode" == *0x00* ]] ; then
        echo -e "OK - RAID log exited with 0x00"
        exit 0
fi

echo -e "CRITICAL - RAID log has errors \n $end " 

exit 2
