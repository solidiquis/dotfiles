vim.pack.add({
    -- Telescope
    {
	src = "https://github.com/nvim-lua/plenary.nvim",
	version = "v0.1.4",
    },
    {
	src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	rev = "6fea601bd2b694c6f2ae08a6c6fab14930c60e2c",
    },
    {
	src = "https://github.com/nvim-telescope/telescope.nvim",
	version = "v0.2.1"
    },

    -- Treesitter
    {
	src = "https://github.com/nvim-treesitter/nvim-treesitter",
	rev = "539abf6da5ee8702e37b82cc953131dadd570da2",
    },

    -- Git stuff
    {
        src = "https://github.com/sindrets/diffview.nvim",
        rev = "4516612fe98ff56ae0415a259ff6361a89419b0a",
    },
    {
	src = "https://github.com/lewis6991/gitsigns.nvim",
	version = "v2.1.0",
    },
    {
        src = "https://github.com/tpope/vim-fugitive",
        rev = "3b753cf8c6a4dcde6edee8827d464ba9b8c4a6f0",
    },
    {
        src = "https://github.com/Almo7aya/openingh.nvim",
        version = "v1.0.14",
    },

    -- Icons
    {
	src = "https://github.com/nvim-tree/nvim-web-devicons",
	rev = "40e9d5a6cc3db11b309e39593fc7ac03bb844e38",
    },

    -- Barbar
    {
	src = "https://github.com/romgrk/barbar.nvim",
	rev = "539d73def39c9172b4d4d769f14090e08f37b29d",
    },

    -- File tree
    {
	src = "https://github.com/nvim-tree/nvim-tree.lua",
	version = "v1.16.0"
    },

    -- Toggle term
    {
	src = "https://github.com/akinsho/toggleterm.nvim",
	rev = "9a88eae817ef395952e08650b3283726786fb5fb",
    },

    -- LSP
    {
	src = "https://github.com/mason-org/mason.nvim",
	version = "v2.2.1",
    },
    {
	src = "https://github.com/mason-org/mason-lspconfig.nvim",
	version = "v2.1.0"
    },

    -- Autocompletion
    {
        src = "https://github.com/rafamadriz/friendly-snippets",
        rev = "6cd7280adead7f586db6fccbd15d2cac7e2188b9",
    },
    {
        src = "https://github.com/saghen/blink.cmp",
        version = "v1.10.2",
    },

    -- Claude
    {
        src = "https://github.com/coder/claudecode.nvim",
        rev = "432121f0f5b9bda041030d1e9e83b7ba3a93dd8f",
    },

    -- Lualine
    {
        src = "https://github.com/nvim-lualine/lualine.nvim",
        rev = "8811f3f3f4dc09d740c67e9ce399e7a541e2e5b2",
    },

    -- Misc.
    {
	src = "https://github.com/johmsalas/text-case.nvim",
	rev = "e898cfd46fa6cde0e83abb624a16e67d2ffc6457",
    },
    {
	src = "https://github.com/preservim/nerdcommenter",
	rev = "a462bbda1e26f44fb3d3eb9d9d1c6a07aa98e665",
    },
    {
        src = "https://github.com/rcarriga/nvim-notify",
        version = "v3.15.0",
    },
})

require("plugin_confs.telescope")
require("plugin_confs.barbar")
require("plugin_confs.nvim_treesitter")
require("plugin_confs.nvim_tree")
require("plugin_confs.toggleterm")
require("plugin_confs.lsp.setup")
require("plugin_confs.claude")
require("plugin_confs.diffview")
require("plugin_confs.colorscheme")
