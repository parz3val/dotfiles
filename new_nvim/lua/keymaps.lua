-- Keymaps
-- nvim tree keymaps
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>E', ':NvimTreeFocus<cr>')


-- Lsp keymaps
-- format the buffer with the lsp
vim.keymap.set('n', '<leader>F', function(_)
	vim.lsp.buf.format()
end
)
-- horizontal split
vim.keymap.set('n', '<leader>xp', ':sp<CR>')
-- vertical split
vim.keymap.set('n', '<leader>hp', ':vsp<CR>')
vim.keymap.set('n', '<leader>m', function()
				vim.opt.mouse = ''
end)

-- FILE SAVE AND QUIT AND SUCH 
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>x', ':so<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', 'jj', '4j')
-- copy paste remaps
-- Copy to clipboard
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+yg_')
-- vim.keymap.set('n', '<leader>y', '"+y')

-- -- Paste from clipboard
-- vim.keymap.set('n', '<leader>p', '"+p')
-- vim.keymap.set('n', '<leader>P', '"+P')
-- vim.keymap.set('v', '<leader>p', '"+p')
-- vim.keymap.set('v', '<leader>P', '"+P')
--

-- Python formatting with black, special case keybinbing
vim.keymap.set('n', '<leader>fp', ':!black -l 79 %<CR>', {noremap=true, silent=true})

-- Remap Ctrl+w up to Ctrl+j 
-- vim.keymap.set('n', '<C-w>Up', <C-j>')
vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>")

