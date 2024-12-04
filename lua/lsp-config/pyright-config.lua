require('lspconfig').pyright.setup({
    on_attach = require('lsp-config.handlers').on_attach,
})
