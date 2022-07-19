local mode = require("consts").modes
local map = require("utils").map

require('nvim-treesitter.configs').setup({
  ensure_installed = "maintained",
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
})
