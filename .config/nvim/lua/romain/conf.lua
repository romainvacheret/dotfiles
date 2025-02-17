require('Comment').setup()

require("ibl").setup()
-- require("ibl").setup {
--     -- show_end_of_line = true,
--     -- space_char_blankline = " ",
-- }

require('lualine').setup {
    options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
    },
}
