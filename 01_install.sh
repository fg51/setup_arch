loadkeys jp106
setfont lat9w-16

#netowrk
wifi-menu


foo << EOF
a
b
c
EOF


#NOTE:  format
sgdisk --zap-all /dev/sda

#NOTE:  partition
cgdisk /dev/sda
sda1 512MiB ef00 eps
sda2 512MiB 8300 boot
sda3 others 8300 

#NOTE:  format
mkconf.vfat -v -F32 /dev/sda1
mkconf.ext4 /dev/sda2
mkconf.ext4 /dev/sda3

mkdir /mnt
mount /dev/sda3 /mnt -o discard
mkdir /mnt/boot
mount /dev/sda2 /mnt/boot -o discard
mkdir /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi


#TODO: update /etc/pacman.d/mirrorlist

pacstrap /mnt base base-devel dosfstools efibootmgr grub sudo fish vim

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
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=arch_grub --recheck
mkdir /boot/efi/EFI/boot
cp /boot/efi/EFI/arch_grub/grubx64.efi /boot/efi/EFI/boot/bootx64.efi
grub-mkconfig -o /boot/grub/grub.cfg

exit
umount -R /mnt
reboot


# xwindow
sudo pacman -S xorg-server xorg-server-utils xorg-xinit xorg-xclock xorg-server-xephyr

# graphic driver
lspci |grep VGA
sudo pacman -S xf86-VGA-intel

sudo pacman -S networkmanager gnome-keyring network-manager-apllet

# font
ttf-migu ttf-ricty ttf-symbola

useradd <user name> -m -s fish -G wheel
passwd <user name>


user $ pacman  -S xdg-user-dirs-update

LC_ALL=C xdg-user-dirs-update





