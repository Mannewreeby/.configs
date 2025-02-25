-- Create an augroup to handle relative line numbers in normal mode
vim.api.nvim_create_augroup('RelLineNumbers', { clear = true })

-- Enable relative line numbers in normal mode
vim.api.nvim_create_autocmd('InsertEnter', {
    group = 'RelLineNumbers',
    pattern = '*',
    command = 'set norelativenumber'
})

-- Disable relative line numbers (switch to absolute) in insert mode
vim.api.nvim_create_autocmd('InsertLeave', {
    group = 'RelLineNumbers',
    pattern = '*',
    command = 'set relativenumber'
})

-- Enable relative line numbers when starting Neovim
vim.opt.relativenumber = true
vim.opt.number         = true
vim.opt.nu             = true
vim.tabstop            = 4
vim.softtabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.expandtab      = true
vim.opt.smartindent    = true

vim.opt.wrap           = false
vim.opt.swapfile       = false
vim.opt.backup         = false
vim.opt.hlsearch       = false
vim.opt.incsearch      = true

vim.opt.backup         = false
vim.opt.undodir        = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile       = true

vim.opt.termguicolors  = true

vim.opt.signcolumn     = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 250
vim.colorcolumn = 80

-- Set longer wait time for error messages to disappear
vim.opt.updatetime = 300

vim.opt.scrolloff = 20
vim.o.fillchars = "eob: "

vim.api.nvim_create_user_command("Cppath", function()
    -- Copy the file path relative to the project repository root to the clipboard, fallback to relative path

    local path = vim.fn.expand("%:p")
    local project_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]

    if project_root == "" then
        vim.fn.setreg("+", path)
    end
     vim.fn.setreg("+", path:gsub(project_root, ""))
end, {})
