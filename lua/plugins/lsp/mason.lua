return {
	{
		"mason-org/mason.nvim",
		keys = {
			{
				"<leader>m",
				"<cmd>Mason<cr>",
				desc = "Mason",
			},
		},
		build = "<cmd>MasonUpdate<cr>",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"basedpyright",
				"ts_ls",
				"html",
				"tailwindcss",
				"eslint",
			},
			automatic_installation = true,
		},
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
}
