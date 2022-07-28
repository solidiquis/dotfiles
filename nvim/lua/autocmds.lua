local plugins_group = vim.api.nvim_create_augroup("PackerPlugin", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
  group = syntax_group,
  pattern = "*",
  callback = function()
    if vim.api.nvim_buf_line_count(0) > 10000 then
      vim.cmd [[ syntax off ]]
    end
  end
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = plugins_group,
  pattern = "plugins.lua",
  callback = function()
    vim.cmd [[ source $MYVIMRC | PackerCompile ]]
  end
})

vim.api.nvim_create_autocmd('BufWinLeave', {
  pattern = '*',
  callback = function()
    if vim.fn.expand('<afile>'):match('NvimTree') then
      require("bufferline.state").set_offset(0)
    end
  end
})
