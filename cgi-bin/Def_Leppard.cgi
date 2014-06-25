#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
cp /home/miloc/playlists/Def_Leppard.m3u /tmp/
echo Number of songs:
wc -l /tmp/Def_Leppard.m3u
cat /tmp/Def_Leppard.m3u
#echo List:
#cat /tmp/Def_Leppard.m3u | sed -e "s|/media/white/music/||g"
# Output web page data
/usr/lib/cgi-bin/music.sh Def_Leppard.m3u
#
