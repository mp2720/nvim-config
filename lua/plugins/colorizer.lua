return {
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require 'colorizer'.setup({}, {
                RGB      = true,
                RRGGBB   = true,
                names    = false,
                RRGGBBAA = true,
                rgb_fn   = false,
                hsl_fn   = false,
                css      = false,
                css_fn   = false,
                mode     = 'background'
            })

            vim.keymap.set(
                { 'n', 'i', 't' },
                '<M-l>',
                function()
                    vim.cmd [[:ColorizerToggle]]
                end
            )
        end
    }
}
