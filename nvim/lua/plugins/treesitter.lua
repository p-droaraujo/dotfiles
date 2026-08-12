-- nvim-treesitter "main" branch (required for Neovim 0.12+)
-- Old API: require("nvim-treesitter.configs").setup({ ensure_installed = ... })
-- New API: require("nvim-treesitter").install({ ... }) + vim.treesitter.start()

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false, -- plugin does not support lazy-loading
	build = ":TSUpdate",
	config = function()
		local ok, nvim_treesitter = pcall(require, "nvim-treesitter")
		if not ok then
			vim.notify("nvim-treesitter failed to load", vim.log.levels.ERROR)
			return
		end

		nvim_treesitter.setup({
			-- parsers install under stdpath("data")/site by default
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		-- Install parsers asynchronously (no-op if already present)
		nvim_treesitter.install({
			"json",
			"javascript",
			"typescript",
			"tsx",
			"yaml",
			"html",
			"css",
			"markdown",
			"markdown_inline",
			"bash",
			"lua",
			"vim",
			"vimdoc",
			"dockerfile",
			"gitignore",
			"c",
			"python",
		})

		-- Enable treesitter highlighting for every filetype that has a parser
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("NvimTreesitterHighlight", { clear = true }),
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
