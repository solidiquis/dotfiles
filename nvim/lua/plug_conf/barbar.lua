local Mode = require("consts").modes

vim.g.barbar_auto_setup = false

require("barbar").setup({
  animation = true,
  auto_hide = true,
  closable = true,
  clickable = true,
  exclude_ft = {},
  exclude_name = {},
  icons = {
    button = "",
    inactive = { separator = { left = "▎" } },
    filetype = { enabled = true },
    modified = { button = "●" },
    pinned = { button = "車" },
  },
  insert_at_end = false,
  insert_at_start = false,
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  maximum_padding = 1,
  maximum_length = 30,
  no_name_title = nil,
  semantic_letters = true,
})

vim.keymap.set(Mode.normal, "<leader>n", ":BufferNext<CR>", { noremap = true })
vim.keymap.set(Mode.normal, "<leader>N", ":BufferPrevious<CR>", { noremap = true })
vim.keymap.set(Mode.normal, "<leader>q", ":BufferClose<CR>", { noremap = true })
vim.keymap.set(Mode.normal, "<C-s>", ":BufferMoveNext<CR>", { noremap = true })
vim.keymap.set(Mode.normal, "<C-a>", ":BufferMovePrevious<CR>", { noremap = true })
