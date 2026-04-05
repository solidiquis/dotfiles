vim.keymap.set(
    "n",
    "<leader>d",
    function()
      if vim.g.diffview_open then
        vim.cmd("DiffviewClose")
        vim.g.diffview_open = false
      else
        vim.cmd("DiffviewOpen")
        vim.g.diffview_open = true
      end
    end,
    { noremap = true, silent = true, nowait = true }
)
