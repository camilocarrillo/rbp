#!/bin/bash

if [ -e /tmp/ON52 ]
then
    rm /tmp/ON52
fi
if [ -e /tmp/ON302 ]
then
    rm /tmp/ON302
fi
if [ -e /tmp/ON1h2 ]
then
    rm /tmp/ON1h2
fi
if [ -e /tmp/ON2h2 ]
then
    rm /tmp/ON2h2
fi
if [ -e /tmp/ON6h2 ]
then
    rm /tmp/ON6h2
fi


while [ 1 ]
do
    if [ -e /tmp/OFF2 ]
    then
        echo "starting 5s2"
	scp /root/gpio/OFF2 root@10.0.0.7:/tmp/OFF
	rm /tmp/OFF2
    fi
    if [ -e /tmp/ON52 ]
    then
        echo "starting 5s2"
	scp /root/gpio/ON52 root@10.0.0.7:/tmp/ON5
	rm /tmp/ON52
    fi
    if [ -e /tmp/ON302 ]
    then
        echo "starting 302"
	scp /root/gpio/ON302 root@10.0.0.7:/tmp/ON30
	rm /tmp/ON302
    fi
    if [ -e /tmp/ON1h2 ]
    then
        echo "starting 1h"
	scp /root/gpio/ON1h2 root@10.0.0.7:/tmp/ON1h
	rm /tmp/ON1h2
    fi
    if [ -e /tmp/ON2h2 ]
    then
        echo "starting 2h"
	scp /root/gpio/ON2h2 root@10.0.0.7:/tmp/ON2h
	rm /tmp/ON2h2
    fi
sleep 1;
done

