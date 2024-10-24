local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-y>', builtin.find_files, {})
vim.keymap.set('n', '<leader>y', builtin.git_files, {})
vim.keymap.set('n', '<leader>ff', function()
    builtin.live_grep()
end)
vim.keymap.set('n', 'gr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>qf', '<cmd> Telescope quickfix<cr>')
-- Show recent files
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})

