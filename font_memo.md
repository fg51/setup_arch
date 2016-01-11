font
====

## disable bitmapfont, hinting

```bash
$ cat << EOF >> $XDG_CONFIG_HOME/fontconfig/fonts.conf
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <match target="font">
    <edit mode="assign" name="embeddedbitmap">
      <bool>false</bool>
    </edit>
    <edit mode="assign" name="hintstyle">
      <const>hintnone</const>
    </edit>
  </match>
</fontconfig>
EOF
```

$ cp $XDG_CONFIG_HOME/fontconfig/fonts.conf /etc/fonts/conf.avail/71-no-embedded-bitmaps.conf
$ sudo ln -s /etc/fonts/conf.avail/71-no-embedded-bitmaps.conf /etc/fonts/conf.d/71-no-embedded-bitmaps.conf


## install

```bash
$ sudo pacman -S abobe-source-han-sans-jp-fonts otf-ipafont
$ fc-cache -vf
```

# for user

```bash
$ set --export XDG_DATA_HOME "~/.local/share"
$ $XDG_DATA_HOME/fonts/<font dir>
$ git clone https://github.com/yascentur/RictyDiminished RictyDiminished
```

$ yaurt ttf-migu ttf-ricty ttf-symbola


## fonts

gothic:
abobe-source-han-sans-jp-fonts
otf-ipafont
Noto Sans CJK JP: google + Adobe

minchou:
honoka mincho
kokoro mincho


