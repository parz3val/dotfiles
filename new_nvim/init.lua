-- disable netrw at the very start
-- its for the nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set <space> as the leader key
vim.g.maplocalleader = ' '
vim.g.mapleader = ' '


-- import the options from the options menu
require('options')

--Plugins 
require('lazyconfig')

-- require the nvim tree setup
require('plugins/nvimtree')

-- require lspconfig
require('plugins/lspconfig')

-- import plugins setups
require('plugins/lualines')

-- require treesitter setup
require('plugins/treesitter')

--require telescopeconfig
require('plugins/telscopeconfig')

-- require keymaps
require('keymaps')
require('neovide')
require('plugins/nvim_cmp')

require('plugins/colorizer')
-- import the themes and such
require('colors')

-- TODO: Move this to a seperate plugin
local nsd = require('nsd')
require('plugins/commenter')
vim.keymap.set('n', '<leader>ss',nsd.show_sessions_list, {})
vim.keymap.set('n', '<leader>ls',nsd.save_session, {})

-- Buffer manager
require('buffer_manager')
require('plugins/fine_cmdline_cfg')
require('plugins/jkesc')
require('plugins/tabbar')
-- require('plugins/rust_nvim')
