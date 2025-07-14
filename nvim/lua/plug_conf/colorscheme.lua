local mode = os.getenv("LIGHT_MODE")

vim.o.termguicolors = true

require("modus-themes").setup({
	style = "auto",
	variant = "default",
	transparent = false,
	dim_inactive = false,
	hide_inactive_statusline = false,
	line_nr_column_background = false,
	sign_column_background = true,
	styles = {
		comments = { italic = false },
		keywords = { italic = false },
		functions = {},
		variables = {},
	},
	on_colors = function(colors) end,
	on_highlights = function(highlights, colors) end,
})

if mode and string.len(mode) > 0 then
  vim.o.background = "light"
  vim.cmd("colorscheme modus")
else
  vim.o.background = "dark"
  vim.cmd("colorscheme modus")
end

require("lualine").setup({})
