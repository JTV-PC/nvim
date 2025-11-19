
require('config.keybinds')
require('config.lazy')

--Theme Settings
vim.cmd("colorscheme lunaperche")
vim.api.nvim_set_hl(0, "Normal", {bg = "none"})

--Basic editor behaviour Settings
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.cursorline=true
vim.opt.wrap=false
vim.opt.scrolloff=26
vim.opt.sidescrolloff=8

--

vim.opt.tabstop=2








































