return {
    {
        "zefei/vim-wintabs",
        config = function()
            vim.cmd [[
                map <C-J> <Plug>(wintabs_previous)
                map <C-K> <Plug>(wintabs_next)
                map <C-X> <Plug>(wintabs_close)
                map <C-L> <Plug>(wintabs_undo)
                " map <C-T>o <Plug>(wintabs_only)
                " map <C-W>c <Plug>(wintabs_close_window)
                " map <C-W>o <Plug>(wintabs_only_window)
                " command! Tabc WintabsCloseVimtab
                " command! Tabo WintabsOnlyVimtab]]
            vim.keymap.set({'n','i','t'}, "<C-w>ml", function()
                vim.cmd [[WintabsMoveToWindow l]]
            end)
            vim.keymap.set({'n','i','t'}, "<C-w>mh", function()
                vim.cmd [[WintabsMoveToWindow h]]
            end)
            vim.g.wintabs_autoclose = false
        end
    },
}
