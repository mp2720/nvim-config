return {
    {
        "preservim/nerdtree",
        config = function()
            vim.keymap.set({ 'n', 'i', 't' }, "<M-t>", function()
                vim.cmd "NERDTreeFocus"
            end)
            vim.keymap.set({ 'n', 'i', 't' }, "<M-y>", function()
                vim.cmd "NERDTreeClose"
            end)
            vim.cmd [[
                " enable line numbers
                let NERDTreeShowLineNumbers=1
                " make sure relative line numbers are used
                autocmd FileType nerdtree setlocal relativenumber
            ]]
        end
    },
}
