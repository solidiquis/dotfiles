local cmp_nvim_lsp = require('cmp_nvim_lsp')
local lsp_installer = require("nvim-lsp-installer")

local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true }

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

lsp_installer.on_server_ready(function(server)
  local cmp_capabilities = vim.lsp.protocol.make_client_capabilities()

  local opts = {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 500
    },
    capabilities = cmp_nvim_lsp.update_capabilities(cmp_capabilities)
  }

  server:setup(opts)
end)

if vim.g.diagnostics_enabled then
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = false,
      virtual_text = true
    }
  )
else
  vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
end

