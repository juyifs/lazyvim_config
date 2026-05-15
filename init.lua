-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- 将当前行背景色链接到选中（Visual）高亮组
vim.api.nvim_set_hl(0, "CursorLine", { link = "Visual", bold = true })

-- 如果你希望行号部分的当前行颜色也同步改变，可以同时链接 CursorLineNr
vim.api.nvim_set_hl(0, "CursorLineNr", { link = "Visual", bold = true })

-- 链接到标准浮动窗口边框（推荐，最为和谐）
vim.api.nvim_set_hl(0, "SnacksPickerBorder", { link = "FloatBorder" })
-- 如果阁下希望输入框、列表框、预览框的分割线颜色完全一致：
vim.api.nvim_set_hl(0, "SnacksPickerInputBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "SnacksPickerListBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "SnacksPickerPreviewBorder", { link = "FloatBorder" })

vim.api.nvim_set_hl(0, "WinSeparator", { link = FloatBorder })

