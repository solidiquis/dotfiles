require("mason").setup()

local lspconfig = require("lspconfig")

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

-- web-frontend
lspconfig["tailwindcss"].setup({})
lspconfig["vtsls"].setup({})
lspconfig["cssls"].setup({})
lspconfig["html"].setup({})

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
      }
    },
  },
})

-- lsp_signature UI tweaks
require("lsp_signature").setup({
  bind = true,
  timer_interval = 350,
  handler_opts = {
    border = "rounded",
  },
})

-- LSP hover window UI tweaks
-- This actually gets overridden by 'noice' to see the 'noice' config.
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
