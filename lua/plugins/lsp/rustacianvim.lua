-- plugins/rustaceanvim.lua
return {
	"mrcjkb/rustaceanvim",
	version = "^6",
	lazy = false,
	ft = { "rust" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"mfussenegger/nvim-dap",
	},
	config = function()
		vim.g.rustaceanvim = {
			tools = {
				inlay_hints = {
					auto = true,
					only_current_line = false,
					show_parameter_hints = true,
					parameter_hints_prefix = "<- ",
					other_hints_prefix = "=> ",
					max_len_align = false,
					max_len_align_padding = 1,
					right_align = false,
					right_align_padding = 7,
					highlight = "Comment",
				},
				hover_actions = {
					auto_focus = false,
					border = "rounded",
					width = 60,
					height = 20,
				},
				crate_graph = {
					backend = "x11",
					output = nil,
					full = true,
					enabled_graphviz_backends = {
						"bmp",
						"cgimage",
						"canon",
						"dot",
						"gv",
						"xdot",
						"xdot1.2",
						"xdot1.4",
						"eps",
						"exr",
						"fig",
						"gd",
						"gd2",
						"gif",
						"gtk",
						"ico",
						"cmap",
						"ismap",
						"imap",
						"cmapx",
						"imap_np",
						"cmapx_np",
						"jpg",
						"jpeg",
						"jpe",
						"jp2",
						"json",
						"json0",
						"dot_json",
						"xdot_json",
						"pdf",
						"pic",
						"pct",
						"pict",
						"plain",
						"plain-ext",
						"png",
						"pov",
						"ps",
						"ps2",
						"psd",
						"sgi",
						"svg",
						"svgz",
						"tga",
						"tiff",
						"tif",
						"tk",
						"vml",
						"vmlz",
						"wbmp",
						"webp",
						"xlib",
						"x11",
					},
				},
			},
			server = {
				on_attach = function(client, bufnr)
					if client.server_capabilities.inlayHintProvider then
						client.server_capabilities.inlayHintProvider = false
					end

					local opts = { noremap = true, silent = true, buffer = bufnr }
					opts.desc = "Show LSP references"
					vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)

					opts.desc = "Go to declaration"
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

					opts.desc = "Show LSP definitions"
					vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)

					opts.desc = "Show LSP implementations"
					vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)

					opts.desc = "Show LSP type definitions"
					vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", opts)

					opts.desc = "See available code actions"
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

					opts.desc = "Smart rename"
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

					opts.desc = "Show buffer diagnostics"
					vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

					opts.desc = "Show line diagnostics"
					vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

					opts.desc = "Go to previous diagnostic"
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

					opts.desc = "Go to next diagnostic"
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

					opts.desc = "Show documentation for what is under cursor"
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

					opts.desc = "Restart LSP"
					vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

					opts.desc = "Rust: Code Action Group"
					vim.keymap.set("n", "<leader>cA", function()
						vim.cmd.RustLsp("codeAction")
					end, opts)

					opts.desc = "Rust: Explain Error"
					vim.keymap.set("n", "<leader>re", function()
						vim.cmd.RustLsp("explainError")
					end, opts)

					opts.desc = "Rust: Render Diagnostic"
					vim.keymap.set("n", "<leader>rd", function()
						vim.cmd.RustLsp("renderDiagnostic")
					end, opts)

					opts.desc = "Rust: Cargo Run"
					vim.keymap.set("n", "<leader>rr", function()
						vim.cmd.RustLsp("run")
					end, opts)

					opts.desc = "Rust: Cargo Debug"
					vim.keymap.set("n", "<leader>rb", function()
						vim.cmd.RustLsp("debug")
					end, opts)

					opts.desc = "Rust: Cargo Test"
					vim.keymap.set("n", "<leader>rt", function()
						vim.cmd.RustLsp("testables")
					end, opts)

					opts.desc = "Rust: Cargo Runnables"
					vim.keymap.set("n", "<leader>rR", function()
						vim.cmd.RustLsp("runnables")
					end, opts)

					opts.desc = "Rust: Expand Macro"
					vim.keymap.set("n", "<leader>rm", function()
						vim.cmd.RustLsp("expandMacro")
					end, opts)

					opts.desc = "Rust: Rebuild Proc Macros"
					vim.keymap.set("n", "<leader>rp", function()
						vim.cmd.RustLsp("rebuildProcMacros")
					end, opts)

					opts.desc = "Rust: Move Item Up"
					vim.keymap.set("n", "<leader>rmu", function()
						vim.cmd.RustLsp({ "moveItem", "up" })
					end, opts)

					opts.desc = "Rust: Move Item Down"
					vim.keymap.set("n", "<leader>rmd", function()
						vim.cmd.RustLsp({ "moveItem", "down" })
					end, opts)

					opts.desc = "Rust: Structural Search Replace"
					vim.keymap.set("n", "<leader>rsr", function()
						vim.cmd.RustLsp("ssr")
					end, opts)

					opts.desc = "Rust: View Crate Graph"
					vim.keymap.set("n", "<leader>rcg", function()
						vim.cmd.RustLsp("crateGraph")
					end, opts)

					opts.desc = "Rust: Reload Workspace"
					vim.keymap.set("n", "<leader>rw", function()
						vim.cmd.RustLsp("reloadWorkspace")
					end, opts)

					opts.desc = "Rust: Join Lines"
					vim.keymap.set("n", "J", function()
						vim.cmd.RustLsp("joinLines")
					end, opts)

					opts.desc = "Rust: Go to Parent Module"
					vim.keymap.set("n", "<leader>rP", function()
						vim.cmd.RustLsp("parentModule")
					end, opts)

					opts.desc = "Rust: Open External Docs"
					vim.keymap.set("n", "<leader>rD", function()
						vim.cmd.RustLsp("externalDocs")
					end, opts)

					opts.desc = "Rust: Workspace Symbol"
					vim.keymap.set("n", "<leader>rws", function()
						vim.cmd.RustLsp("workspaceSymbol")
					end, opts)

					opts.desc = "Rust: Related Diagnostics"
					vim.keymap.set("n", "<leader>rdr", function()
						vim.cmd.RustLsp("relatedDiagnostics")
					end, opts)

					opts.desc = "Rust: Toggle Inlay Hints"
					vim.keymap.set("n", "<leader>uh", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end, opts)

					opts.desc = "Rust: View Syntax Tree"
					vim.keymap.set("n", "<leader>rst", function()
						vim.cmd.RustLsp("syntaxTree")
					end, opts)

					opts.desc = "Rust: View HIR"
					vim.keymap.set("n", "<leader>rhir", function()
						vim.cmd.RustLsp("view", "hir")
					end, opts)

					opts.desc = "Rust: View MIR"
					vim.keymap.set("n", "<leader>rmir", function()
						vim.cmd.RustLsp("view", "mir")
					end, opts)
				end,
				default_settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
							loadOutDirsFromCheck = true,
							buildScripts = {
								enable = true,
							},
						},
						checkOnSave = true,
						check = {
							allFeatures = true,
							command = "clippy",
							extraArgs = { "--no-deps" },
						},
						procMacro = {
							enable = true,
							ignored = {
								["async-trait"] = { "async_trait" },
								["napi-derive"] = { "napi" },
								["async-recursion"] = { "async_recursion" },
							},
						},
						inlayHints = {
							bindingModeHints = {
								enable = false,
							},
							chainingHints = {
								enable = true,
							},
							closingBraceHints = {
								enable = true,
								minLines = 25,
							},
							closureReturnTypeHints = {
								enable = "never",
							},
							lifetimeElisionHints = {
								enable = "never",
								useParameterNames = false,
							},
							maxLength = 25,
							parameterHints = {
								enable = true,
							},
							reborrowHints = {
								enable = "never",
							},
							renderColons = true,
							typeHints = {
								enable = true,
								hideClosureInitialization = false,
								hideNamedConstructor = false,
							},
						},
						lens = {
							enable = true,
							debug = {
								enable = true,
							},
							implementations = {
								enable = true,
							},
							run = {
								enable = true,
							},
							methodReferences = {
								enable = true,
							},
							references = {
								adt = {
									enable = true,
								},
								enumVariant = {
									enable = true,
								},
								method = {
									enable = true,
								},
								trait = {
									enable = true,
								},
							},
						},
						completion = {
							callable = {
								snippets = "fill_arguments",
							},
							postfix = {
								enable = false,
							},
							privateEditable = {
								enable = false,
							},
							fullFunctionSignatures = {
								enable = false,
							},
						},
						diagnostics = {
							enable = true,
							experimental = {
								enable = true,
							},
						},
						hover = {
							actions = {
								enable = true,
								implementations = {
									enable = true,
								},
								references = {
									enable = true,
								},
								run = {
									enable = true,
								},
								debug = {
									enable = true,
								},
							},
							documentation = {
								enable = true,
							},
							links = {
								enable = true,
							},
						},
						workspace = {
							symbol = {
								search = {
									scope = "workspace_and_dependencies",
								},
							},
						},
						semanticTokens = {
							enable = true,
						},
						-- Typing
						typing = {
							autoClosingAngleBrackets = {
								enable = false,
							},
						},
					},
				},
			},
			dap = {
				adapter = {
					type = "executable",
					command = "lldb-vscode",
					name = "rt_lldb",
				},
			},
		}

		local rust_group = vim.api.nvim_create_augroup("RustaceanVim", { clear = true })

		vim.api.nvim_create_autocmd("BufWritePre", {
			group = rust_group,
			pattern = "*.rs",
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})

		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			group = rust_group,
			pattern = "*.rs",
			callback = function()
				if vim.lsp.inlay_hint.is_enabled() then
					vim.lsp.inlay_hint.enable(true)
				end
			end,
		})

		vim.api.nvim_create_user_command("RustCargoReload", function()
			vim.cmd.RustLsp("reloadWorkspace")
		end, { desc = "Reload Rust workspace" })

		vim.api.nvim_create_user_command("RustViewHir", function()
			vim.cmd.RustLsp("view", "hir")
		end, { desc = "View HIR" })

		vim.api.nvim_create_user_command("RustViewMir", function()
			vim.cmd.RustLsp("view", "mir")
		end, { desc = "View MIR" })

		vim.api.nvim_create_user_command("RustToggleInlayHints", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, { desc = "Toggle Rust inlay hints" })
	end,
}
