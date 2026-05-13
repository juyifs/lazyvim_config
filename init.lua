-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- 将当前行背景色链接到选中（Visual）高亮组
vim.api.nvim_set_hl(0, "CursorLine", { link = "Visual", bold = true })

-- 如果你希望行号部分的当前行颜色也同步改变，可以同时链接 CursorLineNr
vim.api.nvim_set_hl(0, "CursorLineNr", { link = "Visual", bold = true })

