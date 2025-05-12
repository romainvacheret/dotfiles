return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font }
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]ile' })
        vim.keymap.set('n', '<leader>dl', builtin.diagnostics, { desc = '[D]iagnostics [L]ist' })
        vim.keymap.set('n', '<leader>sc', builtin.grep_string, { desc = '[S]earch [C]urrent Word' })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
        vim.keymap.set('n', '<leader>?', builtin.oldfiles, {})
        vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
        vim.keymap.set('n', '<leader><space>', builtin.buffers, {})

        -- Silence the specific position encoding message
        -- Versions above 0.1.8 should solve the issue
        local notify_original = vim.notify
        vim.notify = function(msg, ...)
            if
                msg
                and (
                msg:match 'position_encoding param is required'
                or msg:match 'Defaulting to position encoding of the first client'
                or msg:match 'multiple different client offset_encodings'
                or msg:match 'vim.lsp.util.jump_to_location is deprecated.'
            )
            then
                return
            end
            return notify_original(msg, ...)
        end
    end
}
