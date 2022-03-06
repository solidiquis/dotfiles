local consts = require("consts")

return {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = consts.runtime_path,
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
