return {
	"linux-cultist/venv-selector.nvim",
	dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
	ft = "python",
	opts = {
		auto_refresh = false,
		search_venv_managers = true,
		search_workspace = true,
		search = true,
		dap_enabled = true,
		parents = 2,
		name = { "venv", ".venv", "env", ".env" },
		fd_binary_name = "fd",
		notify_user_on_activate = true,
		stay_on_this_version = true,
	},
	keys = {
		{ "<leader>PVs", "<cmd>VenvSelect<cr>" },
		{ "<leader>PVc", "<cmd>VenvSelectCached<cr>" },
	},
}
