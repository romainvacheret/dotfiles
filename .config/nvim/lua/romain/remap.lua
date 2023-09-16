vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set("i", "jk", "<esc>", {noremap = true})
vim.keymap.set('v', '<', '<gv', { noremap = true })
vim.keymap.set('v', '>', '>gv', { noremap = true })
vim.keymap.set('v', '<leader>a', '>gv', { noremap = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true})
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true})

-- Term
vim.keymap.set('n', '<leader>t', '<cmd>FloatermToggle<cr>')
vim.keymap.set('n', '<leader>ft', '<cmd>FloatermNew<cr>')
vim.keymap.set('n', '<leader>pt', '<cmd>FloatermNew python3<cr>')
vim.keymap.set('t', '<F12>', '<cmd>FloatermToggle<cr>')
vim.keymap.set('t', '<c-x>', '<cmd>FloatermToggle<cr>')
vim.keymap.set('t', '<c-j>', '<cmd>FloatermPrev<cr>')
vim.keymap.set('t', '<c-j>', '<cmd>FloatermPrev<cr>')

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
