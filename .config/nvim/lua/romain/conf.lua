require('Comment').setup()

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
