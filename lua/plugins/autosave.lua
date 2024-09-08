return {
    {
        "pocco81/auto-save.nvim",
        config = function()
            local autosave = require 'auto-save'
            autosave.setup { enabled = true }
            vim.keymap.set({ 'n', 'i', 't' }, '<M-s>', autosave.toggle)
        end
    }
}
