#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-882h9
echo
# Do the controlling
touch /tmp/OFF
# Output web page data
/usr/lib/cgi-bin/prod_off_html.sh
