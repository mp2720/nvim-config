return {
    {
        "mhinz/vim-startify",
        config = function()
            vim.cmd [[
                let g:startify_lists = [
                      \ { 'type': 'sessions',  'header': ['   Sessions']       },
                      \ { 'type': 'commands',  'header': ['   Commands']       },
                      \ ]
                let g:startify_custom_header = '']]
        end
    }
}
