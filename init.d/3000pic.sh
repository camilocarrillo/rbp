#!/bin/bash
echo "taking picture"
export utime=`date +\%s`
echo $utime
#fswebcam -r 356x292 -d /dev/video0 /var/www/webcam/image.jpg #with webcam
raspistill -rot 90 -o /var/www/webcam/3000/$utime.jpg #with rbp
echo picture was took
echo converting image
convert -resize 10%  /var/www/webcam/3000/$utime.jpg /var/www/webcam/3000/th_$utime.jpg
echo seeking last file
export last_file=`ls -lt /var/www/webcam/3000/ | grep 1 | tail -n 1 | awk '{print $NF}'`
echo $last_file 
echo removing 
echo /var/www/webcam/3000/$last_file
rm /var/www/webcam/3000/$last_file
#### IN 2017 I MUST CHANGE 14 -> 15 FOR ANOTHER SET OF YEARS
ls -lt /var/www/webcam/3000/ | grep 14 | grep -v th | head -n 10 | awk '{print $NF}' > /var/www/last10.txt
number=1
for photo in `cat /var/www/last10.txt`
do
    ln -sfn /var/www/webcam/3000/$photo /var/www/webcam/$number.jpg
    ln -sfn /var/www/webcam/3000/th_$photo /var/www/webcam/th_$number.jpg
    let "number=$number+1"
done

