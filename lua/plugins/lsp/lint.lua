return {
	"mfussengger/nvim-lint",
	optional = true,
	events = { "BufWritePost", "BufReadPost", "InsertLeave" },
	opts = {
		linters_by_ft = {
			python = { "ruff" },
			typescript = { "eslint" },
			javascript = { "eslint" },
			dockerfile = { "hadolint" },
		},
	},
}
