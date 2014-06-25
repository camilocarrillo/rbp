#!/bin/sh
# Parallel port CGI script
#
# Send HTTP headers
echo Content-type: text/html;charset=ISO-881h9
echo
# Do the controlling
cp /home/miloc/playlists/My_Morning_Jacket.m3u /tmp/
echo Number of songs:
wc -l /tmp/My_Morning_Jacket.m3u
echo List:
ls /tmp/My_Morning_Jacket.m3u
# Output web page data
/usr/lib/cgi-bin/music.sh My_Morning_Jacket.m3u
#
