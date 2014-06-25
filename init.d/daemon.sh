#!/bin/bash

echo 4 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio4/direction

if [ -e /tmp/ON5 ]
then
    rm /tmp/ON5
fi
if [ -e /tmp/ON30 ]
then
    rm /tmp/ON30
fi
if [ -e /tmp/ON1h ]
then
rm /tmp/ON1h
fi
if [ -e /tmp/ON2h ]
then
    rm /tmp/ON2h
fi
if [ -e /tmp/ON6h ]
then
    rm /tmp/ON6h
fi
if [ -e /tmp/ON90 ]
then
    rm /tmp/ON90
fi


while [ 1 ]
do
    if [ -e /tmp/OFF ]
    then
	rm /tmp/OFF
    fi
    if [ -e /tmp/ON5 ]
    then
        echo "starting 5s"
	echo "1" > /sys/class/gpio/gpio4/value
	for j in `seq 5 -1 1`
	do
	    echo $j
	    sleep 1
	    if [ -e /tmp/OFF ]
	    then
		echo Signal to turn off received 
		echo "0" > /sys/class/gpio/gpio4/value
                rm /tmp/OFF
		break		
            fi
	done
	echo "0" > /sys/class/gpio/gpio4/value
        rm /tmp/ON5
    fi
    if [ -e /tmp/ON30 ]
    then
        echo "starting 30m"
	echo "1" > /sys/class/gpio/gpio4/value
	for j in `seq 1800 -1 1`
	do
	    echo $j
	    sleep 1
	    if [ -e /tmp/OFF ]
	    then
		echo Signal to turn off received 
		echo "0" > /sys/class/gpio/gpio4/value
                rm /tmp/OFF
		break		
            fi
	done
	echo "0" > /sys/class/gpio/gpio4/value
        rm /tmp/ON30
    fi
    if [ -e /tmp/ON1h ]
    then
        echo "starting 1h"
	echo "1" > /sys/class/gpio/gpio4/value
	for j in `seq 3600 -1 1`
	do
	    echo $j
	    sleep 1
	    if [ -e /tmp/OFF ]
	    then
		echo Signal to turn off received 
		echo "0" > /sys/class/gpio/gpio4/value
                rm /tmp/OFF
		break		
            fi
	done
	echo "0" > /sys/class/gpio/gpio4/value
        rm /tmp/ON1h
    fi
    if [ -e /tmp/ON2h ]
    then
        echo "starting 2h"
	echo "1" > /sys/class/gpio/gpio4/value
	for j in `seq 7200 -1 1`
	do
	    echo $j
	    sleep 1
	    if [ -e /tmp/OFF ]
	    then
		echo Signal to turn off received 
		echo "0" > /sys/class/gpio/gpio4/value
                rm /tmp/OFF
		break		
            fi
	done
	echo "0" > /sys/class/gpio/gpio4/value
        rm /tmp/ON2h
    fi
    if [ -e /tmp/ON6h ]
    then
        echo "starting 6h"
	echo "1" > /sys/class/gpio/gpio4/value
	for j in `seq 21600 -1 1`
	do
	    echo $j
	    sleep 1
	    if [ -e /tmp/OFF ]
	    then
		echo Signal to turn off received 
		echo "0" > /sys/class/gpio/gpio4/value
                rm /tmp/OFF
		break		
            fi
	done
	echo "0" > /sys/class/gpio/gpio4/value
        rm /tmp/ON6h
    fi
    if [ -e /tmp/ON90 ]
    then
        echo "starting 90s"
	echo "1" > /sys/class/gpio/gpio4/value
	for j in `seq 90 -1 1`
	do
	    echo $j
	    sleep 1
	    if [ -e /tmp/OFF ]
	    then
		echo Signal to turn off received 
		echo "0" > /sys/class/gpio/gpio4/value
                rm /tmp/OFF
		break		
            fi
	done
	echo "0" > /sys/class/gpio/gpio4/value
        rm /tmp/ON90
    fi
echo "0" > /sys/class/gpio/gpio4/value
sleep 1;
done

