#!/bin/sh
export dayson=`uptime | awk '{print $3}'`
echo dayson $dayson
if [ $dayson -eq 0 ]
then
  echo "running scripts"
else
  echo "skiping scripts"
fi

