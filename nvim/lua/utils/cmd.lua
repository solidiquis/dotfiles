local M = {}

-- Aliases Lua functions to Vim commands.
-- Example:
--   alias("foo", "Bar") allows you to invoke the Lua function "foo"
--   by calling :Bar in command mode
--
-- Example with args:
--   Say "foo" has the following signature: function foo(arg1, arg2) ... end
--   alias("foo", "Bar", { args = true }) will allow you to
--   invoke "foo" with arguments by calling `:Bar hello world` in command mode.
function M.alias(func, alias, options)
  local opts = { args = false }

  if options then
    opts = vim.tbl_extend("force", opts, options)
  end
  
  if not opts.args then
    vim.cmd(string.format("command! %s lua %s()", alias, func))
    return
  end

  local tmpl = "command! -nargs=1 %s lua %s(make_arg_tbl(<q-args>))"
  local stmt = string.format(tmpl, alias, func)
  vim.cmd(stmt)
end

function M.make_arg_tbl(args)
  local result = {}
  local i = 1
  for arg in vim.gsplit(args, " ", false) do
    result[i] = arg
    i = i + 1
  end

  return unpack(result)
end

return M
