return {
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle [U]ndotree' })
        end,
    },
    'tpope/vim-surround',
    'tpope/vim-repeat', -- Repeat actions better
    -- "godlygeek/tabular", -- Quickly align text by pattern
    -- "tpope/vim-sleuth",
    --[[ {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
        end
    }, ]]
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
    },
    {
        'folke/todo-comments.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = function()
            require("todo-comments").setup()
        end
    },
    {
        'echasnovski/mini.bufremove',
        config = function()
            require('mini.bufremove').setup()
        end,
    },
    'ThePrimeagen/vim-be-good',
    {
        'Partysun/cheat.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
        },
        -- Config part is optional
        config = function()
            local cheat = require 'cheat'
            cheat.setup()

            --[[ vim.keymap.set('n', '<leader>bc', function()
        cheat.open_chtsh_popup(vim.fn.expand '<cword>')
      end) ]]

            -- Open search box
            vim.keymap.set('n', '<leader>bc', function()
                cheat.input()
            end)
        end,
    },
    'mistricky/code-link.nvim',
    {
        'Saecki/crates.nvim',
        config = function()
            require('crates').setup {}
        end,
    },
    'nvim-treesitter/nvim-treesitter-context',
    {
        'NMAC427/guess-indent.nvim',
        config = function()
            require("guess-indent").setup({
                auto_cmd = true,
                override_editorconfig = false,
                buftype_exclude = { -- A list of buffer types for which the auto command gets disabled
                    "help",
                    "nofile",
                    "terminal",
                    "prompt",
                },
            })
        end
    },
}
