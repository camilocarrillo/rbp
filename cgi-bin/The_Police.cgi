#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
cp /home/miloc/playlists/The_Police.m3u /tmp/
echo Number of songs:
wc -l /tmp/The_Police.m3u
echo List:
ls /tmp/The_Police.m3u
# Output web page data
/usr/lib/cgi-bin/music.sh The_Police.m3u
#
