local mode = require("consts").modes

local function termwidth()
  math.floor(vim.api.nvim_win_get_width(0) * 0.8)
end

local function termheight()
  math.floor(vim.api.nvim_win_get_height(0) * 0.8)
end

require("toggleterm").setup {
  open_mapping = [[<c-\>]],
  direction = "float",
  hide_numbers = true,
  shade_terminals = true,
  shading_factor = 1,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'single',
    width = termwidth,
    height = termheight,
    winblend = 3,
  }
}
