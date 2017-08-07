
```bash
$ fish_config
```

cat << EOF >> $XDG_CONFIG_DIR/fish/config.fish
set -x PATH $HOME/.bin $PATH
EOF

fisherman

```bash
$ curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
```
