-- Keymaps for my nvim config
-- set opts
local opts = {
  noremap = true, -- no recursive map
  silent = false,
}

-- shorten the function name
local keymap = vim.api.nvim_set_keymap

-- NORMAL MODE MAPS

-- remap alt as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","
-- easy window navigation
-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Explorer
keymap("n", "<leader>e", ":Lex 20<cr>", opts)
-- More bindings

-- Resize with arrows
--keymap("n", "<leader>Up", ":resize +2<CR>", opts)
--keymap("n", "<leader>Down", ":resize -2<CR>", opts)
--keymap("n", "<leader>Left", ":vertical resize -2<CR>", opts)
--keymap("n", "<leader>Right", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
