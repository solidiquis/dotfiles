local mode = os.getenv("LIGHT_MODE")

if mode and string.len(mode) > 0 then
    vim.o.background = "light"
    vim.cmd("colorscheme retrobox")
else
    vim.o.background = "dark"
    vim.cmd("colorscheme retrobox")
end

vim.cmd("highlight! link SignColumn Normal")

require("lualine").setup({})
