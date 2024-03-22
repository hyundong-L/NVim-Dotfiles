-- Java Compile Option
vim.api.nvim_command([[autocmd FileType java nnoremap <buffer> <C-r> :term javac %<CR>]])

-- C Lang Compile Options
vim.api.nvim_command([[autocmd FileType c nnoremap <buffer> <C-r> :term gcc % && ./a.out<CR>]])
