#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
cp /home/miloc/playlists/Beyonce.m3u /tmp/
echo Number of songs:
wc -l /tmp/Beyonce.m3u
cat /tmp/Beyonce.m3u
#echo List:
#cat /tmp/Beyonce.m3u | sed -e "s|/media/white/music/||g"
# Output web page data
/usr/lib/cgi-bin/music.sh Beyonce.m3u
#
