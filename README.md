# Dotfiles

<img src="https://github.com/solidiquis/solidiquis/blob/master/assets/setup_7.png?raw=true">

## MacOS Installation
1. Download the [Alacritty](https://github.com/alacritty/alacritty) terminal emulator.
2. Clone this repo into your `$HOME` directory.
3. Execute the `osx` script located at `$HOME/dotfiles/install_scripts/OSX`.
4. Open vim and execute `:PlugInstall`
5. Start a new Alacritty session, and if all goes well things should look like the above screenshot.

**Note**: Make sure you also have the nerd font specified [here](https://github.com/solidiquis/dotfiles/blob/4046cb51ca45318964811505bcd8142a4d47a294/alacritty.yml#L29) in your font book. Vim devicons will not work unless you're using a nerd font. And don't forget to run `:PlugInstall` in Vim and re-sourcing/restarting Vim.
