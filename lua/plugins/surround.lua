return {
	"kylechui/nvim-surround",
	version = "*",
	event = "VeryLazy",
	opts = {
		keymaps = {
			normal = "ys",
			normal_cur = "yss",
			normal_line = "yZ",
			normal_cur_line = "yZZ",
			visual = "z",
			visual_line = "gz",
			delete = "ds",
			change = "cs",
		},
		surrounds = {
			-- Surround with markdown code block, triple backticks.
			-- <https://github.com/kylechui/nvim-surround/issues/88>
			["~"] = {
				add = function()
					local config = require("nvim-surround.config")
					local result = config.get_input("Markdown code block language: ")
					return {
						{ "```" .. result, "" },
						{ "", "```" },
					}
				end,
			},
		},
	},
}
