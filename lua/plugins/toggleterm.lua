return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = "VeryLazy",
	config = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local terminals = {}

		local function toggle_terminal(opts)
			local id = opts.id
			if not terminals[id] then
				terminals[id] = Terminal:new({
					id = id,
					direction = opts.direction or "float",
					dir = vim.fn.expand("%:p:h"),
					size = opts.size or 15,
					float_opts = {
						border = "curved",
						width = math.floor(vim.o.columns * 0.8),
						height = math.floor(vim.o.lines * 0.8),
						winblend = 0,
						highlights = {
							border = "Normal",
							background = "Normal",
						},
					},
				})
			end
			terminals[id]:toggle()
		end

		vim.keymap.set("n", "<leader>tf", function()
			toggle_terminal({ id = 1, direction = "float" })
		end, { desc = "Toggle terminal (float)" })

		vim.keymap.set("n", "<leader>th", function()
			toggle_terminal({ id = 2, direction = "horizontal", size = 20 })
		end, { desc = "Toggle terminal (horizontal)" })

		vim.keymap.set("n", "<leader>tl", "<cmd>ListTerminals<cr>", { desc = "Toggle terminal (horizontal)" })

		vim.keymap.set("n", "<leader>tc", "<cmd>CloseAllTerminals<cr>", { desc = "Toggle terminal (horizontal)" })

		vim.keymap.set("n", "<C-'>", "<cmd>ToggleTerm<cr>", { desc = "Toggle default terminal" })

		vim.api.nvim_create_user_command("CloseAllTerminals", function()
			for _, term in pairs(require("toggleterm.terminal").get_all()) do
				term:shutdown()
			end
		end, { desc = "Close all ToggleTerm terminals" })

		vim.api.nvim_create_user_command("ListTerminals", function()
			local terms = require("toggleterm.terminal").get_all()
			for _, term in ipairs(terms) do
				print(
					string.format("ID: %d | dir: %s | open: %s", term.id, term.dir or "N/A", tostring(term:is_open()))
				)
			end
		end, { desc = "List all ToggleTerm terminals" })

		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<C-'>]],
			hide_numbers = true,
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
			on_open = function(term)
				local opts = { noremap = true, silent = true }

				vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", [[<C-\><C-n>]], opts)
				vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			end,
		})
	end,
}
