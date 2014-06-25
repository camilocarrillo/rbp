#!/bin/bash

export highbyte=`echo $1 | awk -F 'x' '{print $2}' | cut -c3-4`
export lowbyte=`echo $1 | awk -F 'x' '{print $2}' | cut -c1`
export dechighbyte=`echo $((0x$highbyte))`
if [[ $dechighbyte -ge 128 ]]
        then
        export dechighbyte=$dechighbyte-256
fi
export declowbyte=`echo $((0x$lowbyte))`
export scale=1
temperature=$(echo $dechighbyte+$declowbyte*0.0625 | bc)
echo $temperature
