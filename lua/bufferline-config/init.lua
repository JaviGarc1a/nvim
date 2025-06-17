vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
		mode = "buffers",
		diagnostics = "nvim_lsp",
		always_show_bufferline = false,
		offsets = {
			{
				filetype = "neo-tree",
				text = "Neo-tree",
				highlight = "Directory",
				text_align = "left",
			},
		},
		show_buffer_close_icons = false,
		show_close_icon = false,
	},
})

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local mappings = {
	{ "<leader>b", group = "Bufferline" },
	{ "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Delete buffers to the left" },
	{ "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Delete buffers to the right" },
	{ "<leader>bp", "<cmd>bprevious<cr>", desc = "Prev buffer" },
	{ "<leader>bn", "<cmd>bnext<cr>", desc = "Next buffer" },
}

which_key.add(mappings)
