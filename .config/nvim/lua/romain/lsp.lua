local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach_func = function(client, bufnr) 
    local opts = { noremap = true, silent = true }
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer=0 })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer=0 })
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer=0 })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer=0 })
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { buffer=0 })
    vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, { buffer=0 })
    vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, { buffer=0 })
    vim.keymap.set('n', '<leader>dl', require('telescope.builtin').diagnostics, { buffer=0 })
    buf_set_keymap('n', '<leader>df', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
end

pcall(require('telescope').load_extension, 'fzf')

local lsp_servers = { 'clangd', 'rust_analyzer', 'pyright', 'gopls' }

require('nvim-lsp-installer').setup {
    ensure_installed = lsp_servers,
}

for _, lsp_server  in ipairs(lsp_servers) do
    require('lspconfig')[lsp_server].setup {
        on_attach = on_attach_func,
        capabilities = capabilities,
    }
end

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Setup nvim-cmp.
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
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

-- Hide default lsp text, would be a duplicate of lsp_lines
vim.diagnostic.config({
    virtual_text = false,
})
require('lsp_lines').setup()

require('nvim-treesitter.configs').setup {
    ensure_installed = { 'lua', 'c', 'rust', 'go', 'python' },
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = { enable = true },
}
