return {
    { 'christoomey/vim-tmux-navigator' },
    { 'folke/todo-comments.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, opts = {}},
    { 'chrisbra/csv.vim' },
    { 'lervag/vimtex' },
    {
        'jbyuki/venn.nvim',
        config = function ()
            local function toggle_venn()
                if not vim.b.venn_enabled then
                    vim.b.venn_enabled = true
                    vim.cmd[[setlocal ve=all]]
                    -- draw a line on HJKL keystokes
                    vim.keymap.set('n', 'J', '<C-v>j:VBox<CR>', { buffer = true })
                    vim.keymap.set('n', 'K', '<C-v>k:VBox<CR>', { buffer = true })
                    vim.keymap.set('n', 'L', '<C-v>l:VBox<CR>', { buffer = true })
                    vim.keymap.set('n', 'H', '<C-v>h:VBox<CR>', { buffer = true })
                    -- draw a box by pressing 'f' with visual selection
                    vim.api.vim.keymap.set('v', 'f', ':VBox<CR>', { buffer  = true })
                else
                    vim.cmd[[setlocal ve=]]
                    vim.keymap.del('n', 'J', { buffer = true })
                    vim.keymap.del('n', 'K', { buffer = true })
                    vim.keymap.del('n', 'L', { buffer = true })
                    vim.keymap.del('n', 'H', { buffer = true })
                    vim.keymap.del('v', 'f', { buffer = true })
                    vim.b.venn_enabled = nil
                end
            end
            -- toggle keymappings for venn using <leader>v
            vim.keymap.set('n', '<leader>ve', toggle_venn)
        end
    },
}
