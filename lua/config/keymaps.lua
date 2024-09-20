local mapKey = require("utils.keyMapper").mapKey

-- Neotree toggle
mapKey("<leader>e", ":Neotree toggle<cr>") -- space + e -> neotree open, close

-- navigate Neotree, editor
mapKey("<C-h>", "<C-w>h") -- left
mapKey("<C-j>", "<C-w>j") -- down
mapKey("<C-k>", "<C-w>k") -- up
mapKey("<C-l>", "<C-w>l") -- right

-- clear search highlight
mapKey("<leader>h", ":nohlsearch<CR>")

-- indent
mapKey("<", "<gv", "v")
mapKey(">", ">gv", "v")
