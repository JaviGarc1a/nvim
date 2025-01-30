local builtin = require("telescope.builtin")

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local mappings = {
	{
		"<leader>f",
		group = "Telescope",
	},
	{
		"<leader>ff",
		function()
			local oil_active = vim.bo.filetype == "oil"
			local cwd = oil_active and require("oil").get_current_dir() or vim.fn.expand("%:p:h")
			builtin.find_files({ cwd = cwd })
		end,
		desc = "Telescope find files",
	},
	{
		"<leader>fg",
		function()
			local oil_active = vim.bo.filetype == "oil"
			local cwd = oil_active and require("oil").get_current_dir() or vim.fn.expand("%:p:h")
			builtin.live_grep({ cwd = cwd })
		end,
		desc = "Telescope live grep",
	},
	{
		"<leader>fb",
		builtin.buffers,
		desc = "Telescope buffers",
	},
	{
		"<leader>fh",
		builtin.help_tags,
		desc = "Telescope help tags",
	},
}

which_key.add(mappings)
