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

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_option(buf, 'modified') then
            vim.cmd("echohl WarningMsg | echo 'There are modified buffers' | echohl None")
            return
        end
    end
end

-- Set up an autocmd to trigger the on_attach function for Fugitive
vim.api.nvim_create_autocmd("FileType", {
    pattern = "fugitive",
    callback = function(args)
        on_attach(args.buf)
    end,
})

-- Define the GdiffLast command with horizontal split
vim.cmd([[
  command! GdiffLast execute 'Gdiffsplit ' . system('git log -2 --format=%H -- ' . expand('%'))[-42:-1]
]])

-- Map leader + g + c to the GdiffLast command
vim.api.nvim_set_keymap('n', '<leader>gc', ':GdiffLast<CR>', { noremap = true, silent = true })

