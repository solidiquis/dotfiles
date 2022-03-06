local cmp = require('cmp')

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
      elseif s.check_back_space() then
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

  sources = cmp.config.sources({
   { name = 'luasnip' }
  }, {
    { name = 'buffer' },
  })
})

