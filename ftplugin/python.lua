local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

function activate_env()
	vim.ui.input({ prompt = "Env path: " }, function(input)
		vim.cmd('TermExec dir="%:p:h" cmd="source ' .. input .. '/bin/activate"')
	end)
end

function run(custom)
	if not custom then
		vim.cmd('TermExec dir="%:p:h" cmd="python main.py"')
	else
		vim.ui.input({ prompt = "File: " }, function(input)
			vim.cmd('TermExec dir="%:p:h" cmd="python ' .. input .. '"')
		end)
	end
end

local mappings = {
	{
		"<leader>P",
		group = "Python",
	},
	{
		"<leader>Pv",
		activate_env,
		desc = "Activate env",
	},
	{
		"<leader>Pr",
		run,
		desc = "Run main",
	},
	{
		"<leader>PR",
		function()
			run(true)
		end,
		desc = "Run file",
	},
}

which_key.add(mappings)
