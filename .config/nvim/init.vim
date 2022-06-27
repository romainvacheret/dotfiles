syntax on
set relativenumber
set nu
set nohlsearch
set hidden
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set exrc 
set tabstop=4
set shiftwidth=4
set noexpandtab
set timeoutlen=500

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
" Fuzzy finder
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" LSP & Auto complete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'neovim/nvim-lspconfig'

" Color scheme
Plug 'KeitaNakamura/neodark.vim'

" Misc
Plug 'numToStr/Comment.nvim'

" Dependencies
Plug 'nvim-lua/plenary.nvim'
call plug#end()

colorscheme neodark

let mapleader = " " 
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<CR>

vnoremap < <gv
vnoremap > >gv

inoremap jk <Esc>

lua require("romain")
