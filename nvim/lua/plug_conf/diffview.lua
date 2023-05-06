local Mode = require("consts").modes

local opts = { noremap = true, silent = true, nowait = true }

local function toggle_diffview()
  if vim.g.diffview_open then
    vim.cmd [[ DiffviewClose ]]
    vim.g.diffview_open = false
  else
    vim.cmd [[ DiffviewOpen ]]
    vim.g.diffview_open = true
  end
end

vim.keymap.set(Mode.normal, "<leader>d", toggle_diffview, opts)
