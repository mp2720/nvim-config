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
        end
    },
}
