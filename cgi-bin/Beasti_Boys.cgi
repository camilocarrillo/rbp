#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
cp /home/miloc/playlists/Beasti_Boys.m3u /tmp/
# Output web page data
/usr/lib/cgi-bin/music.sh Beasti_Boys.m3u
#
