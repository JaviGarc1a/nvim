return {
	{
		"folke/todo-comments.nvim",
		opts = {},
		keys = {
			{
				"<leader>Tn",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next Todo Comments",
			},
			{
				"<leader>Tp",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous Todo Comment",
			},
			{
				"<leader>TT",
				"<cmd>TodoTelescope cwd=%:p:h<cr>",
				desc = "Todo Telescope",
			},
		},
	},
	{ "nvim-lua/plenary.nvim", lazy = true },
}
