return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	keys = {
		{
			"<leader>ff",
			function()
				local root = require("utils.root").get()
				require("telescope.builtin").find_files({ cwd = root })
			end,
			desc = "Telescope find files",
		},
		{
			"<leader>fg",
			function()
				local root = require("utils.root").get()
				require("telescope.builtin").live_grep({ cwd = root })
			end,
			desc = "Telescope live grep",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Telescope buffers",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Telescope help tags",
		},
	},
}
