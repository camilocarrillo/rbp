#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
cp /home/miloc/playlists/Los_Rodriguez.m3u /tmp/
echo Number of songs:
wc -l /tmp/Los_Rodriguez.m3u
cat /tmp/Los_Rodriguez.m3u
#echo List:
#cat /tmp/Los_Rodriguez.m3u | sed -e "s|/media/white/music/||g"
# Output web page data
/usr/lib/cgi-bin/music.sh Los_Rodriguez.m3u
#
