return {
	"windwp/nvim-ts-autotag",
	ft = {
		"html",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"astro",
	},
	events = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-ts-autotag").setup()
	end,
}
