return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = vim.fn.argc(-1) == 0,
	event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"luadoc",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"python",
				"typescript",
				"make",
				"dockerfile",
				"javascript",
				"html",
				"css",
				"json",
				"rust",
				"tsx",
			},
			highlight = {
				enable = true,
			},
			autotag = { enable = true },
			indent = {
				enable = true,
			},
			increment_selection = { enable = true },
			auto_install = true,
		})
	end,
}
