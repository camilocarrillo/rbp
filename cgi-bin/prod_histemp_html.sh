touch /tmp/TEMP
export temp=`tail -n 1 /home/miloc/i2c/temp.log  | awk '{print $NF}'`
sleep 40
cat /usr/lib/cgi-bin/temp_cgi.html | sed -e "s|-date-|`date`|g" -e "s|-T-|$temp|g"
