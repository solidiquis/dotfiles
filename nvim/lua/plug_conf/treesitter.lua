local DISABLE_HIGHLIGHT_THRESHOLD = 30000

require("nvim-treesitter").setup({
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
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
  },
  auto_install = true,
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = function(lang, bufnr)
      return vim.api.nvim_buf_line_count(bufnr or 0) > DISABLE_HIGHLIGHT_THRESHOLD
    end,
  }
})
