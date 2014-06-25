echo "execute as root"
sleep 5
export utime=`date +%s`
mkdir /home/miloc/backup/bkc_$utime
cp /root/i2c -rf /home/miloc/backup/bkc_$utime
cp /root/gpio -rf /home/miloc/backup/bkc_$utime
cp /root/watch_dog -rf /home/miloc/backup/bkc_$utime
cp /home/miloc/hd_log -rf /home/miloc/backup/bkc_$utime
cp backup.sh bkc_$utime
#cp /var/www/ -rf /home/miloc/backup/bkc_$utime
mkdir /home/miloc/backup/bkc_$utime/www/
cp /var/www/*.html /home/miloc/backup/bkc_$utime/www/
cp /var/www/links -rf /home/miloc/backup/bkc_$utime/www/
cp /var/www/todo -rf /home/miloc/backup/bkc_$utime/www/
cp /var/www/poliglot -rf /home/miloc/backup/bkc_$utime/www/
mkdir /home/miloc/backup/bkc_$utime/www/album
cp /var/www/album/index.php -rf /home/miloc/backup/bkc_$utime/www/
cp /etc/init.d/ -rf /home/miloc/backup/bkc_$utime
cp /usr/lib/cgi-bin/ -rf /home/miloc/backup/bkc_$utime
cp /etc/fstab -rf /home/miloc/backup/bkc_$utime
cp /etc/crontab  /home/miloc/backup/bkc_$utime
du -sh /home/miloc/backup/bkc_$utime
cp /home/miloc/backup/bkc_$utime /media/white/backup/ -rf
cp /home/miloc/backup/bkc_$utime /media/grey/backup/ -rf
echo if backup -> lxplus type password:
scp -r /home/miloc/backup/bkc_$utime carrillo@lxplus5.cern.ch:backup/raspberrypi/
