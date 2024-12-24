require('lspconfig').bashls.setup({
	on_attach = require('lsp-config.handlers').on_attach,
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh", "bash" },
	settings = {}
})
