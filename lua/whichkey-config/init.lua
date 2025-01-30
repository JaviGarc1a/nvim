local wk = require("which-key")


local mappings = {
	{
		"<leader>Q",
		"<cmd>qa!<CR>",
		desc = "Force Quit",
	},
	{
		"<leader>q",
		"<cmd>cclose<CR><cmd>lclose<CR>",
		desc = "Close quickfix window",
	},
	{
		"<space>t",
		group = "Terminal",
	},
	{
		"<space>td",
		":ToggleTerm dir=%:p:h<CR>",
		desc = "Open Terminal here",
	},
}

wk.add(mappings, { mode = "n", silent = true })
