#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
cp /home/miloc/playlists/Black_Eyed_Peas.m3u /tmp/
echo Number of songs:
wc -l /tmp/Black_Eyed_Peas.m3u
cat /tmp/Black_Eyed_Peas.m3u
#echo List:
#cat /tmp/Black_Eyed_Peas.m3u | sed -e "s|/media/white/music/||g"
# Output web page data
/usr/lib/cgi-bin/music.sh Black_Eyed_Peas.m3u
#
