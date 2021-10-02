#!/bin/bash

ALACRITTY_CONF="$HOME/dotfiles/alacritty/alacritty.yml"
ALACRITTY_COLORS="$HOME/dotfiles/alacritty/alacritty_color_schemes.yml"
TMUX_CONF="$HOME/dotfiles/.tmux.conf"
ZSH_CONF="$HOME/dotfiles/zsh/.zshrc"
VIM_CONF="$HOME/dotfiles/vim/.vimrc"
OMZSH="$HOME/.oh-my-zsh"

# Check if Darwin
if [[ ! $OSTYPE =~ "darwin" ]]; then
echo "OS is not of type 'darwin.'"
exit 1
fi

################
# Install Brew #
################
if [[ ! -f $(which brew) ]]; then
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

#########################
# Install and setup Zsh #
#########################
if [[ ! -f $(which zsh) ]]; then
brew install zsh
fi

if [[ ! -f $OMZSH ]]; then
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [[ -f $ZSH_CONF ]]; then
rm $HOME/.zshrc # remove default
ln -s $ZSH_CONF $HOME/.zshrc &> /dev/null
echo "Zshell configured."
fi

##########################
# Install and setup Tmux # 
##########################
if [[ ! -f $(which tmux) ]]; then
brew install tmux
fi

if [[ -f $TMUX_CONF ]]; then
ln -s $TMUX_CONF $HOME/.tmux.conf &> /dev/null
echo "Tmux configured."
fi 

###################
# Setup Alacritty #
###################
if [[ -f $ALACRITTY_CONF ]]; then
ln -s $ALACRITTY_CONF $HOME/.alacritty.yml &> /dev/null
ln -s $ALACRITTY_COLORS $HOME/.alacritty_color_schemes.yml &> /dev/null
echo "Alacritty configured."
fi 

#############
# Setup Vim #
#############
if [[ -f $(which vim) ]]; then
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
brew install the_silver_searcher
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
ln -s $VIM_CONF $HOME/.vimrc  &> /dev/null
echo "Vim configured. Don't forget to :PlugInstall and re-source .vimrc."
fi
