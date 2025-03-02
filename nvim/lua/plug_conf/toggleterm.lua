local mode = require("consts").modes

local Direction = {
  horizontal = "horizontal",
  vertical = "vertical",
  tab = "tab",
  float = "float"
}

require("toggleterm").setup {
  open_mapping = [[<c-\>]],
  direction = Direction.float,
  size = function(term)
    if term.direction == "horizontal" then
      return math.floor(vim.api.nvim_win_get_height(0) * 0.5)
    end
  end,
  hide_numbers = true,
  shade_terminals = true,
  --shading_factor = 3,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  persist_mode = false,
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
    width = function()
      math.floor(vim.api.nvim_win_get_width(0) * 0.8)
    end,
    height = function()
      math.floor(vim.api.nvim_win_get_height(0) * 0.8)
    end,
    winblend = 0,
  }
}

vim.keymap.set(mode.visual_select, "<C-s>", ":ToggleTermSendVisualLines<CR>:ToggleTerm<CR>", { noremap = true })
