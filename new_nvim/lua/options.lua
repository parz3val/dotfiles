-- [[ Settin options ]]

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- highlight on search
vim.o.hlsearch = true

-- turn on line number
vim.wo.number = false

-- relative line numbers
-- vim.wo.relativenumber = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- turn on line wrap
vim.o.wrap = false
vim.o.linespace = 0
-- vim.o.linespace = -5

-- term gui colours
vim.o.termguicolors = true
vim.o.laststatus = 0 -- turning of status bar because the one from tmux is enough
