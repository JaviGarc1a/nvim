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
	events = { "ButReadPre", "ButNewFile" },
	config = function()
		require("nvim-ts-autotag").setup()
	end,
}
