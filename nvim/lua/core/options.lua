vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt

-- Disable netrw to prevent it from loading on directory entry
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set global border style for floating windows
-- vim.o.winborder = "single" -- This is not a valid option

-- transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
-- NvimTree
vim.opt.fillchars = { vert = " " }

-- opt.fillchars = { eob = " " } -- substitute ~ on empty lines with blank space
opt.relativenumber = true
opt.number = true -- show current line number
vim.opt.foldcolumn = "1"

-- tabs & indentation
opt.tabstop = 4 -- 2 spaces for tabs is prettier default
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- text wrap
opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
