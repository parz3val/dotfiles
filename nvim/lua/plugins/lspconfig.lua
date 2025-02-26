require("mason").setup()

require("mason-lspconfig").setup(
  {
    ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "ts_ls" }
  }
)

local lspconfig = require('lspconfig')
local navbuddy = require('nvim-navbuddy')

lspconfig.lua_ls.setup {
  on_attach = function(client, bufnr)
    navbuddy.attach(client, bufnr)
  end
}

lspconfig.pyright.setup {
  on_attach = function(client, bufnr)
    navbuddy.attach(client, bufnr)
  end
}



lspconfig.clangd.setup {}
lspconfig.gopls.setup {}
-- lspconfig.biome.setup {}
lspconfig.ts_ls.setup {
}
lspconfig.sqlls.setup{
  filetypes = { 'sql' },
  root_dir = function(_)
    return vim.loop.cwd()
  end,
}



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
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>df', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, otps)
    vim.keymap.set('n', '<mapleader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
