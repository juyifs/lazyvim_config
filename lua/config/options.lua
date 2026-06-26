-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false
vim.opt.relativenumber = false
vim.o.background = "light"
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.softtabstop=4
vim.opt.autoindent = true
-- vim.opt.smartindent = true
vim.o.winborder = "rounded"
vim.o.tags = "./tags;,tags;"

vim.filetype.add({
  extension = {
    log = "log",
  },
})

vim.g.root_spec = { "cwd" }

vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}

vim.cmd('aunmenu PopUp')
vim.cmd('autocmd! nvim.popupmenu')

vim.opt.fixendofline = false  -- 关闭自动修复文件末尾换行符
vim.opt.endofline = false     -- 不在文件末尾强制添加换行符
