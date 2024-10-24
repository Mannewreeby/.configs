vim.keymap.set('n', '<leader>gs', ':Git<cr>')
vim.keymap.set('n', '<leader>ga', ':Git add %<cr>')
vim.keymap.set('n', '<leader>gu', ':Git reset %<cr>')

vim.keymap.set('n', '<leader>gn', ']c')
vim.keymap.set('n', '<leader>gp', '[c')


-- init.lua
local function on_attach(bufnr)
    -- Simulate pressing 'd' followed by 'v' in the Fugitive status window
    vim.keymap.set('n', '<leader>l', function()
        vim.cmd('normal! dv')
    end, { buffer = bufnr, noremap = true })
end

-- Set up an autocmd to trigger the on_attach function for Fugitive
vim.api.nvim_create_autocmd("FileType", {
    pattern = "fugitive",
    callback = function(args)
        on_attach(args.buf)
    end,
})
