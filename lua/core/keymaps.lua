vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to left window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to left window" })
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "Go to left window" })
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set({ "i", "n", "s" }, "<Esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Delete LSP default keymaps
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grn")

-- Bufferline
vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", { desc = "Delete buffers to the left" })
vim.keymap.set("n", "<leader>br", "<cmd>BufferLineCloseRight<cr>", { desc = "Delete buffers to the right" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>lua Snacks.bufdelete()<cr>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>bD", "<cmd>lua Snacks.bufdelete.all()<cr>", { desc = "Close all buffers" })
vim.keymap.set("n", "<leader>bo", "<cmd>lua Snacks.bufdelete.other()<cr>", { desc = "Close other buffers" })
