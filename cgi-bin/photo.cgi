#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
touch /tmp/webcam
sleep 2
# Output web page data
/usr/lib/cgi-bin/prod_photo_html.sh
#
