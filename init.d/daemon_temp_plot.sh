#!/bin/bash

if [ -e /tmp/TEMP ]
then
    rm /tmp/TEMP
fi

while [ 1 ]
do
    if [ -e /tmp/TEMP ]
    then
        echo "starting TEMP"
        xvfb-run python /home/miloc/i2c/loic_script.py
        rm /tmp/TEMP
	echo "finished TEMP"
    fi
sleep 1;
done

