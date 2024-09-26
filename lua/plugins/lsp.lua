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
				ensure_installed = { "lua_ls", "ts_ls", "html", "jdtls", "java-debug-adapter", "java-test" }, -- Java 관련 도구 추가
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
			if mason_registry.is_installed("java-debug-adapter") then
				local java_dbg_path = mason_registry.get_package("java-debug-adapter"):get_install_path()
				table.insert(bundles, java_dbg_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar")
			end

			if mason_registry.is_installed("java-test") then
				local java_test_path = mason_registry.get_package("java-test"):get_install_path()
				table.insert(bundles, java_test_path .. "/extension/server/*.jar")
			end

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
