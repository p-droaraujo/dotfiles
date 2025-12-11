return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		config = function()
			require("CopilotChat").setup()
			local keymap = vim.keymap
			keymap.set("n", "<leader>co", ":CopilotChatOpen<CR>", { desc = "Open Copilot Chat" })
			keymap.set("n", "<leader>cc", ":CopilotChatClose<CR>", { desc = "Close Copilot Chat" })
			keymap.set("n", "<leader>ct", ":CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat Window" })
			keymap.set("n", "<leader>cr", ":CopilotChatReset<CR>", { desc = "Reset Copilot Chat" })
		end,
	},
}
--- Commands
--- Insert	Normal	Action
-- <Tab>	<Tab>	Trigger/accept completion menu for tokens
-- <C-c>	q	Close the chat window
-- <C-l>	<C-l>	Reset and clear the chat window
-- <C-s>	<CR>	Submit the current prompt
-- -	grr	Toggle sticky prompt for line under cursor
-- -	grx	Clear all sticky prompts in prompt
-- <C-y>	<C-y>	Accept nearest diff
-- -	gj	Jump to section of nearest diff
-- -	gqa	Add all answers from chat to quickfix list
-- -	gqd	Add all diffs from chat to quickfix list
-- -	gy	Yank nearest diff to register
-- -	gd	Show diff between source and nearest diff
-- -	gi	Show info about current chat
-- -	gc	Show current chat context
-- -	gh	Show help message
--
