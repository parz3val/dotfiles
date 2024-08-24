-- https://github.com/luckasRanarison/tailwind-tools.nvim Docs
-- Look lspconfig for the setup info
local config = {
	document_color = {
		enabled = true, -- can be toggled by commands
		kind = "inline", -- "inline" | "foreground" | "background"
		inline_symbol = '\\U000f0764',
		debounce = 200, -- in milliseconds, only applied in insert mode
	},
	conceal = {
		enabled = false, -- can be toggled by commands
		min_length = nil, -- only conceal classes exceeding the provided length
		symbol = '\\U000f13ff', -- only a single character is allowed
		highlight = { -- extmark highlight options, see :h 'highlight'
			fg = "#38BDF8",
		},
	},
	custom_filetypes = {} -- see the extension section to learn how it works
}
require("tailwind-tools").setup({
	-- your configuration
	config
})
