require("mason").setup({
	ensure_installed = { "lua_ls", "basedpyright" },
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
