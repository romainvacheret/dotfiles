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
set timeoutlen=500

" Tabs 
set tabstop=4
set shiftwidth=4
set noexpandtab
autocmd FileType python setlocal noexpandtab


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
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

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
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'nvim-lualine/lualine.nvim'
Plug 'voldikss/vim-floaterm'
call plug#end()

colorscheme neodark

let mapleader = " " 

vnoremap < <gv
vnoremap > >gv

inoremap jk <Esc>
" tnoremap   <silent>   <C-:><C-n>:FloatermToggle<CR>   <C-\><C-n>:FloatermToggle<CR>

lua require("romain")
