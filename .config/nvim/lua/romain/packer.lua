vim.cmd [[packadd packer.nvim]]
-- local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
-- local is_bootstrap = false
-- if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
--     is_bootstrap = true
--     vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
--     vim.cmd [[packadd packer.nvim]]
-- end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use  { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Git
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'

    -- LSP & Auto complete
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    use 'neovim/nvim-lspconfig'

    -- Color scheme
    use 'KeitaNakamura/neodark.vim'

    -- Misc
    use 'numToStr/Comment.nvim'

    use 'lukas-reineke/indent-blankline.nvim'

    use 'nvim-lualine/lualine.nvim'
    use 'voldikss/vim-floaterm'


    use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

    if is_bootstrap then
        require('packer').sync()
    end

end)
