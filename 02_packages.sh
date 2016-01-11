
sudo systemctl disable dhcpcd.service
sudo systemctl enable NetworkManager

sudo pacman -S networkmanager gnome-keyring network-manager-apllet gnome-icon-theme

# image viewer
sudo pacman -S sxiv

# pdf viewer
sudo pacman -S evince

# silver searcher
sudo pacman -S the_silver_searcher



# font
sudo pacman -S abobe-source-han-sans-jp-fonts otf-ipafont
ttf-migu ttf-ricty ttf-symbola

gothic:
abobe-source-han-sans-jp-fonts
otf-ipafont
Noto Sans CJK JP: google + Adobe

minchou:
honoka mincho
kokoro mincho


# graphic driver
lspci |grep VGA
sudo pacman -S xf86-video-intel

## XORG
pacman -S xorg
#sudo pacman -S xorg-server xorg-xinit xorg-xclock
sudo pacman -S xorg-server-utils xorg-xinit xorg-xclock

pacman -S rxvt-unicode	#NOTE: which urxvt
pacman -S tmux
pacman -S awesome

cp /etc/X11/xinit/.xinitrc ~/
$ echo "exec awesome" >> ~/.xinitrc
$ startx
$ killall --user flamefly

$ localectl set-x11-keymap jp,us pc104 ,dvorak grp:alt_shift_toggle
$ localectl status
$ cat /etc/X11/xorg.conf.d/00-keyboard.conf
# Read and parsed by systemd-localed. It's probably wise not to edit this file
# manually too freely.
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "jp,us"
        Option "XkbModel" "pc104"
        Option "XkbVariant" ",dvorak"
        Option "XkbOptions" "grp:alt_shift_toggle"
EndSection


## login manager: sLim
sudo pacman -S slim archlinux-themes-slim slim-themes

previe
slim -p /usr/share/slim/themes/<theme name>


