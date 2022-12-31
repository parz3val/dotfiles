vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
require("nvim-tree").setup()

-- remap <leader>e to ToggleNvimTree
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>E", vim.cmd.NvimTreeFocus)

