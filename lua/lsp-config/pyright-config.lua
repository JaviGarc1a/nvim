require("lspconfig").basedpyright.setup({
	on_attach = require("lsp-config.handlers").on_attach,
	capabilities = require("lsp-config.handlers").capabilities,
	settings = {
		basedpyright = {
			analysis = {
				typeCheckingMode = "basic",
				autoImportCompletions = true,
				inlayHints = {
					variableTypes = true,
					functionReturnTypes = true,
					parameterNames = "all",
				}
			}
		}
	}
})
