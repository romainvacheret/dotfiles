vim.opt.relativenumber = true
vim.opt.nu = true

-- Search 
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Misc
vim.opt.hidden = true
vim.opt.exrc = true
vim.opt.timeoutlen = 500
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '80'
vim.opt.termguicolors = true
vim.o.updatetime = 50

-- Identing
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Shown hidden characters
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

