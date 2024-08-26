return { {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        local highlight = {
            "IndentBlanklineIndent1",
        }
        local hooks = require "ibl.hooks"
        hooks.register(hooks.type.SCOPE_ACTIVE, function()
            return false
        end)

        require("ibl").setup { indent = { highlight = highlight } }
    end
} }
