vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to below window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to above window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- buffer management
keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close current buffer" })
keymap.set("n", "<leader>bn", "<cmd>bn<CR>", { desc = "Go to next buffer" })
keymap.set("n", "<leader>bp", "<cmd>bp<CR>", { desc = "Go to previous buffer" })

-- line insertion
-- keymap.set("n", "<Enter>", "o<ESC>", { desc = "Insert line below" })

-- Mapeamentos para navegar diretamente para buffers 1 a 9
for i = 1, 9 do
	keymap.set("n", "<leader>b" .. i, "<cmd>buffer " .. i .. "<CR>", { desc = "Go to buffer " .. i })
end
