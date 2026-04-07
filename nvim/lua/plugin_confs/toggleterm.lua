local utils = require("utils.window")

local Direction = {
	horizontal = "horizontal",
	vertical = "vertical",
	tab = "tab",
	float = "float",
}

require("toggleterm").setup({
	open_mapping = [[<c-\>]],
	direction = Direction.float,
	size = function(term)
		if term.direction == "horizontal" then
			return math.floor(vim.api.nvim_win_get_height(0) * 0.5)
		end
	end,
	hide_numbers = true,
	shade_terminals = true,
	start_in_insert = true,
	insert_mappings = true,
	terminal_mappings = true,
	persist_size = true,
	persist_mode = false,
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
	},
})

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "term://*",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-w>j]], { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-w>k]], { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-w>l]], { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-w>h]], { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "q", [[i]], { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "p", [[pi]], { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "<", ":lua update_buf_width(2)<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", ">", ":lua update_buf_width(-2)<CR>", { noremap = true })
	end,
})
