vim.cmd [[
function! WNGetWinnum()
    return v:lua.require'winnums'.get_winnum(0)
endfunction]]

vim.g.lightline = {
    -- colorscheme = "powerlineish",
    component_function = {
        winnum = "WNGetWinnum",
    },
    separator = { left = "\u{E0B0}", right = "\u{E0B2}" },
    subseparator = { left = "\u{E0B1}", right = "\u{E0B3}" },
    inactive = {
        right = {
            { "winnum" }
        }
    },
    active = {
        left = {
            { "mode" },
            { "filename", "readonly" },
        },
        right = {
            { "winnum" },
            { 'lineinfo' }, { 'percent' },
            { 'lsp_info', 'lsp_hints', 'lsp_errors', 'lsp_warnings', 'lsp_ok' },
        }
    }
}
vim.cmd [[
let g:lightline.mode_map = {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'v' : 'V',
    \ 'V' : 'VL',
    \ "\<C-v>": 'VB',
    \ 'c' : 'C',
    \ 's' : 'S',
    \ 'S' : 'SL',
    \ "\<C-s>": 'SB',
    \ 't': 'T',
\ }]]
vim.cmd "call lightline#lsp#register()"
