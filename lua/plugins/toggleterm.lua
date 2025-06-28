return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = "VeryLazy",
	keys = {
		{
			"<leader>tf",
			function()
				require("toggleterm").toggle(1, nil, nil, "float")
			end,
			desc = "Toggle float terminal",
		},
		{
			"<leader>th",
			function()
				require("toggleterm").toggle(2, 15, nil, "horizontal")
			end,
			desc = "Toggle horizontal terminal",
		},
		{ "<C-t>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
	},
	opts = {
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			else
				return 20
			end
		end,
		open_mapping = [[<C-t>]],
		hide_numbers = true,
		shade_filetypes = {},
		shade_terminals = true,
		shading_factor = 2,
		start_in_insert = true,
		insert_mappings = true,
		terminal_mappings = true,
		persist_size = true,
		persist_mode = true,
		direction = "float",
		close_on_exit = true,
		shell = vim.o.shell,
		auto_scroll = true,
		float_opts = {
			border = "curved",
			width = function()
				return math.floor(vim.o.columns * 0.8)
			end,
			height = function()
				return math.floor(vim.o.lines * 0.8)
			end,
			winblend = 0,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
		on_open = function(term)
			vim.cmd("startinsert!")
			vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
			vim.api.nvim_buf_set_keymap(
				term.bufnr,
				"t",
				"<C-h>",
				[[<Cmd>wincmd h<CR>]],
				{ noremap = true, silent = true }
			)
			vim.api.nvim_buf_set_keymap(
				term.bufnr,
				"t",
				"<C-j>",
				[[<Cmd>wincmd j<CR>]],
				{ noremap = true, silent = true }
			)
			vim.api.nvim_buf_set_keymap(
				term.bufnr,
				"t",
				"<C-k>",
				[[<Cmd>wincmd k<CR>]],
				{ noremap = true, silent = true }
			)
			vim.api.nvim_buf_set_keymap(
				term.bufnr,
				"t",
				"<C-l>",
				[[<Cmd>wincmd l<CR>]],
				{ noremap = true, silent = true }
			)
		end,
	},
}
