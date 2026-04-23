vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.encoding = "utf-8"
vim.opt.expandtab = true
vim.opt.nu = true
vim.opt.errorbells = false
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.incsearch = true
vim.opt.autoindent = true
vim.opt.hlsearch = false
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.fillchars = { eob = " " }
vim.opt.autoread = true

vim.o.winborder = "rounded"
vim.o.signcolumn = "yes:1"

vim.opt.cmdheight = 0
require("vim._core.ui2").enable({})
