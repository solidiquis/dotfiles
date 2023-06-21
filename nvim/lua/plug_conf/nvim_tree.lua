local winsize = require("utils").winsize
local api = require("nvim-tree.api")
local Mode = require("consts").modes
local bufferline_api = require("bufferline.api")

local DEFAULT_WIDTH = 30

local function inc_width()
  local width, _height = winsize()
  local new_width = width + 10

  vim.cmd(string.format("NvimTreeResize %d", new_width))
end

local function dec_width()
  local width, _height = winsize()

  local new_width = width - 10

  if new_width < DEFAULT_WIDTH then return end

  vim.cmd(string.format("NvimTreeResize %d", new_width))
end

local function on_attach(bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }

  vim.keymap.set(Mode.normal, "<C-v>", api.node.open.vertical, opts)
  vim.keymap.set(Mode.normal, "<C-x>", api.node.open.horizontal, opts)
  vim.keymap.set(Mode.normal, "r", api.tree.reload, opts)
  vim.keymap.set(Mode.normal, "a", api.fs.create, opts)
  vim.keymap.set(Mode.normal, "d", api.fs.remove, opts)
  vim.keymap.set(Mode.normal, "m", api.fs.rename_sub, opts)
  vim.keymap.set(Mode.normal, "y", api.fs.copy.relative_path, opts)
  vim.keymap.set(Mode.normal, "Y", api.fs.copy.absolute_path, opts)
  vim.keymap.set(Mode.normal, "C", api.tree.collapse_all, opts)
  vim.keymap.set(Mode.normal, "K", api.node.show_info_popup, opts)
  vim.keymap.set(Mode.normal, "o", api.node.open.edit, opts)
  vim.keymap.set(Mode.normal, ">", inc_width, opts)
  vim.keymap.set(Mode.normal, "<", dec_width, opts)
  vim.keymap.set(Mode.normal, "<", dec_width, opts)
end

require("nvim-tree").setup({
  auto_reload_on_write = true,
  hijack_cursor = true,
  update_focused_file = {
    enable = true
  },
  sort_by = "name",
  filters = {
    custom = {
      ".git"
    }
  },
  renderer = {
    highlight_opened_files = "name",
  },
  on_attach = on_attach,
  view = {
    side = "left",
    adaptive_size = false,
    centralize_selection = true,
    width = DEFAULT_WIDTH,
  },
})

api.events.subscribe(api.events.Event.Resize, function(new_size)
  bufferline_api.set_offset(new_size, "File Tree")
end)

vim.keymap.set(Mode.normal, "<leader>e", ":NvimTreeToggle<CR>", { noremap = true })
