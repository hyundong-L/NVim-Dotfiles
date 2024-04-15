vim.o.number = true
vim.o.ruler = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.syntax = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.clipboard=unnamedplus

vim.cmd[[colorscheme palenightfall]]

require('palenightfall').setup({
  transparent = true,
})

require('plugged')
require('lsp-config')
require('execute')
