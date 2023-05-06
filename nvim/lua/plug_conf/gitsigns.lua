local alias = require("utils").alias

require("gitsigns").setup({
  signs = {
    untracked = { text = '│' },
  },
})

function git_blame_line()
  vim.cmd "Gitsigns blame_line"
end
alias("git_blame_line", "GitBlameLine")

function git_diff()
  vim.cmd "Gitsigns diffthis"
end
alias("git_diff", "GitDiff")

function git_refresh()
  vim.cmd "Gitsigns refresh"
end
alias("git_refresh", "GitRefresh")

