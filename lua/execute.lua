-- python
vim.api.nvim_command([[autocmd FileType python nnoremap <buffer> <C-r> :term python3 %<CR>]])

-- c
vim.api.nvim_command([[autocmd FileType c nnoremap <buffer> <C-r> :term gcc % && ./a.out<CR>]])

-- java
vim.api.nvim_command([[autocmd FileType java nnoremap <buffer> <C-r> :term javac % && java %:t:r<CR>]])
