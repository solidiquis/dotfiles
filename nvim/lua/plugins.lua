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

  -- The Basics
  use { 'preservim/nerdcommenter' }
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

  -- Colorscheme
  use {
    'folke/tokyonight.nvim',
    event = "VimEnter",
    config = get_setup("tokyonight")
  }

  -- LSP Support
  use { 'VonHeikemen/lsp-zero.nvim' }
  use { 'williamboman/nvim-lsp-installer' }
  use {
    'neovim/nvim-lspconfig',
    config = get_setup("lsp")
  }

  -- Autocompletion
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-nvim-lua' }

  -- Snippets
  use { 'L3MON4D3/LuaSnip' }
  use { 'rafamadriz/friendly-snippets' }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = get_setup("treesitter")
  }
end)
