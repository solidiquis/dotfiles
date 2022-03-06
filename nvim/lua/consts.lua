local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local consts = {
  modes = {
    all = "",
    normal = "n",
    visual_select = "v",
    select = "s",
    visual = "x",
    operator_pending = "o",
    insert_command = "!",
    insert = "i",
    insert_command_lang_arg = "l",
    command_line = "c",
    terminal = "t"
  },
  runtime_path = runtime_path
}

return consts
