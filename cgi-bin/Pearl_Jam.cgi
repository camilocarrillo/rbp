#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
cp /home/miloc/playlists/Pearl_Jam.m3u /tmp/
echo Number of songs:
wc -l /tmp/Pearl_Jam.m3u
cat /tmp/Pearl_Jam.m3u
#echo List:
#cat /tmp/Pearl_Jam.m3u | sed -e "s|/media/white/music/||g"
# Output web page data
/usr/lib/cgi-bin/music.sh Pearl_Jam.m3u
#
