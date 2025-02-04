require('mini.indentscope').setup({
    symbol = '┃',
    draw = {
        delay = 10,
        animation = function(_, _) return 5 end
    },

})

-- Disable for specific file types
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help", "dashboard", "lazy", "NvimTree", "TelescopePrompt", "alpha" },
    callback = function()
        vim.b.miniindentscope_disable = true
    end,
})

vim.cmd([[highlight MiniIndentscopeSymbol guifg=#82C7F8 guibg=NONE gui=nocombine blend=100]])
