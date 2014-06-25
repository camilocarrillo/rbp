#!/bin/bash

while [ 1 ]
do
    if [ -e /tmp/stopmplayer ]
    then
        mystr=$(ps ax | grep "mplayer" | head -n 2 | tail -n 1 | awk '{print $1$}')
        echo $mystr
        echo "stopping mplayer"
        killall -e mplayer </dev/null
        rm /tmp/stopmplayer
    fi
sleep 2;
done
