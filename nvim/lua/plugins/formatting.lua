return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier", "prettierd" },
				typescript = { "prettier", "prettierd" },
				javascriptreact = { "prettier", "prettierd" },
				typescriptreact = { "prettier", "prettierd" },
				css = { "prettier", "prettierd" },
				html = { "prettier", "prettierd" },
				json = { "prettier", "prettierd" },
				yaml = { "prettier", "prettierd" },
				graphql = { "prettier", "prettierd" },
				lua = { "stylua" },
				python = { "black" },
				c = { "clang_format" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
			formatters = {
				prettier = {
					prepend_args = {
						"--end-of-line",
						"lf",
						"--trailing-comma",
						"es5",
						"--print-width",
						"100",
					},
				},
				black = {
					prepend_args = { "--line-length", "88" },
				},
				clang_format = {
					prepend_args = { "-style={IndentWidth: 4, UseTab: Never}" },
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
