#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-8859
echo
# Do the controlling
touch /tmp/ON5
# Output web page data
/usr/lib/cgi-bin/prod_on_html.sh 5
#
