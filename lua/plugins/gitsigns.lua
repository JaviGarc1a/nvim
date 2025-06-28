return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged_enable = true,
		signcolumn = true, -- Show signs in the sign column
		numhl = false, -- Disable line number highlighting
		linehl = false, -- Disable full line highlighting
		word_diff = false, -- Highlight word-level differences
		watch_gitdir = { follow_files = true },
		auto_attach = true,
		attach_to_untracked = false,
		current_line_blame = false, -- Inline blame disabled by default
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- Blame text position
			delay = 1000,
			ignore_whitespace = false,
			virt_text_priority = 100,
			use_focus = true,
		},
		current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil,
		max_file_length = 40000, -- Disable on very large files
		preview_config = {
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")
			local status_ok, which_key = pcall(require, "which-key")
			if not status_ok then
				return
			end

			local mappings = {
				{ "<leader>g", group = "Git" },

				-- Hunk navigation
				{
					"<leader>gn",
					function()
						if vim.wo.diff then
							return "]c"
						end
						vim.schedule(function()
							gitsigns.next_hunk()
						end)
					end,
					desc = "Next hunk",
					mode = "n",
				},
				{
					"<leader>gp",
					function()
						if vim.wo.diff then
							return "[c"
						end
						vim.schedule(function()
							gitsigns.prev_hunk()
						end)
					end,
					desc = "Previous hunk",
					mode = "n",
				},

				-- Hunk operations
				{ "<leader>gs", gitsigns.stage_hunk, desc = "Stage hunk" },
				{ "<leader>gr", gitsigns.reset_hunk, desc = "Reset hunk (discard changes)" },

				-- Buffer-wide operations
				{ "<leader>gS", gitsigns.stage_buffer, desc = "Stage entire buffer" },
				{ "<leader>gR", gitsigns.reset_buffer, desc = "Reset entire buffer" },

				-- Diff views
				{ "<leader>gd", gitsigns.diffthis, desc = "Diff vs index" },
				{
					"<leader>gD",
					function()
						gitsigns.diffthis("~")
					end,
					desc = "Diff vs HEAD",
				},

				-- Preview hunk
				{ "<leader>gP", gitsigns.preview_hunk, desc = "Preview current hunk" },

				-- Blame operations
				{ "<leader>gb", gitsigns.blame_line, desc = "Full blame for current line" },
				{ "<leader>gB", gitsigns.toggle_current_line_blame, desc = "Toggle inline blame" },

				-- Deleted lines toggle
				{ "<leader>gt", gitsigns.toggle_deleted, desc = "Toggle deleted lines" },
			}

			which_key.add(mappings)
		end,
	},
}
