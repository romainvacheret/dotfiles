local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach_func = function(client, bufnr) 
	local opts = { noremap = true, silent = true }
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0})
	vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references)
	vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer=0})
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer=0})
	vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {buffer=0})
	vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, {buffer=0})
	vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, {buffer=0})
	vim.keymap.set('n', "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
	buf_set_keymap('n', '<leader>df', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
end

pcall(require('telescope').load_extension, 'fzf')

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

-- Hide default lsp text, would be a duplicate of lsp_lines
vim.diagnostic.config({
  virtual_text = false,
})
require('lsp_lines').setup()

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
}
