-- python
vim.api.nvim_command([[autocmd FileType python nnoremap <buffer> <C-r> :term python %<CR>]])


-- c
vim.api.nvim_command([[autocmd FileType c nnoremap <buffer> <C-r> :term gcc % && ./a.out<CR>]])
