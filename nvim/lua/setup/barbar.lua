local mode = require("consts").modes
local map = require("utils").map

require('bufferline').setup({
  animation = true,
  auto_hide = true,
  closable = true,
  clickable = true,
  exclude_ft = {},
  exclude_name = {},
  icons = true,
  icon_custom_colors = false,
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',
  insert_at_end = false,
  insert_at_start = false,
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  maximum_padding = 1,
  maximum_length = 30,
  no_name_title = nil,
  semantic_letters = true,
})

map(mode.normal, "<leader>n", ":BufferNext<CR>")
map(mode.normal, "<leader>N", ":BufferPrevious<CR>")
map(mode.normal, "<leader>q", ":BufferClose<CR>")
map(mode.normal, "<C-s>", ":BufferMoveNext<CR>")
map(mode.normal, "<C-a>", ":BufferMovePrevious<CR>")
