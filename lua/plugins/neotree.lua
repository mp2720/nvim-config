return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        },
        config = function()
            vim.keymap.set({ 'n', 'i', 't' }, '<M-b>', "<ESC>:Neotree source=buffers float<CR>")
            vim.keymap.set({ 'n', 'i', 't' }, '<M-f>', "<ESC>:Neotree float<CR>")
        end
    },
}
