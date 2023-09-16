vim.cmd [[packadd packer.nvim]]

-- https://github.com/wbthomason/packer.nvim
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Fuzzy finder
    use  { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
    use { 
        'nvim-telescope/telescope-fzf-native.nvim', 
        run = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end
    }

    -- Git
    use { 
        'lewis6991/gitsigns.nvim', 
        requires = { {'nvim-lua/plenary.nvim'} } 
    }
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'

    -- LSP & Auto complete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    use { 
        'nvim-treesitter/nvim-treesitter',
        requires = { 'nvim-treesitter/nvim-treesitter-textobjects' },
        run = function ()
            require('nvim-treesitter.install').update({ with_sync = true })()
        end
    }
    use { 'nvim-treesitter/nvim-treesitter-context' }

    use {
        'neovim/nvim-lspconfig',
        requires = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'j-hui/fidget.nvim'},
        }
    }
    
    -- Color scheme
    use 'KeitaNakamura/neodark.vim'
    use 'morhetz/gruvbox'

    -- Misc
    use 'numToStr/Comment.nvim'

    use 'lukas-reineke/indent-blankline.nvim'

    use 'nvim-lualine/lualine.nvim'
    use 'voldikss/vim-floaterm'

    use 'christoomey/vim-tmux-navigator'

    use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

    use 'lervag/vimtex'
    use 'chrisbra/csv.vim'

    use { 
        'folke/todo-comments.nvim', 
        requires = { {'nvim-lua/plenary.nvim'} } 
    }

    if is_bootstrap then
        require('packer').sync()
    end

end)
