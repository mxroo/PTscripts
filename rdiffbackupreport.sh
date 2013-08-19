#!/bin/sh
today=`date "+%Y-%m-%d"`

/usr/bin/find /cygdrive/e/DeltaCopy/MEMBERS/rdiff-backup-data/ -type f -name error* -mtime -1 -exec rsync -r --chmod=ugo=rwX --delete {} reverse@palante2.palantetech.com:/home/report/pth/error_log.$today.e_MEMBERS \;
/usr/bin/find /cygdrive/e/DeltaCopy/PUBLIC/rdiff-backup-data/ -type f -name error* -mtime -1 -exec rsync -r --chmod=ugo=rwX --delete {} reverse@palante2.palantetech.com:/home/report/pth/error_log.$today.e_PUBLIC \;
/usr/bin/find /cygdrive/e/DeltaCopy/VIDEO/rdiff-backup-data/ -type f -name error* -mtime -1 -exec rsync -r --chmod=ugo=rwX --delete {} reverse@palante2.palantetech.com:/home/report/pth/error_log.$today.e_VIDEO \;

if [ -d "/cygdrive/k" ]
then
/usr/bin/find /cygdrive/k/DeltaCopy/MEMBERS/rdiff-backup-data/ -type f -name error* -mtime -1 -exec rsync -r --chmod=ugo=rwX --delete {} reverse@palante2.palantetech.com:/home/report/pth/error_log.$today.k_MEMBERS \;
/usr/bin/find /cygdrive/k/DeltaCopy/PUBLIC/rdiff-backup-data/ -type f -name error* -mtime -1 -exec rsync -r --chmod=ugo=rwX --delete {} reverse@palante2.palantetech.com:/home/report/pth/error_log.$today.k_PUBLIC \;
/usr/bin/find /cygdrive/k/DeltaCopy/VIDEO/rdiff-backup-data/ -type f -name error* -mtime -1 -exec rsync -r --chmod=ugo=rwX --delete {} reverse@palante2.palantetech.com:/home/report/pth/error_log.$today.k_VIDEO \;

fi

if [ -d "/cygdrive/g" ]
then

/usr/bin/find /cygdrive/g/DeltaCopy/MEMBERS/rdiff-backup-data/ -type f -name error* -mtime -1 -exec rsync -r --chmod=ugo=rwX --delete {} reverse@palante2.palantetech.com:/home/report/pth/error_log.$today.g_MEMBERS \;
/usr/bin/find /cygdrive/g/DeltaCopy/PUBLIC/rdiff-backup-data/ -type f -name error* -mtime -1 -exec rsync -r --chmod=ugo=rwX --delete {} reverse@palante2.palantetech.com:/home/report/pth/error_log.$today.g_PUBLIC \;
/usr/bin/find /cygdrive/g/DeltaCopy/VIDEO/rdiff-backup-data/ -type f -name error* -mtime -1 -exec rsync -r --chmod=ugo=rwX --delete {} reverse@palante2.palantetech.com:/home/report/pth/error_log.$today.g_VIDEO \;

fi

