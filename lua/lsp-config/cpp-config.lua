local lspconfig = require("lspconfig")
lspconfig.clangd.setup({
	on_attach = require("lsp-config.handlers").on_attach,
	cmd = { "clangd" },
	root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
	capabilities = require("lsp-config.handlers").capabilities,
})
