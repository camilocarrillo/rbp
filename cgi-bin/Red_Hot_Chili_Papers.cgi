#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
cp /home/miloc/playlists/Red_Hot_Chili_Papers.m3u /tmp/
echo Number of songs:
wc -l /tmp/Red_Hot_Chili_Papers.m3u
cat /tmp/Red_Hot_Chili_Papers.m3u
#echo List:
#cat /tmp/Red_Hot_Chili_Papers.m3u | sed -e "s|/media/white/music/||g"
# Output web page data
/usr/lib/cgi-bin/music.sh Red_Hot_Chili_Papers.m3u
#
