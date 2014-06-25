#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
cp /home/miloc/playlists/Michael_Jackson.m3u /tmp/
echo Number of songs:
wc -l /tmp/Michael_Jackson.m3u
cat /tmp/Michael_Jackson.m3u
#echo List:
#cat /tmp/Michael_Jackson.m3u | sed -e "s|/media/white/music/||g"
# Output web page data
/usr/lib/cgi-bin/music.sh Michael_Jackson.m3u
#
