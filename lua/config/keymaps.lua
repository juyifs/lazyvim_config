-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- copy/paste/cut/delete
map("", "<C-v>", '"+p')
map("", "<C-c>", '"+y')
map("", "<C-x>", '"+x')
map("i", "<C-v>", '<Esc>"+pa')
map("v", "d", '"_d', { noremap = true, silent = true })

-- create buffer for terminal
map("n", "<leader>bt", ":enew | term<CR>", { noremap = true, silent = true })

-- copy file path to clipboard
map("n", "<leader>cp", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
  print("Copied path: " .. vim.fn.expand("%:p"))
end, { noremap = true, silent = true, desc = "Copy File Path" })

-- navi: go back to previous location in jump list
map("n", "<C-q>", "<C-o>", { noremap = true, silent = true })

-- bookmark
map("", "<leader>mm", ":BookmarksMark<CR>", { desc = "Mark current line", silent = true })
map("", "<leader>mo", ":BookmarksGoto<CR>", { desc = "Go to BookmarkList", silent = true })
map("", "<leader>mt", ":BookmarksTree<CR>", { desc = "Go to BookmarksTree", silent = true })

-- 模式：n (普通模式) 翻译光标下的词；v (可视模式) 翻译选中的文本
map({ "n", "v" }, "<leader>ct", "<cmd>Translate zh-CN<CR>", { silent = true })
