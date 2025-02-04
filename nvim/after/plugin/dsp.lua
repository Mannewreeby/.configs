

vim.keymap.set('n', '<leader>db', '<cmd>lua require("dap").toggle_breakpoint()<cr>')

vim.keymap.set('n', '<leader>dc', '<cmd>lua require("dap").continue()<cr>')
vim.keymap.set('n', '<leader>dso', '<cmd>lua require("dap").step_over()<cr>')
vim.keymap.set('n', '<leader>dsi', '<cmd>lua require("dap").step_into()<cr>')
vim.keymap.set('n', '<leader>dsout', '<cmd>lua require("dap").step_out()<cr>')
vim.keymap.set('n', '<leader>dss', '<cmd> lua require("dap").repl.open()<cr>')




