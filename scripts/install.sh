echo "Start"

echo "0. Creating of config for ZSH"
sh ./install_zhsrc.sh

echo "1. Creating of config for Tmux"
sh ./install_tmux.sh

echo "2. Creating of config for Alacritty"
sh ./install_alacritty.sh

echo "3. Installation of Vim"
sh ./install_vim.sh

echo "4. Installation of neofetch"
sh ./install_neofetch.sh

echo "Finish"
tmux
