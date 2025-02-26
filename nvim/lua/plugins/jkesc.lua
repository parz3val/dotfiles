-- https://github.com/Krafi2/jeskape.nvim
require("jeskape").setup {
    -- Mappings are specified in this table. Jeskape uses neovim's keymap
    -- system under the hood, so anything allowed in a normal `map`'s righ hand
    -- side will work here too. Check out ':h  map.txt' to see what's possible.
    mappings = {
        -- Typing `hi` quickly will cause the string `hello!` to be inserted.
        -- hi = "hello!",
        -- They can also be specified in a tree-like format.
        j = {
            -- Here `jk` will escape insert mode.
            k = "<esc>",
            -- You can have as many layers as you want!
            h = {
                g = "I pressed jhg!",
            },
            -- If the mapping leads to a function, it will be evaluated every
            -- time the mapping is reached and its return value will be fed to
            -- neovim.
            f = function()
                print("Oh look, a function!")
                -- Insert the name of the current file.
                return vim.fn.expand "%:t"
            end,
        },
				ff = function()
								vim.lsp.buf.format()
				end,
				-- ["''"] = "<cmd>:w<cr>",
        -- You can use lua's arbitrary key notation to map special characters
        -- [";;"] = "<esc>A;<cr>",
        -- Use `<cmd>` to map commands. Be carful to terminate the command with `<cr>`.
        -- ff = "<cmd>echo 'commands work too'<cr>",
    },
    -- The maximum length of time between keystrokes where they are still
    -- considered a part of the same mapping.
    timeout = vim.o.timeoutlen,
}
