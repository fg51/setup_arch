wine
====

## prepair

in /etc/pacman.conf

```bash
- #[multilib]
- #Include = /etc/pacman.d/mirrorlist
+ [multilib]
+ Include = /etc/pacman.d/mirrorlist
```

```bash
$ sudo pacman -Syy
```


## install

```bash
$ sudo pacman -S wine
$ wine LTspiceXVII.exe
```


## usage

```bash
$ wine ~/.wine/drive_c/Program\ Files/LTC/LTspiceXVII/XVIIx86.exe
```
