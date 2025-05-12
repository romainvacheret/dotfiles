vim.g.mapleader = ' '

vim.keymap.set('i', 'jk', '<esc>', {noremap = true})

-- open netrw
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- stay in visual mode after indent while in visual mode
vim.keymap.set('v', '<', '<gv', { noremap = true })
vim.keymap.set('v', '>', '>gv', { noremap = true })

-- keep cusor in the middle while mid-page jumping 
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true})
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true})

-- move lines around when highlighted
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

-- doesn't move cursor after `J` in normal mode
vim.keymap.set('n', 'J', 'mzJ`z')

-- keep search term in the middle of the screen
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- keep pasted word in clipboard when pasting on other word
vim.keymap.set('x', '<leader>p', '"_dP')

-- copy to clipboard
vim.keymap.set('n', '<leader>p', '"+p ')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- Splits
vim.keymap.set('n', '<c-h>', '<c-w><c-h>')
vim.keymap.set('n', '<c-l>', '<c-w><c-l>')
vim.keymap.set('n', '<c-j>', '<c-w><c-j>')
vim.keymap.set('n', '<c-k>', '<c-w><c-k>')

-- Tabs 
vim.keymap.set('n', 'dn', '<cmd>tabnew<cr>')
vim.keymap.set('n', 'dj', '<cmd>tabnext<cr>')
vim.keymap.set('n', 'dk', '<cmd>tabprev<cr>')
vim.keymap.set('n', '<leader>&', '1gt')
vim.keymap.set('n', '<leader>é', '2gt')
vim.keymap.set('n', '<leader>"', '3gt')
vim.keymap.set('n', '<leader>\'', '4gt')
vim.keymap.set('n', '<leader>(', '5gt')
