return {
    "nvim-treesitter/nvim-treesitter",
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
        ensure_installed = {
            'lua',
            'ruby',
            'python',
            'vimdoc',
            'vim',
            'dockerfile',
            'json',
            'gitignore',
            'bash',
            'javascript',
            'html',
            'css',
            'sql',
        },
        auto_install = true,
        highlight = {
            enable = true,
        },
        indent = { enable = true },
      }
}
