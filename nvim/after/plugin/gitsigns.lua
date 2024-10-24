require('gitsigns').setup(
    {
        current_line_blame = true,
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 0,
            ignore_whitespace = false,
            virt_text_priority = 100,
            use_focus = true,
        }
    }
)
-- Define a custom highlight group for the blame line
vim.cmd [[
highlight GitsignsCurrentLineBlame guifg=#647282 guibg=#1F2430 gui=bold
]]

