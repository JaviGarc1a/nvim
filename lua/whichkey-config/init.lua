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
		"<leader>t",
		group = "Terminal",
	},
	{
		"<leader>td",
		"<cmd>ToggleTerm dir=%:p:h<CR>",
		desc = "Open Terminal here",
	},
	{
		"<leader>?",
		wk.show,
		desc = "Buffer local keymaps",
	},
	{
		"<leader>m",
		"<cmd>Mason<cr>",
		desc = "Mason"
	},
	{
		"<leader>p",
		"<cmd>PackerSync<cr>",
		desc = "Packer Sync"
	}
}

wk.add(mappings, { mode = "n", silent = true })
