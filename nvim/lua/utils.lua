function _G.nt_find()
  vim.cmd(":NERDTreeFind")
end
vim.cmd("command! F call v:lua.nt_find()")
