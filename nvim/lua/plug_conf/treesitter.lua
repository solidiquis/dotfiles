local DISABLE_HIGHLIGHT_THRESHOLD = 30000

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "go",
    "html",
    "javascript",
    "lua",
    "python",
    "ruby",
    "rust",
    "sql",
    "typescript",
    "yaml",
  },
  auto_install = true,
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = function(_lang, _bufnr)
      return vim.api.nvim_buf_line_count(0) > DISABLE_HIGHLIGHT_THRESHOLD
    end,
  }
})
