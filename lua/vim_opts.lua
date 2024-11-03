vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.history = 500
vim.opt.formatoptions:append('j')
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.autoindent = true
vim.opt.exrc = true
vim.opt.colorcolumn = "101"
vim.opt.signcolumn = "auto:1"
-- vim.opt.signcolumn = 'number'
vim.opt.fillchars:append('eob: ')
vim.opt.fillchars:append('fold: ')
vim.opt.splitkeep = "screen"
vim.opt.laststatus = 2
vim.opt.showtabline = 2
vim.opt.equalalways = false
vim.opt.exrc = true
vim.opt.wrap = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cursorline = true

-- Дураки не знают, что в C можно писать (struct s){...}
vim.cmd [[let c_no_curly_error=1]]
