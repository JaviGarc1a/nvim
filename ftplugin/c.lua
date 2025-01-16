local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

function run_c(custom)
	if not custom then
		vim.cmd('TermExec dir="%:p:h" cmd="gcc % -o %:r && ./%:r"')
	else
		vim.ui.input({ prompt = "File: " }, function(input)
			vim.cmd(
				'TermExec dir="%:p:h" cmd="gcc '
					.. input
					.. " -o "
					.. input:gsub(".+/(.+)", "%1"):gsub(".c", "")
					.. " && ./"
					.. input:gsub(".+/(.+)", "%1"):gsub(".c", "")
					.. '"'
			)
		end)
	end
end

local mappings = {
	{
		"<leader>C",
		group = "C/C++",
	},
	{
		"<leader>Cr",
		run_c,
		desc = "Run C program",
	},
	{
		"<leader>CR",
		function()
			run_c(true)
		end,
		desc = "Run specific C file",
	},
}

which_key.add(mappings)
