function alias(func, alias, options)
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

function make_arg_tbl(args)
  local result = {}
  local i = 1
  for arg in vim.gsplit(args, " ", false) do
    result[i] = arg
    i = i + 1
  end

  return unpack(result)
end

function nt_find()
  vim.api.nvim_command("NERDTreeFind")
end
alias("nt_find", "F")

function source()
  vim.api.nvim_command("source $MYVIMRC")
end
alias("source", "So")

function line_up()
  local seq = vim.api.nvim_replace_termcodes(
    "^dg_k$A <Esc>pjdd",
    true,
    false,
    true
  )
  vim.api.nvim_feedkeys(seq, "n", false)
end
alias("line_up", "LU")

function ft()
  vim.cmd("set filetype?")
end

function cc_rfp()
  local file_name = vim.split(vim.api.nvim_buf_get_name(0), vim.fn.getcwd())[2]
  local cmd = string.format("printf %s | pbcopy", file_name)
  os.execute(cmd)
end

function inspect(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end

-- WIP
--function _G.test()
  ----top_mark = vim.api.nvim.get_buf_get_mark(0, "<")
  ----bot_mark = vim.api.nvim.get_buf_get_mark(0, ">")

  --print(vim.api.nvim_get_mark())
--end

-- example of cmd with args:
-- :Foo 1 2
function test(a, b)
  print(a, b)
end
alias("test", "Foo", { args = true })

