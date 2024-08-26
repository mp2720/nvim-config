-- Toggle between relative and absolute line number

local wn = require "winnums"

vim.g.rnu_toggle = true
vim.keymap.set({ 'n', 'i', 't' }, '<M-n>', function()
    vim.g.rnu_toggle = not vim.g.rnu_toggle
    wn.wincmd(vim.v.count, function()
        if not (vim.wo.rnu or vim.wo.nu) then return end
        vim.wo.rnu = vim.g.rnu_toggle
    end)
end)
