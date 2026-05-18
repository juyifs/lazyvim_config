-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- 将当前行背景色链接到选中（Visual）高亮组
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#EBF3F9", bold = true })

-- 如果你希望行号部分的当前行颜色也同步改变，可以同时链接 CursorLineNr
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#EBF3F9", bold = true })

-- 链接到标准浮动窗口边框（推荐，最为和谐）
vim.api.nvim_set_hl(0, "SnacksPickerBorder", { link = "FloatBorder" })
-- 如果阁下希望输入框、列表框、预览框的分割线颜色完全一致：
vim.api.nvim_set_hl(0, "SnacksPickerInputBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "SnacksPickerListBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "SnacksPickerPreviewBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "WinSeparator", { link = "FloatBorder" })

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- 浅色模式专用的高亮设置（高亮度、低饱和度背景，确保文字清晰）
    vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#dafbe1" })     -- 新增：浅绿
    vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#ffebe9" })  -- 删除：浅红
    vim.api.nvim_set_hl(0, "DiffChange", { bg = "#fff8c5" })  -- 修改：浅黄
    vim.api.nvim_set_hl(0, "DiffText", { bg = "#ffeb66" })    -- 修改细节：深黄
    
    -- 同步调整 diffview 特有高亮
    vim.api.nvim_set_hl(0, "DiffviewDiffAddAsDelete", { bg = "#ffebe9" })
  end,
})

vim.cmd([[doautocmd ColorScheme]])

