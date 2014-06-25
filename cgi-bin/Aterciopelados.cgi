#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
cp /home/miloc/playlists/Aterciopelados.m3u /tmp/
echo Number of songs:
wc -l /tmp/Aterciopelados.m3u
cat /tmp/Aterciopelados.m3u
#echo List:
#cat /tmp/Aterciopelados.m3u | sed -e "s|/media/white/music/||g"
# Output web page data
/usr/lib/cgi-bin/music.sh Aterciopelados.m3u
#
