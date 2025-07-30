return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	keys = {
		{
			"<leader>ee",
			function()
				local root = require("utils.root").get()
				require("neo-tree.command").execute({ toggle = true, dir = root })
			end,
			desc = "Toggle NeoTree",
		},
		{
			"<leader>eg",
			function()
				require("neo-tree.command").execute({ source = "git_status", toggle = true })
			end,
			desc = "NeoTree Git Status",
		},
		{
			"<leader>eb",
			function()
				require("neo-tree.command").execute({ source = "buffers", toggle = true })
			end,
			desc = "NeoTree Buffers",
		},
	},
	opts = {
		close_if_last_window = true,
		popup_border_style = "rounded",
		enable_git_status = true,
		enable_diagnostics = true,
		sources = { "filesystem", "buffers", "git_status" },
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
		},
		window = {
			width = 35,
			mappings = {
				["<space>"] = "none",
				["<cr>"] = "open",
				["h"] = "close_node",
				["C"] = "close_all_nodes",
				["R"] = "refresh",
				["P"] = {
					"toggle_preview",
					config = { use_float = true },
				},
				["f"] = "fuzzy_finder",
				["/"] = "filter_on_submit",
				["<C-x>"] = "clear_filter",
			},
		},
		default_component_configs = {
			indent = {
				padding = 1,
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "󰜌",
			},
			git_status = {
				symbols = {
					added = "",
					modified = "",
					deleted = "✖",
					renamed = "󰁕",
					untracked = "",
					ignored = "",
				},
			},
		},
	},
}
