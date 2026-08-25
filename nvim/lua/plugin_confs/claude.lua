require("claudecode").setup({
	diff_opts = {
		layout = "horizontal",
	},
})

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

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "term://*",
	callback = function(args)
		vim.schedule(function()
			local ok, terminal = pcall(require, "claudecode.terminal")
			if not ok or terminal.get_active_terminal_bufnr() ~= args.buf then
				return
			end
			vim.keymap.set("t", "<C-c>", function()
				vim.api.nvim_chan_send(vim.bo[args.buf].channel, "\27")
			end, { buffer = args.buf, desc = "Interrupt Claude" })
		end)
	end,
})
