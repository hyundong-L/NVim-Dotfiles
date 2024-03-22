local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}

local cmp = require('cmp')

require('mason').setup()
require('mason-lspconfig').setup()

local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.lua_ls.setup({
  capabilities = lsp_capabilities,
})

cmp.setup({
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
	}, {
		{ name = 'buffer' },
	}),
	snippet = {
		-- Required - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<A-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		-- ['<CR>'] = cmp.mapping.confirm{
			-- behavior = cmp.ConfirmBehavior.Replace,
			-- select = true,
		-- }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	formatting = {
		format = function(entry, vim_item)
			local lspkind_ok, lspkind = pcall(require, 'lspkind')
			if not lspkind_ok then
				-- From kind_icons array
				vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
				-- source
				vim_item.menu = ({
	  			buffer = "[Buffer]",
	  			nvim_lsp = "[LSP]",
	  			luasnip = "[LuaSnip]",
	  			nvim_lua = "[Lua]",
          latex_symbols = "[LaTeX]",
        })[entry.source.name]
        return vim_item
			else
				-- From lspkind
				return lspkind.cmp_format()(entry, vim_tiem)
			end
		end
		}
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' } -- You can specify the 'git' source if [you were installed it](https://github.com/petertriho/cmp.git).
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for '/' and '?' (if you enabled 'native_menu', this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources= {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled 'native_menu', this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})
