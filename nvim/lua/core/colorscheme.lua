-- ~/.config/nvim/lua/core/colorscheme.lua
local colors = {
	background = "none",
	foreground = "#E0F0FD",
	functions = "#35D7DC",
	keywords = "#23DAFB",
	strings = "#9AD9E4",
	numbers = "#068BB0",
	gray = "#A9B7C6",
}

-- Set fillchars immediately
vim.opt.fillchars = { vert = " " }

-- Immediate critical highlights (minimal set for instant UI)
vim.api.nvim_set_hl(0, "Normal", { bg = colors.background, fg = colors.foreground })
vim.api.nvim_set_hl(0, "NonText", { bg = colors.background, fg = colors.gray })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = colors.gray })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none", fg = colors.gray })

-- Function to apply the full colorscheme
local function apply_full()
	local highlights = {
		NormalFloat = { bg = colors.background, fg = colors.foreground },
		FloatBorder = { bg = colors.background, fg = colors.gray },
		Comment = { fg = colors.gray },
		Function = { fg = colors.functions },
		Identifier = { fg = colors.keywords },
		Keyword = { fg = colors.keywords },
		Operator = { fg = colors.keywords },
		String = { fg = colors.strings, italic = true },
		Number = { fg = colors.numbers, bold = true },
		Type = { fg = colors.keywords },
		Constant = { fg = colors.foreground },
		Statement = { fg = colors.keywords },
		PreProc = { fg = colors.keywords },
		Special = { fg = colors.keywords },
		CursorLine = { bg = "#2B3646" },
		StatusLine = { bg = "none", fg = colors.foreground },
		StatusLineNC = { bg = "none", fg = colors.gray },
		TabLine = { bg = "none", fg = colors.foreground },
		TabLineSel = { bg = colors.keywords, fg = colors.background },
		WinSeparator = { bg = "none", fg = "#454545" },
		NvimTreeFloatBorder = { bg = "none", fg = "#666666" },
		NvimTreeFloatTitle = { bg = "none", fg = "#ffffff" },
		NvimTreeTitleBar = { bg = "#2C2E34", fg = "#ffffff" },
		NvimTreeFloatNormalNC = { bg = "none", fg = "#aaaaaa" },
		NvimTreeFloatFooter = { bg = "none", fg = "#ffffff" },
		IBLscope = { bg = "none", fg = "#2C2E34" },
		IBLindent = { bg = "none", fg = "#1D212C" },
	}

	-- Batch apply all remaining highlights
	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

-- Defer full application
vim.defer_fn(apply_full, 50)

-- Return colors for init.lua
return colors
