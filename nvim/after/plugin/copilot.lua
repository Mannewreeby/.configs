
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<C-e>', 'copilot#Accept("<CR>")', {expr = true, replace_keycodes = false})

---@diagnostic disable-next-line: lowercase-global
function disable_copilot_in_dirs()
    local current_dir = vim.fn.getcwd()

    local disabled_dirs = {
        "/Users/emanuel/Univrses",
    }

    for _, dir in ipairs(disabled_dirs) do
        if string.find(current_dir, dir) then
            vim.g.copilot_enabled = false
            return
        end
    end


    vim.g.copilot_enabled = true
end



vim.cmd([[
    augroup copilot
        autocmd!
        autocmd BufEnter * lua disable_copilot_in_dirs()
    augroup END
]])

