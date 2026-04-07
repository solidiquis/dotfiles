local M = {}

function M.winsize()
	local win = vim.api.nvim_get_current_win()
	return unpack({
		vim.api.nvim_win_get_width(win),
		vim.api.nvim_win_get_height(win),
	})
end

function M.visual_get_lines()
	local start_ln = vim.api.nvim_buf_get_mark(0, "<")[1] - 1
	local end_ln = vim.api.nvim_buf_get_mark(0, ">")[1]
	return {
		lines = vim.api.nvim_buf_get_lines(0, start_ln, end_ln, true),
		start_ln = start_ln,
		end_ln = end_ln,
	}
end

return M
