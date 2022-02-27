local extension_symbols = {
  html = '',
  js = '',
  json = '',
  jsx = 'ﰆ',
  md = '',
  vim = '',
  yaml = '',
  yml = '',
}

local pattern_symbols = {
  ['.*vimrc.*'] = '',
  ['.gitignore'] = '',
  ['package.json'] = '',
  ['package.lock.json'] = '',
  ['node_modules'] = '',
  ["webpack."] = 'ﰩ',
}

vim.g.WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = extension_symbols
vim.g.WebDevIconsUnicodeDecorateFileNodesPatternSymbols = pattern_symbols
vim.g.DevIconsEnableFoldersOpenClose = 1
