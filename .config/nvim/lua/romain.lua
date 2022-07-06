local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach_func = function(client, bufnr) 
	local opts = { noremap = true, silent = true }
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0})
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer=0})
	vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer=0})
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer=0})
	vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {buffer=0})
	vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, {buffer=0})
	vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, {buffer=0})
	vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
	buf_set_keymap('n', '<leader>df', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)

end

-- Requirement for rep_string/live_grep: https://github.com/BurntSushi/ripgrep 
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>sc', require('telescope.builtin').grep_string, { desc = '[S]earch [C]urrent word' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc= '[F]ind [F]ile' })

-- TODO references
require 'lspconfig'.gopls.setup{
	capabilities = capabilites,
	on_attach = on_attach_func,
} 
require 'lspconfig'.pyright.setup{
	capabilities = capabilites,
	on_attach = on_attach_func,
}

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- Setup nvim-cmp.
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

require('gitsigns').setup {
  signs = {
	add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
}

require('Comment').setup()
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
}

pcall(require('telescope').load_extension, 'fzf')

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
}


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
