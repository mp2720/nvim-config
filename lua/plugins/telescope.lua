return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            vim.keymap.set({ 'n', 'i', 't' }, '<M-g>', "<ESC>:Telescope find_files<CR>")
            vim.keymap.set({ 'n', 'i', 't' }, '<M-h>', "<ESC>:Telescope live_grep<CR>")
            vim.keymap.set({ 'n', 'i', 't' }, '<M-p>', require "telescope.builtin".resume)
        end
    }
}
