require("mason").setup()

-- Language servers to eagerly install
local language_servers = {
  "bashls",
  "clangd",
  "cssls",
  "denols",
  "docker_compose_language_service",
  "dockerls",
  "eslint",
  "gopls",
  "html",
  "lemminx",
  "lua_ls",
  "marksman",
  "pyright",
  "solargraph",
  "rust_analyzer",
  "sqlls",
  "tailwindcss",
  "tsserver",
  "yamlls",
}

require("mason-lspconfig").setup({
  ensure_installed = language_servers
})

local lspconfig = require("lspconfig")

-- Configure individual language servers here
for _, server in pairs(language_servers) do
  lspconfig[server].setup({})
end

-- lsp_signature UI tweaks
require("lsp_signature").setup({
  bind = true,
  handler_opts = {
    border = "rounded",
  },
})

-- LSP hover window UI tweaks
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "single"
  }
)

-- LSP diagnostics
vim.diagnostic.config {
    float = { border = "single" },
    underline = true,
    virtual_text = false,
    virtual_lines = false
}

-- Key bindings to be set after LSP attaches to buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.api.nvim_buf_set_option(ev.buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
    vim.api.nvim_buf_set_option(ev.buf, "formatexpr", "v:lua.vim.lsp.formatexpr()")

    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    --vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) SEE telescope.lua
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  end,
})
