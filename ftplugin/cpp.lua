local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

function run_cpp(custom)
	if not custom then
		vim.cmd('TermExec dir="%:p:h" cmd="g++ % -o %:r && ./%:r"')
	else
		vim.ui.input({ prompt = "File: " }, function(input)
			vim.cmd(
				'TermExec dir="%:p:h" cmd="g++ '
					.. input
					.. " -o "
					.. input:gsub(".+/(.+)", "%1"):gsub(".cpp", "")
					.. " && ./"
					.. input:gsub(".+/(.+)", "%1"):gsub(".cpp", "")
					.. '"'
			)
		end)
	end
end

local mappings = {
	{
		"<leader>Cp",
		run_cpp,
		desc = "Run C++ program",
	},
	{
		"<leader>CP",
		function()
			run_cpp(true)
		end,
		desc = "Run specific C++ file",
	},
}

which_key.add(mappings)
