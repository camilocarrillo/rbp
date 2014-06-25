#!/bin/bash

if [ -e /tmp/webcam ]
then
    rm /tmp/webcam
fi

while [ 1 ]
do
    if [ -e /tmp/webcam ]
    then
        echo "taking picture"
	fswebcam -r 356x292 -d /dev/video0 /var/www/webcam/image.jpg
	ls -la /var/www/webcam/image.jpg
	echo picture was took
	export utime=`date +\%s`
	cp /var/www/webcam/image.jpg /media/white/log/images/$utime.jpg
        rm /tmp/webcam
    fi
sleep 1;
done

