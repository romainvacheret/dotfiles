require('nvim-treesitter.configs').setup {
    ensure_installed = { 'lua', 'c', 'rust', 'go', 'python', 
        'javascript', 'typescript', 'ocaml' },
    sync_install = false,
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = { enable = true },
}
