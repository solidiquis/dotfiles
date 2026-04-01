require("mason").setup()

local cmp_nvim_lsp = require("cmp_nvim_lsp")

vim.lsp.config("bashls", {})
vim.lsp.config("clangd", {})
vim.lsp.config("docker_compose_language_service", {})
vim.lsp.config("dockerls", {})
vim.lsp.config("lemminx", {})
vim.lsp.config("lua_ls", {})
vim.lsp.config("marksman", {})
vim.lsp.config("pyright", {})
vim.lsp.config("solargraph", {})
vim.lsp.config("yamlls", {})

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      env = {
          GOFLAGS = "-tags=windows,linux,unittest,integration,unit"
      }
    }
  }
})

vim.lsp.config("sqlls", {
  root_dir = function(fname)
    return vim.fs.root(fname, {".git"}) or vim.fn.getcwd()
  end,
})

vim.lsp.config("rust_analyzer", {
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
vim.lsp.config("tailwindcss", {
  filetypes = { "rust" },
})
vim.lsp.config("vtsls", {})
vim.lsp.config("cssls", {
  capabilities = cmp_nvim_lsp.default_capabilities(),
})
-- Need the following: npm i -g vscode-langservers-extracted
vim.lsp.config("html", {
  capabilities = cmp_nvim_lsp.default_capabilities(),
  filetypes = { "html", "htmldjango" },
})

vim.lsp.enable({
  "bashls", "clangd", "docker_compose_language_service", "dockerls",
  "lemminx", "lua_ls", "marksman", "pyright", "solargraph", "yamlls",
  "gopls", "sqlls", "rust_analyzer", "tailwindcss", "vtsls", "cssls", "html",
})

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
    vim.keymap.set("n", "s", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    --vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) SEE telescope.lua
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  end,
})
