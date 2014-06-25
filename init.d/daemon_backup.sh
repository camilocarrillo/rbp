#!/bin/bash

while [ 1 ]
do
	mount /media/black
        rsync -rltuv --no-p --delete /media/mybooklive/dropbox /media/black/backup/
	umount /media/black
	sleep 86400;
done

