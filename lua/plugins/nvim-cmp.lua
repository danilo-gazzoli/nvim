return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',    -- Integração com LSP
        'hrsh7th/cmp-buffer',      -- Completador para buffer atual
        'hrsh7th/cmp-path',        -- Completador para caminhos
        'hrsh7th/cmp-cmdline',     -- Completador para linha de comando
        'L3MON4D3/LuaSnip',        -- Snippets engine
        'saadparwaiz1/cmp_luasnip' -- Integração com LuaSnip
    },
    config = function()
        local cmp = require('cmp')
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Aceita automaticamente a sugestão selecionada
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
            }),
        })
    end,
}
