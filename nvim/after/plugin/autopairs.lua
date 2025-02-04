require("nvim-autopairs").setup({
    check_ts = true,                               -- Enable Treesitter integration
    disable_filetype = { "TelescopePrompt", "vim" }, -- Disable for certain filetypes
})
