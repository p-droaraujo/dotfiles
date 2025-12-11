return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local lualine = require("lualine")

		-- Set up highlight groups immediately
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })

		local colors = {
			bg = "NONE",
			fg = "#B4B6BE"
		}

		local theme = {
			inactive = {
				a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg },
				c = { fg = colors.fg, bg = colors.bg },
			},
			visual = {
				a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg },
				c = { fg = colors.fg, bg = colors.bg },
			},
			replace = {
				a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg },
				c = { fg = colors.fg, bg = colors.bg },
			},
			normal = {
				a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg },
				c = { fg = colors.fg, bg = colors.bg },
			},
			insert = {
				a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg },
				c = { fg = colors.fg, bg = colors.bg },
			},
			command = {
				a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg },
				c = { fg = colors.fg, bg = colors.bg },
			},
		}

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = theme,
				icons_enabled = true,
				globalstatus = true,
				component_separators = "",
				section_separators = "",
			},
			sections = {
				lualine_a = {},
				lualine_b = { "branch" },
				lualine_c = {
					"diff",
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
				},
				lualine_x = { "copilot" },
				lualine_y = { "filename" },
				lualine_z = { "filetype" },
			},
		})
	end,
}
