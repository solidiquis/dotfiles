--------------------
-- Bootstrap lazy --
--------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

--------------------
----- Plugins ------
--------------------
local function get_setup(conf_name)
  return function(_plugin, _opts)
    local mod = string.format("plug_conf.%s", conf_name)
    require(mod)
  end
end

local plugins = {
  -- Language server installations and LSP client configs and relevant keymaps
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", build = ":MasonUpdate" },
      { "williamboman/mason-lspconfig.nvim" },
      { "ray-x/lsp_signature.nvim" },
    },
    config = get_setup("lsp"),
  },

  -- Autocomplete and snippets
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      {
        "L3MON4D3/LuaSnip",
        dependencies = {
          "rafamadriz/friendly-snippets",
          "saadparwaiz1/cmp_luasnip",
        },
      },
    },
    config = get_setup("cmp"),
  },

  -- Commenting utility
  { "preservim/nerdcommenter" },

  -- Vim terminal friendly interface
  {
    "akinsho/toggleterm.nvim",
    config = get_setup("toggleterm"),
  },

  -- File/fuzzy finder and diagnostics
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = 'make'
      }
    },
    config = get_setup("telescope"),
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = get_setup("treesitter"),
  },

  -- Treesitter playground
  {
    "nvim-treesitter/playground",
    build = ":TSInstall query",
  },

  -- Extended glyphs
  { "kyazdani42/nvim-web-devicons" },

  -- Buffer tabs
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = get_setup("barbar"),
  },

  -- Filetree
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "romgrk/barbar.nvim",
    },
    config = get_setup("nvim_tree"),
  },

  -- Colorscheme and Lualine
  {
    "EdenEast/nightfox.nvim",
    dependencies = {
      "nvim-lualine/lualine.nvim",
    },
    config = get_setup("colorscheme"),
  },

  -- Extends '%' behavior and matching text highlight
  { "andymass/vim-matchup" },

  -- Git decorations
  {
    "lewis6991/gitsigns.nvim",
    config = get_setup("gitsigns")
  },

  -- Wrapper around `git` command
  { "tpope/vim-fugitive" },

  -- Interactive git diff and staging tool
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = get_setup("diffview"),
  },

  {
    "RRethy/vim-illuminate",
    config = get_setup("vim_illuminate")
  },

  -- CoffeeScript.. not supported by TS
  { "kchmck/vim-coffee-script" },

  -- Better marks experience
  {
    "chentoast/marks.nvim",
    config = get_setup("marks"),
  },
}

local opts = {}

require("lazy").setup(plugins, opts)
