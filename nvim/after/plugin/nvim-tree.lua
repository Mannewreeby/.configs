-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
    git = {
        enable = true,
        ignore = true,
    },
    update_focused_file = {
        enable = true,
    },
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 50,
    },
    renderer = {
        group_empty = true,
        higlight_git = true,
        icons = {
            show = {
                git = true
            }
        }
    },
    filters = {
        dotfiles = false,
    },
    on_attach = function(bufnr)
        local api = require('nvim-tree.api')

        -- Define your key mappings
        local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', '<Right>', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', '<Enter>', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'a', api.fs.create, opts('Create New File'))
        vim.keymap.set('n', 'D', api.fs.remove, opts('Delete File'))
        vim.keymap.set('n', 'r', api.fs.rename, opts('Rename File'))

    end,
})

vim.keymap.set("n", "<C-e>", ":NvimTreeFocus<cr>")
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<cr>")


