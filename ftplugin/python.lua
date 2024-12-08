require('venv-selector').setup({
    auto_refresh = false,
    search_venv_managers = true,
	search_workspace = true,
	search = true,
	dap_enabled = true,
	parents = 2,
	name = { 'venv', '.venv', 'env', '.env' },
	fd_binary_name = 'fd',
	notify_user_on_activate = true,
    stay_on_this_version = true
})

local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
    return
end

function activate_env()
	vim.ui.input({ prompt = 'Env path: ' }, function(input)
		vim.cmd('TermExec cmd="source '.. input ..'/bin/activate.fish"')
	end)
end

function run(custom)
	if not custom then
		vim.cmd('TermExec cmd="python main.py"')
	else
		vim.ui.input({ prompt = 'File: ' }, function(input)
			vim.cmd('TermExec cmd="python '.. input .. '"')
		end)
	end
end

local mappings = {
    {
        '<leader>P',
        group = 'Python'
    },
    {
        '<leader>Pc',
        '<cmd>VenvSelect<CR>',
        desc = 'Choose Env'
    },
    {
        '<leader>Pv',
        activate_env,
        desc = 'Activate env'
    },
    {
        '<leader>Pr',
        run,
        desc = 'Run main'
    },
    {
        '<leader>PR',
        function()
            run(true)
        end,
        desc = 'Run file'
    }
}

which_key.add(mappings)
