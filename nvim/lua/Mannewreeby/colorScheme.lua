require('ayu').setup({
    mirage = true,                      -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
    terminal = true,                    -- Set to `false` to let terminal manage its own colors.
    underline = true,                   -- Set to `true` if you want to underline the `CursorLine`.
    overrides = {
        Normal = { bg = 'NONE' },       -- Set Normal background to transparent
        NonText = { bg = 'NONE' },      -- Set NonText background to transparent
        EndOfBuffer = { bg = 'NONE' },  -- Set EndOfBuffer background to transparent
        SignColumn = { bg = 'NONE' },   -- Set SignColumn background to transparent
        StatusLine = { bg = 'NONE' },   -- Set StatusLine background to transparent
        StatusLineNC = { bg = 'NONE' }, -- Set StatusLineNC background to transparent
        NormalNC = { bg = 'NONE' },     -- Set NormalNC background to transparent
        -- Set error message background to transparent
        ErrorMsg = { bg = 'NONE' },
    }, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
})

require('ayu').colorscheme()

