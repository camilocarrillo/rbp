#!/bin/bash

round()
{
echo $(printf %.$2f $(echo "scale=$2;(((10^$2)*$1)+0.5)/(10^$2)" | bc))
};

export oldtemp=`tail -n 1 /root/i2c/temp.log  | awk '{print $NF}'`
export value=`i2cget -y 1 0x4f 0xAA w`
export temp=`/root/i2c/hexdec.sh $value`
#echo $oldtemp
#echo $temp
diff=`echo "$oldtemp - $temp" | bc`
export absdiff=`echo $diff | awk ' { if($1>=0) { print $1*1.0} else {print $1*-1.0 }}'`
    if [[ $absdiff > 0.1 ]]
    then
        export oldtemp=`echo $temp`
        export name=`date | sed -e "s| |_|g" -e "s|:|-|g"`
        export utime=`date +\%s`
        #echo writing $utime $name $temp
        echo $utime $name $temp | awk '{print $2" --> "$3}' | sed -e "s|_| |g" | sed -e "s|CET||g" | sed -e "s|CEST||g" >> /root/i2c/temp.log #converting loics format
	export temp2=`tail -n 1 /root/i2c/temp2.log | awk '{print $NF}'`
	#echo $temp2
        cat /var/www/index.html.template | sed -e "s|-T-|$(round $temp 1)|g" -e "s|-date-|$name|g" -e "s|-T2-|$(round $temp2 1)|g" > /var/www/index.html
    fi
