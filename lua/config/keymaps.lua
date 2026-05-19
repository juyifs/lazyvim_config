-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local wk = require("which-key")

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
map("n", "<leader>ma", "<cmd>BookmarkAnnotate<CR>", { noremap = true, silent = true })
-- 映射 ml 为打开备注列表
map("n", "<leader>ml", function()
  vim.cmd("BookmarkShowAll")
  vim.cmd("cclose")
  Snacks.picker.qflist()
end, { desc = "书签备注列表" })

-- DiffView
map(
  "n",
  "<leader>gc",
  "<cmd>DiffviewOpen HEAD --imply-local<CR>",
  { desc = "当前目录Diff", silent = true, noremap = true }
)
map(
  "n",
  "<leader>gp",
  "<cmd>DiffviewFileHistory % --imply-local<CR>",
  { desc = "当前文件历史", silent = true, noremap = true }
)
map(
  "n",
  "<leader>gP",
  "<cmd>DiffviewFileHistory --imply-local<CR>",
  { desc = "当前目录历史", silent = true, noremap = true }
)
-- map('v', '<leader>gl',':DiffviewFileHistory --imply-local<CR>',{desc = "选中行历史", silent = true, noremap = true})
map("v", "<leader>gl", function()
  Snacks.picker.git_log_line()
end, { desc = "选中行历史", silent = true, noremap = true })

vim.keymap.del('n', 'gra')
vim.keymap.del('n', 'grn')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'grt')
vim.keymap.del('n', 'grx')
map("n", "gr", function()
  require("telescope").extensions.hierarchy.incoming_calls({
    layout_strategy = "vertical", -- 可选 horizontal, vertical, center, cursor
    layout_config = {
      width = 0.9,
      height = 0.9,
      preview_height = 0.6, -- 增加代码预览窗口的高度比例
      vertical = {
        preview_cutoff = 0,
      },
    },
  })
end, { desc = "LSP Incoming Calls", silent = true, noremap = true })

map("n", "gR", function()
	Snacks.picker.lsp_references()
end, { desc = "LSP References", silent = true, noremap = true })

-- 在光标下的符号上按下快捷键：
-- <Leader>tc : 查找调用
map('n', '<Leader>tc', ':Cs find c<CR>', { desc = 'Gtags查找调用', silent = true, noremap = true })

-- <Leader>td : 查找定义
map('n', '<Leader>td', ':Cs find g<CR>', { desc = 'Gtags查找定义', silent = true, noremap = true })

-- <Leader>tr : 查找引用
map('n', '<Leader>tr', ':Cs find s<CR>', { desc = 'Gtags查找引用', silent = true, noremap = true })

-- <Leader>ti : 查找实例
map('n', '<Leader>ti', ':Cs find t<CR>', { desc = 'Gtags查找实例', silent = true, noremap = true })

-- <Leader>ts : 调用栈
map('n', '<Leader>ts', ':CsStackView open down<CR>', { desc = 'Gtags调用栈', silent = true, noremap = true })

-- 封装一个动态获取当前文件类型图标的函数
local function get_lang_icon()
  -- 获取当前缓冲区的 filetype
  local ft = vim.bo.filetype
  -- 如果你使用的是 mini.icons (LazyVim默认)
  local has_mini, mini = pcall(require, "mini.icons")
  if has_mini then
    local icon, hl, _ = mini.get("filetype", ft)
    return { icon = icon, hl = hl }
  end

  -- 尝试使用 nvim-web-devicons
  local has_devicons, devicons = pcall(require, "nvim-web-devicons")
  if has_devicons then
    local icon, color = devicons.get_icon_by_filetype(ft, { default = true })
    return { icon = icon, color = color } -- 返回文本图标和对应高亮色
  end

  -- 兜底默认图标
  return { icon = " ", color = "blue" }
end

wk.add({
  {
    "gr",
    icon = function()
      return get_lang_icon() -- 动态获取当前文件类型图标
    end, -- 针对单个快捷键
  },
  {
    "gR",
    icon = function()
      return get_lang_icon() -- 动态获取当前文件类型图标
    end, -- 针对单个快捷键
  },
  {
    "<leader>m",
    group = "BookMark",
    icon = { icon = "󰸕 ", color = "green" },
  },
  {
    "<leader>a",
    group = "Avante",
    icon = { icon = "󰁤 ", color = "orange" },
  },
  {
    "<leader>t",
    group = "Tags",
    icon = { icon = " ", color = "orange" },
  },
})
