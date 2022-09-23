-- My nvim options and config
vim.opt.clipboard = "unnamedplus" -- allows nvim to access clipboard
vim.opt.mouse = "a" -- enable mouse
vim.opt.showmode = false -- disables modes like // INSERT and STUFF
vim.opt.showtabline = 2 -- always show tabs
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.termguicolors = true -- enables extra colors
-- PROGRAMMING SPECIFIC 
vim.opt.wrap = true -- turn on word wrap
vim.opt.tabstop = 2
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.number = true --line number true
vim.opt.relativenumber = true -- relative line numbers 
vim.opt.numberwidth = 2 --width of line number
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true  -- force all vertical splits to go to the right of current window



-- BUFFER AND ACCESS
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
