-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")


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
    if vim.o.background == "dark" then
      -- ==================== 深色（夜间）模式配置 ====================
      -- 适合暗色背景的高亮设置（请根据你的深色主题微调十六进制颜色）
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2E3440", bold = true })
      vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#2E3440", bold = true })

      vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#243E2B" })     -- 新增：暗绿
      vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#441D22" })  -- 删除：暗红
      vim.api.nvim_set_hl(0, "DiffChange", { bg = "#3D351A" })  -- 修改：暗黄
      vim.api.nvim_set_hl(0, "DiffText", { bg = "#5B4A1D" })    -- 修改细节：亮黄/棕

      vim.api.nvim_set_hl(0, "DiffviewDiffAddAsDelete", { bg = "#441D22" })
    else
      -- ==================== 浅色（白天）模式配置 ====================
      -- 保留你原本的全部配置
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "#EBF3F9", bold = true })
      vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#EBF3F9", bold = true })

      vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#dafbe1" })     -- 新增：浅绿
      vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#ffebe9" })  -- 删除：浅红
      vim.api.nvim_set_hl(0, "DiffChange", { bg = "#fff8c5" })  -- 修改：浅黄
      vim.api.nvim_set_hl(0, "DiffText", { bg = "#ffeb66" })    -- 修改细节：深黄

      vim.api.nvim_set_hl(0, "DiffviewDiffAddAsDelete", { bg = "#ffebe9" })
    end
  end,
})

vim.cmd([[doautocmd ColorScheme]])

