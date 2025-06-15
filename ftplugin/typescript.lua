local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local mappings = {
	{
		"<leader>oi",
		vim.lsp.buf.code_action({ context = { only = { "source.organizeImports.ts" } }, apply = true }),
		desc = "Organize imports",
	},
	{
		"<leader>ru",
		vim.lsp.buf.code_action({ context = { only = { "source.removeUnused.ts" } }, apply = true }),
		desc = "Remove unused imports",
	},
	{
		"<leader>ru",
		vim.lsp.buf.code_action({ context = { only = { "source.addMissingImports.ts" } }, apply = true }),
		desc = "Add missing imports",
	},
}

which_key.add(mappings)
