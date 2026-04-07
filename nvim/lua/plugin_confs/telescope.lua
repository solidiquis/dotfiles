local builtin = require("telescope.builtin")
local logging = require("utils.logging")
local actions_state = require("telescope.actions.state")

local data_path = vim.fn.stdpath("data")
local fzf_dir = vim.fs.joinpath(data_path, "site", "pack", "core", "opt", "telescope-fzf-native.nvim")
local fzf_lib = vim.fs.joinpath(fzf_dir, "build", "libfzf.so")

-- Compile the FZF if not already compiled
if vim.uv.fs_stat(fzf_lib) == nil then
	local cmd = string.format(
		"cd %s && cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install",
		vim.fn.shellescape(fzf_dir)
	)

	if os.execute(cmd) ~= 0 then
		logging.error("failed to build FZF library")
	else
		logging.info("FZF library built successfully")
	end
end

require("telescope").setup({
	defaults = {
		layout_strategy = "vertical",
		layout_config = {
			preview_cutoff = 0,
		},
		file_ignore_patterns = {
			"%.git$",
		},
		mappings = {
			i = {
				["<C-d>"] = "delete_buffer",
				-- Multi-file selection and opening
				["<C-o>"] = function()
					local buf_num = vim.api.nvim_get_current_buf()
					local picker = actions_state.get_current_picker(buf_num)
					local selections = picker:get_multi_selection()

					if vim.tbl_count(selections) > 1 then
						for _, selection in ipairs(selections) do
							vim.api.nvim_command("edit " .. vim.fn.fnameescape(selection[1]))
						end
					else
						local selection = picker:get_selection()
						vim.api.nvim_command("edit " .. vim.fn.fnameescape(selection[1]))
					end
				end,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

require("telescope").load_extension("fzf")

vim.keymap.set("n", "<leader>p", ":Telescope find_files<CR>", { noremap = true })
vim.keymap.set(
	"n",
	"<leader>P",
	":Telescope find_files no_ignore=true no_ignore_parent=true hidden=true<CR>",
	{ noremap = true }
)
vim.keymap.set("n", "<leader>f", ":Telescope live_grep<CR>", { noremap = true })
vim.keymap.set("n", "<leader>h", ":Telescope help_tags<CR>", { noremap = true })
vim.keymap.set("n", "<leader>s", ":Telescope grep_string<CR>", { noremap = true })
vim.keymap.set("n", "<leader>s", ":Telescope grep_string<CR>", { noremap = true })
vim.keymap.set("n", "<leader>b", ":Telescope buffers sort_lastused=true<CR>", { noremap = true })
vim.keymap.set("n", "<leader>;", ":Telescope diagnostics<CR>", { noremap = true })
vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>", { noremap = true })

vim.keymap.set("n", "<leader>l", function()
	builtin.lsp_document_symbols({ symbol_width = 200 })
end, { noremap = true })
