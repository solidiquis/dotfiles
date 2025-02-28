local lint = require("lint")
local info_log = require("utils").info

function run_eslint()
  lint.try_lint()
end

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
}

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" },
  callback = run_eslint
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" },
  callback = run_eslint
})
