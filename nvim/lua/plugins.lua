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
local function get_setup(name)
  return string.format('require("setup.%s")', name)
end

return require('packer').startup(function()
  use { 'wbthomason/packer.nvim' }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    opt = true,
    event = "BufEnter", -- Prefer BufReadPre.. figure out how to debug: `E201: autocommands must not change current buffer`.
    wants = { "cmp-nvim-lsp", "nvim-lsp-installer", "lsp_signature.nvim" },
    config = get_setup("lsp.config"),
    requires = {
      "williamboman/nvim-lsp-installer",
      "ray-x/lsp_signature.nvim",
    },
  }

  -- CMP
  use {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    opt = true,
    config = get_setup("cmp"),
    wants = { "LuaSnip" },
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "ray-x/cmp-treesitter",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      {
        "L3MON4D3/LuaSnip",
        branch = "master",
        wants = "friendly-snippets",
        config = get_setup("luasnip"),
      },
      "rafamadriz/friendly-snippets",
    },
    disable = false,
  }

  -- Misc.
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = get_setup("treesitter")
  }
  use { 'preservim/nerdcommenter' }
  use {
    "nvim-lualine/lualine.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      {
        "folke/tokyonight.nvim",
        config = get_setup("colorscheme")
      },
      {
        "kyazdani42/nvim-tree.lua",
        config = get_setup("nvim_tree")
      }
    }
  }
  use {
    'ryanoasis/vim-devicons',
    config = get_setup("vim_devicons")
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = get_setup("telescope")
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    config = get_setup("telescope_fzf_native"),
    run = 'make'
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = get_setup("trouble")
  }
  use {
    "akinsho/toggleterm.nvim",
    config = get_setup("toggleterm")
  }
  use { "andymass/vim-matchup" }
  use {
    "romgrk/barbar.nvim",
    requires = {'kyazdani42/nvim-web-devicons'},
    config = get_setup("barbar")
  }
  use {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = get_setup("lsp_lines")
  }
  use { "folke/which-key.nvim" }
  use { "kchmck/vim-coffee-script" }
  use {
    "windwp/nvim-ts-autotag",
    config = get_setup("nvim_ts_autotag")
  }
  use {
    "lewis6991/gitsigns.nvim",
    config = get_setup("gitsigns")
  }
end)
