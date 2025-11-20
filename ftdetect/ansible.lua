vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*playbook*.yml" },
	callback = function()
		vim.bo.filetype = "yaml.ansible"
	end,
})
