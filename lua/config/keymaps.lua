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

-- 模式：n (普通模式) 翻译光标下的词；v (可视模式) 翻译选中的文本
map({ "n", "v" }, "<leader>ct", "<cmd>Translate zh-CN<CR>", { silent = true })

-- 映射 ma 为添加备注
map('n', '<leader>ma', '<cmd>BookmarkAnnotate<CR>', { noremap = true, silent = true })
-- 映射 ml 为打开备注列表
map('n', '<leader>ml', function()
    vim.cmd("BookmarkShowAll")
    vim.cmd("cclose")
    Snacks.picker.qflist()
end, { desc = "书签备注列表" })

-- DiffView
map('n', '<leader>gd','<cmd>DiffviewOpen --imply-local<CR>',{desc = "当前目录Diff", silent = true, noremap = true})
map('n', '<leader>gf','<cmd>DiffviewFileHistory % --imply-local<CR>',{desc = "当前文件历史", silent = true, noremap = true})
map('n', '<leader>gF','<cmd>DiffviewFileHistory --imply-local<CR>',{desc = "当前目录历史", silent = true, noremap = true})
map('v', '<leader>gl',':DiffviewFileHistory --imply-local<CR>',{desc = "选中行历史", silent = true, noremap = true})
