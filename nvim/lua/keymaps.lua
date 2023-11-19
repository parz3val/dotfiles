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
