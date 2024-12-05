-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require('packer').startup(function(use)
	-- Essentials
	use('wbthomason/packer.nvim')
	use({ "nvim-treesitter/nvim-treesitter", run = ':TSUpdate' })

    use('nvim-tree/nvim-web-devicons')
    use('stevearc/oil.nvim')
    use('folke/which-key.nvim')
    use('windwp/nvim-autopairs')
    -- CMP
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")

	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	use("onsails/lspkind.nvim")

    -- Mason
    use { "williamboman/mason.nvim", run = ":MasonUpdate" }
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"

    -- Start Screen
    use ({'goolord/alpha-nvim', requires = { 'echasnovski/mini.icons' }})

    -- Theme
    use { "catppuccin/nvim", as = "catppuccin" }
	-- Fuzzy Finder 
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		requires = { {'nvim-lua/plenary.nvim'} }
	}


	-- MARKDOWN
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})
end)
