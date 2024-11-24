local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

-- Function to find files including hidden (dot) files
local function find_files_with_hidden()
    builtin.find_files({
        hidden = true
    })
end

vim.keymap.set('n', '<C-y>', find_files_with_hidden, {})
vim.keymap.set('n', '<leader>y', builtin.git_files, {})
vim.keymap.set('n', '<leader>ff', function()
    builtin.live_grep()
end)
vim.keymap.set('n', 'gr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>qf', '<cmd> Telescope quickfix<cr>')
-- Show recent files
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>bl', '<cmd> Telescope buffers sort_lastused=true<cr>', {})
