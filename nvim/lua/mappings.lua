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

-- Tab nav
map(MODES.normal, "<leader>n", "gt")
map(MODES.normal, "<leader>N", "gT")

-- NERDTree
map(MODES.normal, "<leader>e", ":NERDTreeToggle<CR>")

-- Telescope
map(MODES.normal, "<leader>p", ":Telescope find_files hidden=true<CR>")
map(MODES.normal, "<leader>f", ":Telescope live_grep<CR>")
map(MODES.normal, "<leader>s", ":Telescope grep_string<CR>")
map(MODES.normal, "<leader>b", ":Telescope buffers<CR>")
map(MODES.normal, "<leader>h", ":Telescope help_tags<CR>")
