require('plugins.codecompanion.fidget-spinner'):init()
require("codecompanion").setup({
    display = {
        chat = {
            -- Change the default icons
            icons = {
                pinned_buffer = " ",
                watched_buffer = "👀 ",
            },

            -- Alter the sizing of the debug window
            debug_window = {
                ---@return number|fun(): number
                width = vim.o.columns - 5,
                ---@return number|fun(): number
                height = vim.o.lines - 2,
            },

            -- Options to customize the UI of the chat buffer
            window = {
                layout = "vertical", -- float|vertical|horizontal|buffer
                position = "right",  -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
                border = "single",
                height = 0.8,
                width = 0.4,
                relative = "editor",
                opts = {
                    breakindent = true,
                    cursorcolumn = false,
                    cursorline = false,
                    foldcolumn = "0",
                    linebreak = true,
                    list = false,
                    numberwidth = 1,
                    signcolumn = "no",
                    spell = false,
                    wrap = true,
                },
            },

            ---Customize how tokens are displayed
            ---@param tokens number
            ---@param adapter CodeCompanion.Adapter
            ---@return string
            token_count = function(tokens, adapter)
                return " (" .. tokens .. " tokens)"
            end,
        },
    },
    adapters = {
        copilot_claude = function()
            return require("codecompanion.adapters").extend("copilot", {
                name = "copilot_claude",
                schema = {
                    model = {
                        default = "claude-3.7-sonnet-thought"
                    }
                }
            })
        end
    },
    strategies = {
        chat = {
            adapter = "copilot_claude",
            keymaps = {
                send = {
                    modes = { n = "<CR>", i = "<C-CR>" },
                },
                close = {
                    modes = { n = "<C-c>", i = "<C-c>" },
                },
                -- Add further custom keymaps here
            },
        },
        inline = {
            adapter = "copilot_claude",
        },

    },
    diff = {
        enabled = true,
        close_chat_at = 240,  -- Close an open chat buffer if the total columns of your display are less than...
        layout = "vertical",  -- vertical|horizontal split for default provider
        opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
        provider = "default", -- default|mini_diff
    },
})

vim.keymap.set({ "n", "v" }, "<leader>cc", function()
    vim.cmd("CodeCompanionChat")
end)
