#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
cp /home/miloc/playlists/Caifanes.m3u /tmp/
echo Number of songs:
wc -l /tmp/Caifanes.m3u
cat /tmp/Caifanes.m3u
#echo List:
#cat /tmp/Caifanes.m3u | sed -e "s|/media/white/music/||g"
# Output web page data
/usr/lib/cgi-bin/music.sh Caifanes.m3u
#
