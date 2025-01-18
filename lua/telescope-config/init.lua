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
			builtin.find_files({ cwd = vim.fn.expand("%:p:h") })
		end,
		desc = "Telescope find files",
	},
	{
		"<leader>fg",
		function()
			builtin.live_grep({ cwd = vim.fn.expand("%:p:h") })
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
