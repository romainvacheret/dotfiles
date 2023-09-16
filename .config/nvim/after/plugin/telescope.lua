local builtin = require('telescope.builtin')

-- Requirement for rep_string/live_grep: https://github.com/BurntSushi/ripgrep 
vim.keymap.set('n', '<leader><space>', builtin.buffers, {})
vim.keymap.set('n', '<leader>sc', builtin.grep_string, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>?', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
