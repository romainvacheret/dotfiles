require('romain.settings')
require('romain.remap')
require('romain.lazy')

-- Theme
vim.cmd.colorscheme('gruvbox')
if vim.g.colors_name == 'gruvbox' then
    vim.api.nvim_set_hl(0, '@variable', { link = 'gruvboxblue' })
    vim.api.nvim_set_hl(0, '@module.python', { link = 'gruvboxblue' })
end

