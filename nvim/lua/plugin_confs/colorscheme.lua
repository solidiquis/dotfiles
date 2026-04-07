vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	desc = "Prevent the overwriting of certain highlight groups by colorschemes",
	callback = function()
		vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
		local error_float = vim.api.nvim_get_hl(0, { name = "ErrorFloat" })
		error_float.bg = nil
		error_float.ctermbg = nil

		--[[@diagnostic disable-next-line: param-type-mismatch]]
		vim.api.nvim_set_hl(0, "ErrorFloat", error_float)

		-- No italics
		for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
			local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
			if hl.italic then
				--[[@diagnostic disable-next-line: assign-type-mismatch]]
				hl.italic = false
				--[[@diagnostic disable-next-line: param-type-mismatch]]
				vim.api.nvim_set_hl(0, group, hl)
			end
		end
	end,
})

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
