require("neo-tree").setup({
	close_if_last_window = true,
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	sources = { "filesystem", "buffers", "git_status" },
	filesystem = {
		follow_current_file = { enabled = true },
		use_libuv_file_watcher = true
	},
	window = {
		width = 35,
		mappings = {
			["<space>"] = "none",
			["<cr>"] = "open",
			["h"] = "close_node",
			["C"] = "close_all_nodes",
			["R"] = "refresh",
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
})

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local mappings = {
	{ "<leader>e", group = "NeoTree"},
	{ "<leader>ee", "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" },
	{ "<leader>eo", "<cmd>Neotree focus<cr>", desc = "Focus NeoTree" },
}

which_key.add(mappings)
