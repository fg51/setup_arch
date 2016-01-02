font
====

## disable bitmapfont, hinting

```bash
$ cat << EOF >> $XDG_CONFIG_HOME/fontconfig/fonts.conf
<?xml version=1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <match target="font">
    <edit mode="assign" name="embeddedbitmap">
      <bool>false</bool>
    </edit>
    <edit mode="assign" name="hintstyle">
      <bool>hintnone</bool>
    </edit>
  </match>
</fontconfig>
EOF
```


## install

```bash
$ sudo pacman -S abobe-source-han-sans-jp-fonts otf-ipafont
$ fc-cache -vf
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


