require('Comment').setup()
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
}

require('lualine').setup {
    options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
    },
}

vim.o.updatetime = 250
