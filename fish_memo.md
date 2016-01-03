
```bash
$ fish_config
```

cat << EOF >> $XDG_CONFIG_DIR/fish/config.fish
set -x PATH $HOME/.bin $PATH
EOF
