-- autocompile
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- auto bootstrap
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- setup file
function get_setup(name)
  return string.format('require("setup.%s")', name)
end

return require('packer').startup(function()
  use { 'wbthomason/packer.nvim' }
  use {
    'preservim/nerdtree',
    config = get_setup("nerdtree")
  }
  use {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    config = get_setup("lualine"),
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'folke/tokyonight.nvim',
    event = "VimEnter",
    config = get_setup("tokyonight")
  }
  use {
    'ryanoasis/vim-devicons',
    config = get_setup("vim_devicons")
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = get_setup("telescope")
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    config = get_setup("telescope_fzf_native"),
    run = 'make'
  }
end)
