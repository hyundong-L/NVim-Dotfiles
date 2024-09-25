local mapKey = require("utils.keyMapper").mapKey

return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require("telescope.builtin")
            mapKey('<leader>ff', builtin.find_files)
            mapKey('<leader>fg', builtin.live_grep)
            mapKey('<leader>fb', builtin.buffers)
            mapKey('<leader>fh', builtin.help_tags)
        end,
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require('telescope').setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                            -- even more opts
                        }

                      -- pseudo code / specification for writing custom displays, like the one
                      -- for "codeactions"
                      -- specific_opts = {
                      --   [kind] = {
                      --     make_indexed = function(items) -> indexed_items, width,
                      --     make_displayer = function(widths) -> displayer
                      --     make_display = function(displayer) -> function(e)
                      --     make_ordinal = function(e) -> string
                      --   },
                      --   -- for example to disable the custom builtin "codeactions" display
                      --      do the following
                      --   codeactions = false,
                      -- }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    }
}