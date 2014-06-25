#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
cp /home/miloc/playlists/Sabbath.m3u /tmp/
echo Number of songs:
wc -l /tmp/Sabbath.m3u
echo List:
cat /tmp/Sabbath.m3u | sed -e "s|/media/superheavy/music/||g"
# Output web page data
/usr/lib/cgi-bin/music.sh Sabbath.m3u
#
