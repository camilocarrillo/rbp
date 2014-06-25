#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
cp /home/miloc/playlists/Daft.m3u /tmp/
echo Number of songs:
wc -l /tmp/Daft.m3u
echo List:
ls /tmp/Daft.m3u
# Output web page data
/usr/lib/cgi-bin/music.sh Daft.m3u
#
