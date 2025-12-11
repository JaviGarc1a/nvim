return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			mode = { "n", "v" },
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
			{
				"<leader>qq",
				"<cmd>qa!<CR>",
				desc = "Force Quit",
			},
			{
				"<leader>Q",
				"<cmd>cclose<CR><cmd>lclose<CR>",
				desc = "Close quickfix window",
			},
			{
				"<leader>t",
				group = "Terminal",
			},
			{
				"<leader>td",
				"<cmd>ToggleTerm dir=%:p:h<CR>",
				desc = "Open Terminal here",
			},
			{
				"<leader>l",
				"<cmd>Lazy<cr>",
				desc = "Lazy",
			},
			{
				"<leader>e",
				group = "NeoTree",
			},
			{
				"<leader>T",
				group = "Todo comments",
			},
			{
				"<leader>f",
				group = "Telescope",
			},
			{
				"<leader>b",
				group = "Bufferline",
			},
		},
	},
}
