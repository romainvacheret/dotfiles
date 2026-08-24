return {
{
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',

    config = function()
        local ts = require('nvim-treesitter')

        local ensure_installed = {
            'bash',
            'c',
            'cpp',
            'go',
            'lua',
            'markdown',
            'markdown_inline',
            'python',
            'ruby',
            'rust',
            'typescript',
            'vim',
            'vimdoc',
        }

        ts.install(ensure_installed)

        vim.api.nvim_create_autocmd('FileType', {
            pattern = ensure_installed,
            callback = function()
                vim.treesitter.start()
                vim.bo.indentexpr =
                    "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        after = 'nvim-treesitter',
    }
}
