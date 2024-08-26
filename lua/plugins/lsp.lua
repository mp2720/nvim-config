return {
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require 'lsp_signature'.setup {
                hint_prefix = '',
                handler_opts = {
                    border = "single"
                },
            }
        end
    },
    {
        "hrsh7th/vim-vsnip",
        dependencies = { "hrsh7th/vim-vsnip-integ" },
        config = function()
            vim.cmd [[
                " NOTE: You can use other key to expand snippet.

                " Expand
                " imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
                " smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

                " Expand or jump
                " imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
                " smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

                " Jump forward or backward
                imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
                smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
                imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
                smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

                " Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
                " See https://github.com/hrsh7th/vim-vsnip/pull/50
                " nmap        s   <Plug>(vsnip-select-text)
                " xmap        s   <Plug>(vsnip-select-text)
                " nmap        S   <Plug>(vsnip-cut-text)
                " xmap        S   <Plug>(vsnip-cut-text)

                " If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
                " let g:vsnip_filetypes = {}
                " let g:vsnip_filetypes.javascriptreact = ['javascript']
                " let g:vsnip_filetypes.typescriptreact = ['typescript']
            ]]
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/vim-vsnip"
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/nvim-cmp",
        },
        config = function()
            -- nvim.cmp setup
            local cmp = require "cmp";
            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    end
                    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    -- end,
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
                    -- { name = 'vsnip' }, -- For vsnip users.
                    -- { name = 'luasnip' }, -- For luasnip users.
                    -- { name = 'ultisnips' }, -- For ultisnips users.
                    -- { name = 'snippy' }, -- For snippy users.
                }, {
                    { name = 'buffer' },
                })
            })

            -- Set up lspconfig.
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = false
            vim.diagnostic.config({ update_in_insert = true })

            local lsp_conf = require 'lspconfig'
            lsp_conf.lua_ls.setup({
                capabilities = capabilities
            })
            lsp_conf.clangd.setup({
                cmd = {
                    "clangd",
                    "--header-insertion=never",
                    "-query-driver=/home/user/.arduino15/packages/**"
                },
                capabilities = capabilities,
            })
            lsp_conf.rust_analyzer.setup({
                capabilities = capabilities
            })
            lsp_conf.gopls.setup {
                capabilities = capabilities,
                cmd = { 'gopls' },
            }
            lsp_conf.pyright.setup {
                capabilities = capabilities
            }

            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
            vim.keymap.set('n', '<space>rr', vim.lsp.buf.references)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
            vim.keymap.set("n", "<space>a", vim.lsp.buf.code_action)
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    vim.keymap.set(
                        'n',
                        '<space>f',
                        function() vim.lsp.buf.format { async = true } end, opts
                    )
                end
            })
        end
    },
}
