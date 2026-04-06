local mode = os.getenv("LIGHT_MODE")

if mode and string.len(mode) > 0 then
    vim.o.background = "light"
    vim.cmd("colorscheme modus_operandi")
else
    vim.o.background = "dark"
    vim.cmd("colorscheme retrobox")
end

vim.cmd("highlight! link SignColumn Normal")

require("lualine").setup({})
