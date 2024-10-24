
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
vim.opt.number = true
vim.opt.nu = true
vim.tabstop = 4
vim.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent  = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 20
vim.colorcolumn = 80



