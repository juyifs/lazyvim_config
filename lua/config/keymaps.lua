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
  "<leader>gP",
  "<cmd>DiffviewFileHistory % --imply-local<CR>",
  { desc = "当前文件历史", silent = true, noremap = true }
)
map(
  "n",
  "<leader>gp",
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
map("n", "gR", function()
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

local function get_location_uri_and_range(item)
  if item.uri and item.range then
    return item.uri, item.range
  end

  if item.targetUri then
    local range = item.targetSelectionRange or item.targetRange
    if range then
      return item.targetUri, range
    end
  end

  return nil, nil
end

local function is_current_location(uri, range, current_file, cursor_line)
  local file = vim.fs.normalize(vim.uri_to_fname(uri))
  if file ~= current_file then
    return false
  end

  if not range or not range.start then
    return false
  end

  local start_line = range.start.line + 1
  if start_line == cursor_line then
    return true
  end

  if not range["end"] then
    return false
  end

  local end_line = range["end"].line + 1
  return start_line <= cursor_line and end_line >= cursor_line
end

local function has_lsp_locations(results, include_current)
  local current_file = vim.fs.normalize(vim.api.nvim_buf_get_name(0))
  local cursor_line = vim.api.nvim_win_get_cursor(0)[1]

  for _, res in pairs(results or {}) do
    local result = res.result
    if result then
      local list = vim.tbl_islist(result) and result or { result }
      for _, item in ipairs(list) do
        local uri, range = get_location_uri_and_range(item)
        if uri then
          if include_current or not is_current_location(uri, range, current_file, cursor_line) then
            return true
          end
        else
          return true
        end
      end
    end
  end

  return false
end

local function goto_references_or_ctags()
  local clients = vim.lsp.get_clients({ bufnr = 0, method = "textDocument/references" })
  local position_encoding = (clients[1] and clients[1].offset_encoding) or "utf-16"
  local params = vim.lsp.util.make_position_params(0, position_encoding)
  params.context = { includeDeclaration = true }

  vim.lsp.buf_request_all(0, "textDocument/references", params, function(results)
    if has_lsp_locations(results) then
      Snacks.picker.lsp_references()
    else
      vim.cmd("Cs find s")
    end
  end)
end

map("n", "gr", goto_references_or_ctags, { desc = "LSP References / Gtags Fallback", silent = true, noremap = true })

local function goto_implementation_or_ctags()
  local clients = vim.lsp.get_clients({ bufnr = 0, method = "textDocument/implementation" })
  local position_encoding = (clients[1] and clients[1].offset_encoding) or "utf-16"
  local params = vim.lsp.util.make_position_params(0, position_encoding)

  vim.lsp.buf_request_all(0, "textDocument/implementation", params, function(results)
    if has_lsp_locations(results) then
      Snacks.picker.lsp_implementations()
    else
      vim.cmd("Cs find t")
    end
  end)
end

map("n", "gI", goto_implementation_or_ctags, { desc = "LSP Implementation / Gtags Fallback", silent = true, noremap = true })

local function goto_definition_or_ctags()
  local clients = vim.lsp.get_clients({ bufnr = 0, method = "textDocument/definition" })
  local position_encoding = (clients[1] and clients[1].offset_encoding) or "utf-16"
  local params = vim.lsp.util.make_position_params(0, position_encoding)

  vim.lsp.buf_request_all(0, "textDocument/definition", params, function(results)
    if has_lsp_locations(results) then
      Snacks.picker.lsp_definitions()
    else
      vim.cmd("Cs find g")
    end
  end)
end

map("n", "gd", goto_definition_or_ctags, { desc = "LSP Definition / Gtags Fallback", silent = true, noremap = true })

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
    "gd",
    icon = function()
      return get_lang_icon() -- 动态获取当前文件类型图标
    end, -- 针对单个快捷键
  },
  {
    "gI",
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
})
