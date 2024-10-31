require('toggleterm').setup {
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '2',   -- the degree by which to darken to terminal colour, default: 1 for dark, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    direction = 'float',
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
        border = 'curved', -- other options: 'single', 'double', 'shadow', 'curved'
        width = 200,
        height = 80,
        winblend = 0,
    }
}

-- Keybindings
vim.api.nvim_set_keymap('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>', { noremap = true, silent = true })

-- Key mapping to open terminal in a horizontal split
vim.api.nvim_set_keymap('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', { noremap = true, silent = true })

-- Key mapping to open terminal in a floating window
vim.api.nvim_set_keymap('n', '<leader>tf', ':ToggleTerm direction=float<CR>', { noremap = true, silent = true })
