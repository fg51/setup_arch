
loadkeys jp106
setfont lat9w-16
#setfont Lat2-Teminus16

## netowrk
wifi-menu


#foo << EOF
#a
#b
#c
#EOF


#NOTE:  format
sgdisk --zap-all /dev/sda

#NOTE:  partition
cgdisk /dev/sda
sda1 512MiB ef00 eps
sda2 512MiB 8300 boot
sda3 others 8300 

#NOTE:  format
mkfs.vfat -v -F32 /dev/sda1
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3

mkdir /mnt
mount /dev/sda3 /mnt -o discard
mkdir /mnt/boot
mount /dev/sda2 /mnt/boot -o discard
mkdir /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi


# To use net, dhcpcd ?

#TODO: update /etc/pacman.d/mirrorlist

vim /etc/pacman.d/mirrorlist

pacstrap /mnt base base-devel dosfstools efibootmgr grub sudo fish vim sudo git wget curl

genfstab -U -p /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab

#
# chroot
#
arch-chroot /mnt /bin/bash

loadkeys jp106
setfont lat9w-16

#vim locale.gen
#locale-gen

cat /etc/vconsole.conf << EOF
KEYMAP=jp106
FONT=lat9w-16
EOF

ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
hwclock --systohc --utc

echo <host name> > /etc/hostname

pacman -S intel-ucode
#grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=arch_grub --recheck
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --recheck
mkdir /boot/efi/EFI/boot
cp /boot/efi/EFI/arch_grub/grubx64.efi /boot/efi/EFI/boot/bootx64.efi
grub-mkconfig -o /boot/grub/grub.cfg


```bash
$ sudoedit /etc/locale-gen
en_US.UTF8
ja_JP.UTF8
$ sudo locale-gen
```

```bash
sudo pacman -S networkmanager gnome-keyring network-manager-applet wpa_supplicant dialog
```

```bash
$ sudo pacman -S xorg-server xorg-xinit i3-wm i3status
$ sudo pacman -S dmenu compton ttf-dejavu otf-ipafont
$ sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
```


exit
umount -R /mnt
reboot



```bash
$ useradd -m -g users -G wheel -k -s /bin/bash <user name>
$ passwd <user name>
$ cp /etc/X11/xinit/xinitrc ~/.xinitrc
$ chown <user name>:users ~/.xinitrc
$ chmod 755 ~/.xinitrc
```

user $ pacman  -S xdg-user-dirs
user $ LC_ALL=C xdg-user-dirs-update

$ visudo
- #Defaults env_keep += "HOME"
- #$wheel ALL=(ALL) ALL
+ Defaults env_keep += "HOME"
+ $wheel ALL=(ALL) ALL


