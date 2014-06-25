#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
cp /home/miloc/playlists/Guns_And_Roses.m3u /tmp/
echo Number of songs:
wc -l /tmp/Guns_And_Roses.m3u
cat /tmp/Guns_And_Roses.m3u
#echo List:
#cat /tmp/Guns_And_Roses.m3u | sed -e "s|/media/white/music/||g"
# Output web page data
/usr/lib/cgi-bin/music.sh Guns_And_Roses.m3u
#
