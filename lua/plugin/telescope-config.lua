vim.api.nvim_set_keymap('n', ';f', [[<cmd>Telescope find_files<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', ';;', [[<cmd>Telescope help_tags<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '\\', [[<cmd>Telescope buffers<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', ';r', [[<cmd>Telescope live_grep<cr>]], {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<A-v>', [[<cmd>Telescope file_browser<cr>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', ';F', [[<cmd>Telescope file_browser<cr>]], {noremap=true, silent=true})

-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
require("telescope").setup {
  defaults = {
    theme = "center",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.3,
      },
    },
  },
	extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"
