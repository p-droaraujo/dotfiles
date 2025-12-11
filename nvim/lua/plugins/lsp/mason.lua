-- mason installs language server and lsp functionality
return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				border = "single",
				size = { width = 0.8, height = 0.8 },
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"astro",
				"bashls",
				"clangd",
				"cssls",
				"eslint",
				"html",
				"jsonls",
				"lua_ls",
				"pyright",
				"pylsp",
				"yamlls",
			},
			automatic_installation = true,
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						root_dir = require("lspconfig.util").root_pattern(".git", "init.lua") or vim.loop.cwd(), -- Set a root
						settings = {
							Lua = {
								runtime = {
									version = "LuaJIT", -- Keep this for Neovim
								},
								diagnostics = {
									globals = { "vim" }, -- Avoid false positives
									delay = 100, -- Faster updates (ms)
								},
								workspace = {
									checkThirdParty = false, -- Skip slow third-party checks
									maxPreload = 500, -- Reduce preloaded files
									preloadFileSize = 100, -- Limit file size (KB)
									library = { -- Limit library paths
										vim.fn.stdpath("config") .. "/lua", -- Your config
										vim.fn.stdpath("data") .. "/lazy/neodev.nvim/types/stable", -- Neovim types
									},
								},
								telemetry = { enable = false }, -- Disable telemetry
							},
						},
					})
				end,
				["pyright"] = function()
					require("lspconfig").pyright.setup({
						settings = {
							python = {
								analysis = {
									autoSearchPaths = true,
									useLibraryCodeForTypes = true,
									diagnosticMode = "openFilesOnly",
								},
							},
						},
					})
				end,
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- Non-LSP tools (formatters, linters, etc.) from your list
				"black", -- Python formatter
				"clang-format", -- C/C++ formatter
				"eslint_d", -- ESLint daemon (faster linting)
				"isort", -- Python import sorter
				"markdownlint", -- Markdown linter
				"prettier", -- Multi-language formatter
				"pylint", -- Python linter
				"stylua", -- Lua formatter
			},
		})
	end,
}
