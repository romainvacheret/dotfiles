return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'j-hui/fidget.nvim',
        'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup(
                'romain-lsp-attach',
                { clear = true }
            ),

            callback = function(event)
                local map = function(keys, func, desc, mode)
                    vim.keymap.set(mode or 'n', keys, func, {
                        buffer = event.buf,
                        desc = desc
                    })
                end

                local builtin = require('telescope.builtin')

                map('K', vim.lsp.buf.hover, 'Hover')
                map('gd', builtin.lsp_definitions, '[G]o to [D]efinition')
                map('gr', builtin.lsp_references, '[G]o to [R]eference')
                map('gi', builtin.lsp_implementations, '[G]o to [I]mplementation]')
                map('gD', builtin.lsp_type_definitions, '[G]o to Type [Definition]')
                map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
                map('<leader>r', vim.lsp.buf.rename, '[R]ename')
                map('<leader>dj', function()
                    vim.diagnostic.jump({ count = 1, float = true })
                end, 'Next [D]iagnostic')
                map('<leader>dk', function()
                    vim.diagnostic.jump({ count = -1, float = true })
                end, 'Previous [D]iagnostic')
                map('<leader>dd', vim.diagnostic.open_float, 'Previous [D]iagnostic')
                map('<leader>do', vim.diagnostic.setloclist, '[D]iagnostic [O]pen quickfix list')

            end
        })

        local cmp = require('cmp')
        local cmp_lsp = require('cmp_nvim_lsp')
        -- TODO: Could be moved without issue I guess - single usage now
        -- local capabilities = vim.tbl_deep_extend(
        --     'force',
        --     {},
        --     -- TODO: Could use Blink instead
        --     vim.lsp.protocol.make_client_capabilities(),
        --     cmp_lsp.default_capabilities())

        require('fidget').setup({})
        require('mason').setup()

        vim.lsp.config("*", {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    format = {
                        enable = true,
                        defaultConfig = {
                            indent_style = "space",
                            indent_size = "2",
                        },
                    },
                },
            },
        })

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "gopls",
                "texlab",
                "ts_ls",
                "rust_analyzer",
                "marksman",
                "clangd",
            },
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- additional mapping
                ['<C-e>'] = cmp.mapping.abort(),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                    { name = 'path' },
                    { name = 'buffer' },
                })
        })

        vim.diagnostic.config({
            float = {
                focusable = false,
                style = 'minimal',
                border = 'rounded',
                source = 'always',
                header = '',
                prefix = '',
            },
        })

        vim.keymap.set('n', '<leader>dt', function()
              local new_config = not vim.diagnostic.config().virtual_lines
              vim.diagnostic.config({ virtual_lines = new_config })
        end, { desc = 'Toggle diagnostic virtual_lines' })
    end
}
