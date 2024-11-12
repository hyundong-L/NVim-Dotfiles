local keyMapper = require("utils.keyMapper").mapKey

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "html", "jdtls", "dockerls" }, -- Java 관련 도구 추가
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			-- Lua와 TypeScript 설정
			lspconfig.lua_ls.setup({})
			lspconfig.ts_ls.setup({})

			-- Java 설정
			lspconfig.jdtls.setup({
				cmd = { "jdtls" }, -- 설치된 jdtls 실행 경로
				root_dir = lspconfig.util.root_pattern(".git", "pom.xml", "build.gradle"),
				settings = {
					java = {
						eclipse = { downloadSources = true },
						configuration = { updateBuildConfiguration = "interactive" },
						maven = { downloadSources = true },
						implementationsCodeLens = { enabled = true },
						referencesCodeLens = { enabled = true },
						inlayHints = { parameterNames = { enabled = "all" } },
					},
				},
			})

			-- Docker 설정
			lspconfig.dockerls.setup({
				cmd = { "docker-langserver", "--stdio" }, -- 도커 LSP 실행 경로
				filetypes = { "dockerfile" },
				root_dir = lspconfig.util.root_pattern("Dockerfile"),
				settings = {
					docker = {
						languageserver = {
							diagnostics = {
								enabled = true,
							},
						},
					},
				},
			})

			-- 키 매핑 설정
			keyMapper("K", vim.lsp.buf.hover)
			keyMapper("gd", vim.lsp.buf.definition)
			keyMapper("<leader>ca", vim.lsp.buf.code_action)
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
		ft = { "java" },
		config = function()
			local mason_registry = require("mason-registry")
			local lombok_jar = mason_registry.get_package("jdtls"):get_install_path() .. "/lombok.jar"
			local bundles = {}

			-- Java 디버그 및 테스트 설정
			require("jdtls").start_or_attach({
				cmd = { "jdtls", "-javaagent:" .. lombok_jar },
				root_dir = require("lspconfig").util.root_pattern(".git", "pom.xml", "build.gradle"),
				settings = {
					java = {
						inlayHints = { parameterNames = { enabled = "all" } },
					},
				},
				init_options = { bundles = bundles },
			})

			-- Java LSP 명령어에 대한 키 매핑 설정
			keyMapper("<leader>co", require("jdtls").organize_imports)
			keyMapper("<leader>cxv", require("jdtls").extract_variable)
			keyMapper("<leader>cxc", require("jdtls").extract_constant)
			keyMapper("gs", require("jdtls").super_implementation)
		end,
	},
}
