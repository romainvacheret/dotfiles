vim.opt.number = true
vim.opt.relativenumber = true

-- Search 
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Misc
vim.opt.hidden = true
vim.opt.timeoutlen = 500
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '80'
vim.opt.termguicolors = true
vim.opt.updatetime = 50

-- Identing
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})


-- Shown hidden characters
vim.opt.list = true
vim.opt.listchars = {
    space = '⋅',
    eol = '↴',
}

