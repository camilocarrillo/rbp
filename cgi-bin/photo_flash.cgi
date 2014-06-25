#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
if [ -e /tmp/ON* ]
then 
touch /tmp/webcam
else 
touch /tmp/ON30
sleep 1
touch /tmp/webcam
sleep 2
touch /tmp/OFF
fi
sleep 2
# Output web page data
/usr/lib/cgi-bin/prod_photo_html.sh
#
