require("zen-mode").setup({
    window = {
        backdrop = 0.95,      -- Dim background
        width = 0.5,           -- Width of the Zen window
        options = {
            signcolumn = "no", -- Hide the sign column
            cursorline = true, -- Disable cursorline
        },
    },
    plugins = {
        options = {
            enabled = true,
            ruler = false,          -- Hide ruler
            showcmd = true,        -- Hide command input
            laststatus = 0,         -- Hide status line
        },
        twilight = { enabled = false }, -- Disable Twilight plugin (if installed)
        gitsigns = { enabled = false }, -- Hide git signs
        tmux = { enabled = false }, -- Disable tmux status line
    },
    on_open = function()
        -- Actions to take when Zen Mode is activated
    end,
    on_close = function()
        -- Actions to take when Zen Mode is deactivated
    end,
})

-- Bind leader zz to toggle zen mode
vim.api.nvim_set_keymap('n', '<leader>zz', ':ZenMode<CR>', { noremap = true, silent = true })
