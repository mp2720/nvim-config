return { {
    'andythigpen/nvim-coverage',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local coverage = require('coverage')
        local colors = require('colors')
        coverage.setup({
            highlights = {
                -- customize highlight groups created by the plugin
                covered = { fg = "#66EE66", bg = colors.bg1 }, -- supports style, fg, bg, sp (see :h highlight-gui)
                uncovered = { fg = "#EE6666", bg = colors.bg1 },
                partial = { fg = "#6666FF", bg = colors.bg1 }
            },
            signs = {
                -- use your own highlight groups or text markers
                covered = { hl = "CoverageCovered", text = "█" },
                uncovered = { hl = "CoverageUncovered", text = "█" },
                partial = { hl = "CoveragePartial", text = "█" },
            },
        })

        local flag = true

        vim.keymap.set(
            { 'n', 'i', 't' },
            '<M-c>',
            function()
                -- vim.cmd [[:Gitsigns toggle_signs]]
                if flag then
                    coverage.load(true)
                else
                    coverage.hide()
                end

                flag = not flag

                -- coverage.toggle()
            end
        )
    end
} }
