return {
    {
        "preservim/nerdtree",
        config = function()
            vim.keymap.set({ 'n', 'i', 't' }, "<M-t>", function()
                vim.cmd "NERDTreeToggle"
            end)
        end
    },
}
