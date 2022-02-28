local lsp = require('lsp-zero')
local cmp = require('cmp')

function check_back_space()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

local cmp_default_mappings = require("lsp-zero.nvim-cmp-setup").default_mappings()
local cmp_mappings = vim.tbl_extend("force", cmp_default_mappings, {
  ['<Tab>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item(select_opts)
    elseif check_back_space() then
      fallback()
    else
      cmp.mapping.confirm({select = true})
      cmp.complete()
    end
  end, {'i', 's'}), 
})


lsp.preset('recommended')

lsp.setup_nvim_cmp({ mapping = cmp_mappings })

lsp.setup()
