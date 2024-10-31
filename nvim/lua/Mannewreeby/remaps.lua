vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>sv", function()
    vim.cmd.vsplit()
    vim.cmd.wincmd("l")
end)

vim.keymap.set("n", '<leader>sh', function()
    vim.cmd.split()
    vim.cmd.wincmd("j")
end)

-- Bind leader w to window management
vim.keymap.set("n", "<leader>w", "<C-w>")

-- Map Ctrl + t to switch to normal mode in terminal
vim.api.nvim_set_keymap('t', '<C-t>', [[<C-\><C-n>]], { noremap = true, silent = true })
