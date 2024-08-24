local light = "light"
local dark = "dark"
vim.o.termguicolors = true
-- vim.cmd [[ colorscheme habamax ]]
-- vim.o.colorscheme = 'habamax'
--
--local pywal16 = require('pywal16')
--pywal16.setup()

-- vim.cmd [[ colorscheme habamax ]]
-- vim.cmd [[ colorscheme habamax ]]

-- GRUVBOX LIGHT
-- vim.o.background = "light" -- can be light/ dark
-- vim.cmd [[ colorscheme gruvbox ]]
require('nightfox').setup({
  options = {
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "italic,bold",
    }
  }
})

vim.o.background =  light
vim.cmd [[ colorscheme catppuccin  ]]
-- vim.api.nvim_set_hl(0, "Normal", {bg = "none"})

