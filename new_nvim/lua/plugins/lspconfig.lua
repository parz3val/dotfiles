require("mason").setup()

require("mason-lspconfig").setup(
	{
		ensure_installed = { "lua_ls", "rust_analyzer", "clangd" }
	})
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup {}

-- lspconfig.black.setup {
-- }
lspconfig.pyright.setup {}
lspconfig.clangd.setup {}
lspconfig.gopls.setup {}
-- lspconfig.rust_fmt.setup {}

lspconfig.biome.setup {}

-- lspconfig.rust_analyzer.setup {
-- 	setings = {
-- 		['rust_analyzer'] = {
-- 			check = {
-- 				command = "clippy",
-- 			},
-- 			diagonstics = {
-- 				enable = "true",
-- 			}
-- 		}
-- 	}
-- }
-- lspconfig.rust_fmt.setup {}

--typescript setup
lspconfig.tsserver.setup {
	-- on_attach = function(client)
	-- 				client.server_capabilities.documentFormattingProvider = false
	-- end,
	init_options = {
		preferences = {
			disableSuggestions = true,
		}
	}
}



-- --tailwind-tools
-- lspconfig.TailWindTools.setup{}
lspconfig.tailwindcss.setup {}
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),

	callback = function(ev)
		-- Enable compeltion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
		-- Buffer local mappings
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<leader>df', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, otps)
		vim.keymap.set('n', '<mapleader>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})
