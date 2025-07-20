return {
	"mfussenegger/nvim-lint",
	events = { "BufWritePost", "BufReadPost", "InsertLeave" },
	config = function()
		local linter = require("lint")

		linter.linters_by_ft = {
			python = { "ruff" },
			typescript = { "eslint" },
			javascript = { "eslint" },
			dockerfile = { "hadolint" },
		}
	end,
}
