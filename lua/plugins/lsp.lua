local keyMapper = require('utils.keyMapper').mapKey

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require('mason').setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { "lua_ls", "ts_ls", "html" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({})
            lspconfig.ts_ls.setup({})

            keyMapper('K', vim.lsp.buf.hover)
            keyMapper('gd', vim.lsp.buf.definition)
            keyMapper('<leader>ca', vim.lsp.buf.code_action)
        end
    }
}