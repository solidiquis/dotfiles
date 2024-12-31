require("noice").setup({
  cmdline = {
    enabled = true,
  },
  messages = {
    enabled = false,
  },
  popupmenu = {
    enabled = false,
  },
  lsp = {
    progress = {
      enabled = false,
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
      ["vim.lsp.util.stylize_markdown"] = false,
      ["cmp.entry.get_documentation"] = false,
    },
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = false,
    long_message_to_split = false,
  },
})
