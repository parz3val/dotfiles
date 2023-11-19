require('lazy').setup(
	{
		-- install lualine
		{
			'nvim-lualine/lualine.nvim',
			requires = { 'nvim-tree/nvim-web-devicons', opt = true }
		},

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
					indent = { enable = true },
				})
			end

		},
		-- lsp config
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' },
		{ "neovim/nvim-lspconfig" },
		-- telescope installation
		{
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
		{ 'uZer/pywal16.nvim', as = 'pywal16' }
	}
)
