vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'mbbill/undotree'


    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x,
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use 'Shatur/neovim-ayu'

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'nvim-treesitter/playground'
    use('nvim-treesitter/nvim-treesitter-context')
    use 'ThePrimeagen/harpoon'
    use('neovim/nvim-lspconfig')
    -- Add nvim-cmp and its dependencies
    use 'hrsh7th/nvim-cmp'         -- Autocompletion plugin
    use 'hrsh7th/cmp-buffer'       -- Buffer completions
    use 'hrsh7th/cmp-path'         -- Path completions
    use 'hrsh7th/cmp-cmdline'      -- Command-line completions
    use 'hrsh7th/cmp-nvim-lsp'     -- LSP completions
    use 'saadparwaiz1/cmp_luasnip' -- Snippet completions
    use 'L3MON4D3/LuaSnip'         -- Snippet engine
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "windwp/nvim-autopairs"
    use {
        "folke/noice.nvim",
        config = function()
            require('noice').setup({})
        end,
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --

            --   If not available, we use `mini` as the fallback
        }
    }
    use "nvim-tree/nvim-tree.lua"
    use 'kyazdani42/nvim-web-devicons'
    use {
        "nvim-lualine/lualine.nvim",
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use { 'lewis6991/gitsigns.nvim' }
    use { 'tpope/vim-fugitive' }
    use 'tpope/vim-repeat'
    use {
        "aznhe21/actions-preview.nvim",
        config = function()
            vim.keymap.set({ "v", "n" }, "<leader>ca", require("actions-preview").code_actions)
        end,
    }

    use 'github/copilot.vim'
    use 'mg979/vim-visual-multi'
    use {
        "goolord/alpha-nvim",
        -- dependencies = { 'echasnovski/mini.icons' },
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local startify = require("alpha.themes.startify")
            -- available: devicons, mini, default is mini
            -- if provider not loaded and enabled is true, it will try to use another provider
            startify.file_icons.provider = "devicons"
            require("alpha").setup(
                startify.config
            )
        end,
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({

            })
        end

    }

    use { 'nvim-telescope/telescope-ui-select.nvim' }

    use {
        'pwntester/octo.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            -- OR 'ibhagwan/fzf-lua',
            'nvim-tree/nvim-web-devicons',
        },
    }
    use {
        "folke/which-key.nvim",
    }

    use {
        "axelvc/template-string.nvim",
    }

    -- Autotag plugin for auto-closing and auto-renaming tags
    use {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup()
        end
    }

    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }

    use 'kiyoon/magick.nvim'
    use '3rd/image.nvim'

    use {
        '3rd/time-tracker.nvim',
        requires = {
            '3rd/sqlite.nvim'
        },
    }

    use 'mfussenegger/nvim-dap'

    -- Trouble plugin
    use "folke/trouble.nvim"

    use "yorickpeterse/nvim-window"

    use "folke/zen-mode.nvim"

    use { 'echasnovski/mini.indentscope', version = false }

    use { 'nvim-orgmode/orgmode' }

    -- nvim-notify
    use 'rcarriga/nvim-notify'
end)
