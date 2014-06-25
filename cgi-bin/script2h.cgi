#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-882h9
echo
# Do the controlling
touch /tmp/ON2h
# Output web page data
/usr/lib/cgi-bin/prod_on_html.sh 2h
#
