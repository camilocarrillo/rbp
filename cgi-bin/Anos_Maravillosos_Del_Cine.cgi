#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
cp /home/miloc/playlists/Anos_Maravillosos_Del_Cine.m3u /tmp/
echo Number of songs:
wc -l /tmp/Anos_Maravillosos_Del_Cine.m3u
cat /tmp/Anos_Maravillosos_Del_Cine.m3u
#echo List:
#cat /tmp/Anos_Maravillosos_Del_Cine.m3u | sed -e "s|/media/white/music/||g"
# Output web page data
/usr/lib/cgi-bin/music.sh Anos_Maravillosos_Del_Cine.m3u
#
