-- ~/.config/nvim/lua/plugins/lsp/nvimtree.lua
return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			actions = {
				open_file = {
					quit_on_open = false, -- Keep nvim-tree open after selecting a file
				},
			},
			view = {
				width = 30, -- Uncommented and set for consistency
			},
			renderer = {
				highlight_opened_files = "none", -- Prevents extra highlighting on opened files
			},
			-- Customize window highlights based on focus
			hijack_cursor = true, -- Keeps cursor in nvim-tree for better highlight control
			diagnostics = {
				enable = true, -- Optional: Shows diagnostics if you use LSP
			},
			-- Window highlight settings
			-- Note: 'winhighlight' is not directly a top-level option in nvim-tree; we'll use autocommands instead
			git = {
				enable = true,
				ignore = false,
				timeout = 500,
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle nvim-tree" })
		vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", { desc = "Refresh nvim-tree" })
		vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>", { desc = "Find file in nvim-tree" })

		-- Autocommands to manage CursorLine highlight based on window focus
		vim.api.nvim_create_autocmd("WinEnter", {
			pattern = "NvimTree_*",
			callback = function()
				vim.wo.cursorline = true -- Enable cursorline when entering nvim-tree
				vim.api.nvim_win_set_option(0, "winhighlight", "Normal:Normal,CursorLine:CursorLine")
			end,
		})

		vim.api.nvim_create_autocmd("WinLeave", {
			pattern = "NvimTree_*",
			callback = function()
				vim.wo.cursorline = false -- Disable cursorline when leaving nvim-tree
				vim.api.nvim_win_set_option(0, "winhighlight", "Normal:NormalNC,CursorLine:None")
			end,
		})
	end,
}
