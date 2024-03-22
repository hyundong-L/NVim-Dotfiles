require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup {
    ensure_installed = {
			"lua_ls",
			"rust_analyzer",
		},
}

require("lspconfig")['lua_ls'].setup({
	on_attach = on_attach,
	capabilities = capabilites
})

require("lspconfig")['pyright'].setup({
	on_attach = on_attach,
	capabilities = capabilites
})

require("lspconfig")['clangd'].setup({
	on_attach = on_attach,
	capabilities = capabilites
})

require("lspconfig")['jdtls'].setup({
	on_attach = on_attach,
	capabilities = capabilites,
	settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-17",
            path = "/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home",
            default = true,
          }
        }
      }
    }
  }
})

require("lspconfig")['marksman'].setup({
	on_attach = on_attach,
	capabilities = capabilites
})
