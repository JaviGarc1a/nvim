local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		-- Python
		null_ls.builtins.formatting.black,

		-- Lua
		null_ls.builtins.formatting.stylua,

		-- C, C++
		null_ls.builtins.formatting.clang_format,

		-- Bash
		null_ls.builtins.formatting.shfmt.with({
			extra_args = { "-i", "4" },
		}),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			local autogroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
			vim.api.nvim_clear_autocmds({ group = autogroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = autogroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
})
