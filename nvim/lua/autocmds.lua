local packer_user_config = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
local info_log = require("utils").info

-- Turn off syntax highlighting for large files
vim.api.nvim_create_autocmd("BufEnter", {
  group = syntax_group,
  pattern = "*",
  callback = function()
    if vim.api.nvim_buf_line_count(0) > 10000 then
      vim.cmd [[ syntax off ]]
    end
  end
})

-- Make NvimTree bufferline align tabs
vim.api.nvim_create_autocmd('BufWinLeave', {
  pattern = '*',
  callback = function()
    if vim.fn.expand('<afile>'):match('NvimTree') then
      require("bufferline.api").set_offset(0)
    end
  end
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  desc = "Prevent the overwriting of certain highlight groups by colorschemes",
  callback = function()
    vim.api.nvim_set_hl(0, "NormalFloat", {
      link = "Normal",
    })
    vim.api.nvim_set_hl(0, "FloatBorder", {
      bg = "none",
    })

    local error_float = vim.api.nvim_get_hl(0, { name = "ErrorFloat" })
    error_float.bg = nil
    error_float.ctermbg = nil

    vim.api.nvim_set_hl(0, "ErrorFloat", error_float)
  end,
})
