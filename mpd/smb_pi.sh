rpi_ip="192.168.1.10"
self_ip="192.168.1.77"
remote_username="tunnelshade"
music_share="//$self_ip/Music"
mount_point="/home/$remote_username/Music"
mpd_config="/home/$remote_username/.mpd/mpd.conf"

set -o xtrace
ssh root@$rpi_ip "rm -rf $mount_point; mkdir -p $mount_point"
ssh root@$rpi_ip "mount -t cifs -o username=guest,password=,uid=$remote_username,gid=$remote_username $music_share $mount_point"
ssh $remote_username@$rpi_ip "mpd $mpd_config"
