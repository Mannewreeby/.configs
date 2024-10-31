-- NOTE: to make any of this work you need a language server.
-- If you don't know what that is, watch this 5 min video:
-- https://www.youtube.com/watch?v=LaS32vctfOY

-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

local function toggle_diagnostic_float()
    if vim.diagnostic.get(0) and #vim.diagnostic.get(0) > 0 then
        vim.diagnostic.open_float({ scope = "cursor" })
    end
end




vim.diagnostic.config({
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        focusable = true,
        prefix = '',
        scope = 'line',
        delay = 0, -- Set the delay before showing the diagnostic float window (in milliseconds)
    },
})


-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>:vsplit<CR>')
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<leader>s', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<leader>dn',
            '<cmd> lua vim.diagnostic.goto_next({severity = {min = vim.diagnostic.severity.WARN}})<CR>')
        vim.keymap.set('n', '<leader>e', toggle_diagnostic_float, { desc = 'Open diagnostic float' })
        -- Move cursor into diagnostic popup
    end,
})

-- You'll find a list of language servers here:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- These are example language servers.

require('lspconfig').gleam.setup({})
require('lspconfig').ocamllsp.setup({})
require('lspconfig').gopls.setup({})
require('lspconfig').html.setup({})
require('lspconfig').taplo.setup({})
require('lspconfig').rust_analyzer.setup({})
require 'lspconfig'.clangd.setup({

    -- Set std=c++17
    cmd = { 'clangd', '--background-index', '--header-insertion=iwyu', '--clang-tidy', '--suggest-missing-includes', '--cross-file-rename' },

})
require('lspconfig').ts_ls.setup({
})
require('lspconfig').eslint.setup({})
require 'lspconfig'.lua_ls.setup {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = true,
                library = vim.api.nvim_get_runtime_file("", true),
            }
        })
    end,
    flags = {
        debounce_text_changes = 50,
    },
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
        } } }

local cmp = require('cmp')
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    snippet = {
        expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<Esc>'] = cmp.mapping.abort(),
        ['<C-i>'] = cmp.mapping.complete(),
    }),
})
