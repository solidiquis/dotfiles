local cmp = require('cmp')
local utils = require('utils')

cmp.setup({
  snippet = {
    expand = function(args)
     require('luasnip').lsp_expand(args.body)
    end,
  },

  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif utils.check_back_space() then
        fallback()
      else
        cmp.complete()
      end
    end, {'i', 's'}),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "treesitter" },
    { name = "buffer" },
    { name = "luasnip" },
    { name = "nvim_lua" },
    { name = "path" },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})
