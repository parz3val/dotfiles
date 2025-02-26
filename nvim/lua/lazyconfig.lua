require('lazy').setup(
  {
    -- install lualine
    -- {
    -- 	'nvim-lualine/lualine.nvim',
    -- 	requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    -- },
    -- install nvim tree file explorer
    {
      'nvim-tree/nvim-tree.lua',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    },
    --treesitter for the syntax highlight
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = false },
        })
      end

    },
    -- lsp config
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { "neovim/nvim-lspconfig" },

    -- telescope installation
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.4',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'uZer/pywal16.nvim',          as = 'pywal16' },
    -- nvim cmp configs
    -- https://github.com/SmiteshP/nvim-navbuddy
    -- this is for the code function and variables style navigation
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        {
          "SmiteshP/nvim-navbuddy",
          dependencies = {
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim"
          },
          opts = { lsp = { auto_attach = true } }
        }
      },
    },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/vim-vsnip' },
    { "ellisonleao/gruvbox.nvim",   priority = 1000,                                   config = true },
    { "ntk148v/komau.vim" },
    { "numToStr/Comment.nvim" },
    { 'MunifTanjim/nui.nvim',       dependencies = { 'VonHeikemen/fine-cmdline.nvim' } },
    { "Krafi2/jeskape.nvim" },
    { "EdenEast/nightfox.nvim" },
    { 'norcalli/nvim-colorizer.lua' }, -- used for showing the colors for the color codes
    {
      "MaximilianLloyd/tw-values.nvim",
      keys = {
        { "<leader>sv", "<cmd>TWValues<cr>", desc = "Show tailwind CSS values" },
      },
      opts = {
        border = "rounded",          -- Valid window border style,
        show_unknown_classes = true, -- Shows the unknown classes popup
        focus_preview = true,        -- Sets the preview as the current window
        copy_register = "",          -- The register to copy values to,
        keymaps = {
          copy = "<C-y>"             -- Normal mode keymap to copy the CSS values between {}
        }
      }
    },
    -- AI Code completion stuff
    {
    	{
    		"supermaven-inc/supermaven-nvim",
    		config = function()
    			require("supermaven-nvim").setup({})
    		end,
    	},
    },
    {
      "rust-lang/rust.vim",
    },
    -- TABS PLUGIN
    {
      'romgrk/barbar.nvim',
      dependencies = {
        'lewis6991/gitsigns.nvim',    -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
      }
    },
    -- THEMES
    {
      "https://github.com/aliqyan-21/darkvoid.nvim"
    },
    { "https://github.com/bluz71/vim-moonfly-colors" },
    { "https://github.com/Yazeed1s/minimal.nvim" },
    { "https://github.com/xero/miasma.nvim" },
    { "catppuccin/nvim",                             name = "catppuccin", priority = 1000 },
    { "phha/zenburn.nvim" },
    {
      'mrcjkb/rustaceanvim',
      version = '^5', -- Recommended
      lazy = false,   -- This plugin is already lazy
    },
    {
      'christoomey/vim-tmux-navigator',
    },

    -- plugin for the ident and blankline highlight
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      ---@module "ibl"
      ---@type ibl.config
      opts = {
      },
    },
    -- OIL Plugin, for file tree management and edits
    {
      'stevearc/oil.nvim',
      ---@module 'oil'
      ---@type oil.SetupOpts
      opts = {},
      -- Optional dependencies
      dependencies = { { "echasnovski/mini.icons", opts = {} } },
      -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },
    {
      'savq/melange-nvim'
    },
    {
      'folke/tokyonight.nvim'
    },
    {
      'rebelot/kanagawa.nvim'
    },
    {

      'sainnhe/everforest'
    },
    {
      'APZelos/blamer.nvim'
    },
    {
      'sainnhe/gruvbox-material'
    },
    -- Code formatting
    {
    'stevearc/conform.nvim'
      }
  }
)
