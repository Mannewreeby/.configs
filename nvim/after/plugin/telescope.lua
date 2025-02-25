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


local focus_preview = function(prompt_bufnr)
    local action_state = require("telescope.actions.state")
    local picker = action_state.get_current_picker(prompt_bufnr)
    local prompt_win = picker.prompt_win
    local previewer = picker.previewer
    local winid = previewer.state.winid
    local bufnr = previewer.state.bufnr
    vim.keymap.set("n", "<Tab>", function()
        vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", prompt_win))
    end, { buffer = bufnr })
    vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", winid))
    -- api.nvim_set_current_win(winid)
end



-- Map tab when in telescope to focus preview window
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<Tab>"] = focus_preview,
            },
        },
    },
}
