return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	opts = {
		completions = {
			lsp = { enabled = true },
		},
	},
	ft = { "markdown" },
	keys = {
		{
			"<leader>MP",
			function()
				require("render-markdown").buf_toggle()
			end,
			desc = "Render markdown",
		},
	},
}
