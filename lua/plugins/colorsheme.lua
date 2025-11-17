return {
	"catppuccin/nvim",
	name = "catppuccin",
	-- lazy = true,
	-- event = "VeryLazy",
	priority = 1000,
	opts = function()
		require("catppuccin").setup({
			transparent_background = true,
			auto_integrations = true,
			custom_highlights = function(colors)
				return {
					NeoTreeCursorLine = { bg = colors.surface1, bold = true }
				}
			end
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
