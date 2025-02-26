-- [[ Settin options ]]

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- highlight on search
vim.o.hlsearch = true

-- turn on line number
vim.wo.number = true

-- relative line numbers
vim.wo.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- turn on line wrap
vim.o.wrap = false
vim.o.linespace = 0
-- vim.o.linespace = -5

-- term gui colours
vim.o.termguicolors = true
vim.o.laststatus = 0 -- turning of status bar because the one from tmux is enough


-- git blame enabled or disabled
vim.g.blamer_enabled = true

-- Disable in the insert mode
vim.g.blamer_show_in_insert_modes = false
