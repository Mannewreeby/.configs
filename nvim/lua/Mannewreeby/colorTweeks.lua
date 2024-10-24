-- Set custom highlight groups for Telescope and Visual
vim.cmd [[highlight TelescopePreviewLine guifg=#ffffff guibg=#FFAA00 ]]
vim.cmd [[highlight Visual guifg=#000000 guibg=#FFAA00 gui=NONE]]

-- Highlight yanked text
vim.api.nvim_exec2([[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='Visual', timeout=200 }
augroup END]], {})


-- Change the color of the line numbers
vim.cmd([[ 
    highlight LineNr guifg=#647181
    highlight CursorLineNr guifg=#00FF00
]])

-- Add line marking
vim.opt.cursorline = true
vim.cmd([[ 
    highlight CursorLine guibg=#2E3440
]])

-- Change color of active line number
vim.cmd([[ 
    highlight CursorLineNr guifg=#F3B172
]])
