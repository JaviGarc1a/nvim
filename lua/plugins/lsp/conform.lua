return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			python = { "ruff", "isort" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			lua = { "stylua" },
			html = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			bash = { "shfmt" },
			sh = { "shfmt" },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 2500,
		},
		format_after_save = {
			lsp_fallback = true,
		},
	},
}
