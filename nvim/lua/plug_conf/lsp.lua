require("mason").setup()

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

lspconfig["bashls"].setup({})
lspconfig["clangd"].setup({})
lspconfig["docker_compose_language_service"].setup({})
lspconfig["dockerls"].setup({})
lspconfig["lemminx"].setup({})
lspconfig["lua_ls"].setup({})
lspconfig["marksman"].setup({})
lspconfig["pyright"].setup({})
lspconfig["solargraph"].setup({})
lspconfig["yamlls"].setup({})
lspconfig["clangd"].setup({})

lspconfig["gopls"].setup({
  settings = {
    gopls = {
      env = {
          GOFLAGS = "-tags=windows,linux,unittest,integration,unit"
      }
    }
  }
})

lspconfig["sqlls"].setup({
  root_dir = function(fname)
    return lspconfig.util.find_git_ancestor(fname) or vim.fn.getcwd()
  end,
})

lspconfig["rust_analyzer"].setup({
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        disabled = { "inactive-code" },
      },
      cargo = {
        features = "all",
      },
    },
  },
})

-- web-frontend
lspconfig["tailwindcss"].setup({})
lspconfig["vtsls"].setup({})
lspconfig["cssls"].setup({
  capabilities = cmp_nvim_lsp.default_capabilities(),
})
-- Need the following: npm i -g vscode-langservers-extracted
lspconfig["html"].setup({
  capabilities = cmp_nvim_lsp.default_capabilities(),
  filetypes = { "html", "htmldjango" },
})

-- This is actually very annoying
-- lsp_signature UI tweaks
--require("lsp_signature").setup({
  --bind = true,
  --timer_interval = 350,
  --handler_opts = {
    --border = "rounded",
  --},
--})

-- LSP diagnostics
vim.diagnostic.config {
    float = { border = "single" },
    underline = true,
    virtual_text = false,
    virtual_lines = false
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "single"
  }
)

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
