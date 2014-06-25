cat /usr/lib/cgi-bin/music_cgi.html | sed -e "s|-date-|`date`|g" -e "s|-playlist-|$1|g"
