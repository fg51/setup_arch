vi /etc/locale.gen
# en_US.UTF-8 UTF-8
# ja_JP.UTF-8 UTF-8
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf

ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
hwclock --systohc --utc
# echo <hostname> > /etc/hostname
vi /etc/hosts
# 127.0.0.1 localhost.localdomain localhost <hostname>
# ::1 localhost.localdomain localhost <hostname>
