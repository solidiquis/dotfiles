local packer_user_config = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
local info_log = require("utils").info

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

    -- Clear italic from all highlight groups.. i hate italics
    for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
      local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
      if hl.italic then
        hl.italic = false
        vim.api.nvim_set_hl(0, group, hl)
      end
    end
  end,
})

-- Funky go file behavior.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.expandtab = false
  end,
})

-- Restart LSP when dependencies change.
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "cargo.toml" },
    callback = function()
        info_log("Restarting LSP.")
        vim.cmd("LspRestart")
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(_)
    info_log("LSP client successfully attached.")
  end,
})


vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function(ctx)
    vim.opt.cmdheight = 1
  end
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    vim.opt.cmdheight = 0
  end
})
