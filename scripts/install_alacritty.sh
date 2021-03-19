echo "0. Install Alacritty"

echo -e "\033[33mDon't forget to install Alacritty manually from https://github.com/alacritty/alacritty\033[0m"

echo "1. Install fonts"

brew tap homebrew/cask-fonts
brew install --cask font-fira-code

echo "2. Create Alacritty config"

cp ./configs/.alacritty.yml ~/.alacritty.yml
