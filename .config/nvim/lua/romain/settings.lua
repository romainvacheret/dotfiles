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

vim.g.mapleader = ' '

-- Identing
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Shown hidden characters
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

-- Color scheme
-- vim.cmd('colorscheme neodark')
require("gruvbox").setup({
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = false,
    bold = true,
    italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
})
vim.cmd('colorscheme gruvbox')
vim.api.nvim_set_hl(0, '@variable', { link = 'GruvboxBlue' })
vim.api.nvim_set_hl(0, '@module.python', { link = 'GruvboxBlue' })
