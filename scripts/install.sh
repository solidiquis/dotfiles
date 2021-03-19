echo "Creating of config for ZSH"
sh ./make_zhsrc.sh

echo "Creating of config for Tmux"
sh ./make_tmux.sh

echo "Creating of config for Alacritty"
sh ./make_alacritty.sh

echo "Installation of fonts"
sh ./make_font.sh
