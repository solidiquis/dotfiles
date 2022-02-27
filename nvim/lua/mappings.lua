local function map(mode, mapping, cmd, options)
  local opts = { noremap = true }
  if options then
    opts = vim.tbl_extend("force", opts, options)
  end
  vim.api.nvim_set_keymap(mode, mapping, cmd, opts)
end

local MODES = {
  all = "",
  normal = "n",
  visual_select = "v",
  select = "s",
  visual = "x",
  operator_pending = "o",
  insert_command = "!",
  insert = "i",
  insert_command_lang_arg = "l",
  command_line = "c",
  terminal = "t"
}

vim.g.mapleader = " "

-- Pane navigation
map(MODES.normal, "<C-J>", "<C-W><C-J>")
map(MODES.normal, "<C-K>", "<C-W><C-K>")
map(MODES.normal, "<C-L>", "<C-W><C-L>")
map(MODES.normal, "<C-H>", "<C-W><C-H>")

-- Equalize pane widths
map(MODES.normal, "<leader>=", "<C-W><C-=>")

-- copy/paste
map(MODES.visual_select, '<leader>c', '"*yy<CR>')
map(MODES.normal, '<leader>v', '"+p<CR>')

-- NERDTree
map(MODES.normal, "<leader>e", ":NERDTreeToggle<CR>")
