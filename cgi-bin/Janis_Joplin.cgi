#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
cp /home/miloc/playlists/Janis_Joplin.m3u /tmp/
echo Number of songs:
wc -l /tmp/Janis_Joplin.m3u
cat /tmp/Janis_Joplin.m3u
#echo List:
#cat /tmp/Janis_Joplin.m3u | sed -e "s|/media/white/music/||g"
# Output web page data
/usr/lib/cgi-bin/music.sh Janis_Joplin.m3u
#
