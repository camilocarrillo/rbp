#!/bin/bash

while [ 1 ]
do
    if [ -e /tmp/*.m3u ]
    then
        echo "m3u file dtected"
	touch /tmp/ON6h
	ls /media/white/ #wake up hard disk
	sleep 1
	mplayer -cache 8192 -shuffle -playlist /tmp/*.m3u
	rm /tmp/*.m3u
	touch /tmp/OFF
    fi
sleep 1;
done

