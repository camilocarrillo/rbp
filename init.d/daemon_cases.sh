#!/bin/bash


echo 17 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio17/direction

if [ -e /tmp/ON_2_5 ]
then
    rm /tmp/ON_2_5
fi
if [ -e /tmp/ON_2_90 ]
then
    rm /tmp/ON_2_90
fi
if [ -e /tmp/ON_2_120 ]
then
    rm /tmp/ON_2_120
fi
if [ -e /tmp/ON_2_30 ]
then
    rm /tmp/ON_2_30
fi
if [ -e /tmp/ON_2_1h ]
then
rm /tmp/ON_2_1h
fi
if [ -e /tmp/ON_2_2h ]
then
    rm /tmp/ON_2_2h
fi
if [ -e /tmp/ON_2_6h ]
then
    rm /tmp/ON_2_6h
fi


while [ 1 ]
do
    if [ -e /tmp/OFF_2 ]
    then
	rm /tmp/OFF_2
    fi
    if [ -e /tmp/ON_2_5 ]
    then
        echo "starting 5s"
	echo "1" > /sys/class/gpio/gpio17/value
	for j in `seq 5 -1 1`
	do
	    echo $j
	    sleep 1
	    if [ -e /tmp/OFF_2 ]
	    then
		echo Signal to turn off received 
		echo "0" > /sys/class/gpio/gpio17/value
                rm /tmp/OFF_2
		break		
            fi

	done
	echo "0" > /sys/class/gpio/gpio17/value
        rm /tmp/ON_2_5
    fi
    if [ -e /tmp/ON_2_90 ]
    then
        echo "starting 90s"
	echo "1" > /sys/class/gpio/gpio17/value
	for j in `seq 90 -1 1`
	do
	    echo $j
	    sleep 1
	    if [ -e /tmp/OFF_2 ]
	    then
		echo Signal to turn off received 
		echo "0" > /sys/class/gpio/gpio17/value
                rm /tmp/OFF_2
		break		
            fi
	done
	echo "0" > /sys/class/gpio/gpio17/value
        rm /tmp/ON_2_90
    fi
    if [ -e /tmp/ON_2_120 ]
    then
        echo "starting 120s"
	echo "1" > /sys/class/gpio/gpio17/value
	for j in `seq 120 -1 1`
	do
	    echo $j
	    sleep 1
	    if [ -e /tmp/OFF_2 ]
	    then
		echo Signal to turn off received 
		echo "0" > /sys/class/gpio/gpio17/value
                rm /tmp/OFF_2
		break		
            fi
	done
	echo "0" > /sys/class/gpio/gpio17/value
        rm /tmp/ON_2_120
    fi
    if [ -e /tmp/ON_2_30 ]
    then
        echo "starting 30m"
	echo "1" > /sys/class/gpio/gpio17/value
	for j in `seq 1800 -1 1`
	do
	    echo $j
	    sleep 1
	    if [ -e /tmp/OFF_2 ]
	    then
		echo Signal to turn off received 
		echo "0" > /sys/class/gpio/gpio17/value
                rm /tmp/OFF_2
		break		
            fi
	done
	echo "0" > /sys/class/gpio/gpio17/value
        rm /tmp/ON_2_30
    fi
    if [ -e /tmp/ON_2_1h ]
    then
        echo "starting 1h"
	echo "1" > /sys/class/gpio/gpio17/value
	for j in `seq 3600 -1 1`
	do
	    echo $j
	    sleep 1
	    if [ -e /tmp/OFF_2 ]
	    then
		echo Signal to turn off received 
		echo "0" > /sys/class/gpio/gpio17/value
                rm /tmp/OFF_2
		break		
            fi
	done
	echo "0" > /sys/class/gpio/gpio17/value
        rm /tmp/ON_2_1h
    fi
    if [ -e /tmp/ON_2_2h ]
    then
        echo "starting 2h"
	echo "1" > /sys/class/gpio/gpio17/value
	for j in `seq 7200 -1 1`
	do
	    echo $j
	    sleep 1
	    if [ -e /tmp/OFF_2 ]
	    then
		echo Signal to turn off received 
		echo "0" > /sys/class/gpio/gpio17/value
                rm /tmp/OFF_2
		break		
            fi
	done
	echo "0" > /sys/class/gpio/gpio17/value
        rm /tmp/ON_2_2h
    fi
    if [ -e /tmp/ON_2_6h ]
    then
        echo "starting 6h"
	echo "1" > /sys/class/gpio/gpio17/value
	for j in `seq 21600 -1 1`
	do
	    echo $j
	    sleep 1
	    if [ -e /tmp/OFF_2 ]
	    then
		echo Signal to turn off received 
		echo "0" > /sys/class/gpio/gpio17/value
                rm /tmp/OFF_2
		break		
            fi
	done
	echo "0" > /sys/class/gpio/gpio17/value
        rm /tmp/ON_2_6h
    fi
echo "0" > /sys/class/gpio/gpio17/value
sleep 1;
done

