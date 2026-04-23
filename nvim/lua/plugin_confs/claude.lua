require("claudecode").setup({})

vim.keymap.set("n", "<leader>c", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })
vim.keymap.set("n", "<C-c>", "<cmd>ClaudeCodeFocus<cr>", { desc = "Toggle Claude" })
vim.keymap.set("n", "<C-a>", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Accept Diff" })
vim.keymap.set("n", "<C-s>", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Deny Diff" })

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	callback = function()
		if vim.fn.mode() ~= "c" then
			vim.cmd("checktime")
		end
	end,
})
