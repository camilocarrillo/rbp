#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
cp /home/miloc/playlists/song2.m3u /tmp/
# Output web page data
/usr/lib/cgi-bin/music.sh song2.m3u
#
