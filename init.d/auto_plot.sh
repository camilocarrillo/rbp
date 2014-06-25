#!/bin/bash

while [ 1 ]
do
	xvfb-run python /home/miloc/i2c/loic_script.py
	sleep 3600
done

