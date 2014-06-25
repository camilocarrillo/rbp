#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
cp /home/miloc/playlists/Evannecense.m3u /tmp/
echo Number of songs:
wc -l /tmp/Evannecense.m3u
cat /tmp/Evannecense.m3u
#echo List:
#cat /tmp/Evannecense.m3u | sed -e "s|/media/white/music/||g"
# Output web page data
/usr/lib/cgi-bin/music.sh Evannecense.m3u
#
