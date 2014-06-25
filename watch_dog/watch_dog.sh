#!/bin/bash
for i in `seq 1 1` #until 1 just to compare the last picture the the previous 9
do
    k=`echo $i+1|bc`
    sum=0
    diffwithnext=0
    for j in `seq 2 9`
    do
	diff=`python /root/watch_dog/compare_2D.py /var/www/webcam/th_$i.jpg /var/www/webcam/th_$j.jpg`
	if [ 2 -eq $j ]
	then
	    diffwithnext=`echo $diff+1.-1. | bc`
	fi	
	sum=`echo $sum+$diff | bc`
    done
    average=`echo $sum/9 | bc`
    echo photo:$i average:$average diffwithnext:$diffwithnext
#    if [ 60. -le $average ] && [ 60. -le $diffwithnext ]
    if (( 60. < $average ))
    then
	if (( 60. < $diffwithnext ))
	then
	    echo "the different image is $i"
	    echo "sending email"
	    next=`echo $i+1 | bc`
	    time=`date +"%d %m 20%y %H:%M"`
	    folder=`date +"20%y_%m_%d_%H_%M"`
	    mkdir /root/watch_dog/$folder
	    cp /var/www/webcam/th_* /root/watch_dog/$folder/
	    rm  /root/watch_dog/$folder/th_10.jpg
	    cd /root/watch_dog/$folder/
	    for i in `ls -1 /root/watch_dog/$folder/`; do convert /root/watch_dog/$folder/$i `echo $i | sed "s|jpg|gif|g"` ; done
            convert -delay 60 /root/watch_dog/$folder/*.gif -loop /root/watch_dog/$folder/change.gif
	    mpack -s "change @ $time with average=$average" /root/watch_dog/$folder/change.gif ccarrillom@gmail.com
	    rm /root/watch_dog/$folder/th_*
	    exit 0
	fi
    fi
done

