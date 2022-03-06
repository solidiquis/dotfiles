local lspconfig = require("lspconfig")
local conf = require("lsp.conf")
local cmp_nvim_lsp = require('cmp_nvim_lsp')

local shared_settings = {
  flags = {
    debounce_text_changes = 500
  },
  capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities()) 
}

for _, server in pairs(lspconfig.available_servers()) do
  local lsp_config = vim.tbl_extend("force", conf[server], shared_settings)
  lspconfig[server].setup(lsp_config)
end
