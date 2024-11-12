require("config.lazy")

require("config.globals")
require("config.keymaps")
require("config.options")

require("execute")

vim.o.clipboard = "unnamedplus"

vim.cmd([[highlight Search guibg=#82AAFF guifg=#000000]])

vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]])
