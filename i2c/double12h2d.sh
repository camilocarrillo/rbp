#!/bin/bash
tail -n 250 /root/i2c/temp.log > /root/i2c/temp100.log
scp root@10.0.0.7:i2c/temp.log /root/i2c/temp2.log
tail -n 250 /root/i2c/temp2.log > /root/i2c/temp1002.log
max=`cat /root/i2c/temp100.log /root/i2c/temp1002.log | awk '{print $NF}' | uniq | sort -nr | head -n 1` 
min=`cat /root/i2c/temp100.log /root/i2c/temp1002.log | awk '{print $NF}' | uniq | sort -nr | tail -n 1` 
Max=`echo $max+0.1 | bc`
Min=`echo $min - 0.1 | bc`
echo $max $Max
echo $min $Min
cat /root/i2c/double12h2d_template.py | sed -e "s|-max-|$Max|g" -e "s|-min-|$Min|g" > /root/i2c/double12h2d_buff.py
/usr/bin/xvfb-run python /root/i2c/double12h2d_buff.py
