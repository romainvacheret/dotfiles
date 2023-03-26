require('romain.packer')
require('romain.settings')
require('romain.conf')
require('romain.lsp')
require('romain.remap')

vim.cmd([[
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
