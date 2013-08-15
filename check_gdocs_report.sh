#!/bin/bash

#
# by jamila khan / 2012 06 13
#
# checks if in log of google docs backup there are errors.
#

success=`tail -n 1 /home/report/$1/gdocsbackup.log | cut -d ' ' -f 1`
unchanged=`tail -n 1 /home/report/$1/gdocsbackup.log | cut -d ' ' -f 3`
error=`tail -n 1 /home/report/$1/gdocsbackup.log | cut -d ' ' -f 5`
fail=`tail -n 1 /home/report/$1/gdocsbackup.log | cut -d ' ' -f 8`


if [ $fail -eq 0 -a $error -eq 0 ] ; then
        echo -e "OK - $success successful, $unchanged unchanged, $error service error, $fail failed"

        exit 0
fi

echo -e "CRITICAL - $success successful, $unchanged unchanged, $error service error, $fail failed"
exit 2
