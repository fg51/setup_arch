vi /etc/pacman.d/mirrorlist
pacstrap /mnt linux base base-devel linux-firmware dhcpcd
genfstab -U /mnt >> /mnt/etc/fstab
