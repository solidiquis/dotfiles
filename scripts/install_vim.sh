echo "0. Install Vim"

brew install vim

echo "1. Install Vim Plugin Manager"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "2. Create config"

cp ./configs/.vimrc ~/.vimrc
