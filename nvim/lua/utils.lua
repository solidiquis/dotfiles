local mode = require("consts").modes

function _G.nt_find()
  vim.api.nvim_command("NERDTreeFind")
end

function _G.so()
  vim.api.nvim_command("source $MYVIMRC")
end

function _G.line_up()
  vim.api.nvim_feedkeys("^dg_k$A", mode.normal, false)
  vim.api.nvim_feedkeys("pjdd", mode.normal, false)
end

function _G.inspect(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end
