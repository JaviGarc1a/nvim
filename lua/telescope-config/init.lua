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
		builtin.find_files,
		desc = "Telescope find files",
	},
	{
		"<leader>fg",
		builtin.live_grep,
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
