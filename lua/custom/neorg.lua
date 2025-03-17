-- require("image").setup()

require("neorg").setup({
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.highlights"] = {},
    ["core.concealer"] = {
      config = {
        icon_preset = "varied",
        icons = {
          delimiter = {
            horizontal_line = {
              highlight = "@neorg.delimiters.horizontal_line",
            },
          },
          code_block = {
            -- If true will only dim the content of the code block (without the
            -- `@code` and `@end` lines), not the entirety of the code block itself.
            content_only = true,

            -- The width to use for code block backgrounds.
            --
            -- When set to `fullwidth` (the default), will create a background
            -- that spans the width of the buffer.
            --
            -- When set to `content`, will only span as far as the longest line
            -- within the code block.
            width = "content",

            -- Additional padding to apply to either the left or the right. Making
            -- these values negative is considered undefined behaviour (it is
            -- likely to work, but it's not officially supported).
            padding = {
              -- left = 20,
              -- right = 20,
            },

            -- If `true` will conceal (hide) the `@code` and `@end` portion of the code
            -- block.
            conceal = true,

            nodes = { "ranged_verbatim_tag" },
            highlight = "CursorLine",
            -- render = module.public.icon_renderers.render_code_block,
            insert_enabled = true,
          },
        },
      },
    }, -- Adds pretty icons to your documents
    ["core.integrations.treesitter"] = {},
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          notes = "~/notes",
        },
        default_workspace = "notes",
      },
    },
    ["core.qol.todo_items"] = {
      create_todo_items = true,
      create_todo_parents = true,
    },
    ["core.clipboard"] = {},
    ["core.clipboard.code-blocks"] = {},
    -- ["core.integrations.image"] = {},
    -- ["core.latex.renderer"] = {
    -- 	render_on_enter = true,
    -- },
    ["core.looking-glass"] = {},
    ["core.keybinds"] = {
      config = {
        default_keybinds = false,
      },
    },
    ["core.ui"] = {},
    ["core.esupports.metagen"] = {},
  },
})

vim.api.nvim_create_autocmd("Filetype", {
  pattern = "norg",
  callback = function()
    local set = function(mode, key, action, description)
      description = description or ""
      vim.keymap.set(mode, key, action, { buffer = true, desc = description })
    end
    set(
      "n",
      "<C-Space>",
      "<Plug>(neorg.qol.todo-items.todo.task-cycle)",
      "Neorg cycle task"
    )
    set(
      "n",
      "<leader>mi",
      "<Plug>(neorg.qol.todo-items.todo.task-important)",
      "Neorg set important"
    )
    set(
      "n",
      "<leader>mp",
      "<Plug>(neorg.qol.todo-items.todo.task-pending)",
      "Neorg set pending"
    )
    set("n", "<leader>mn", "<Plug>(neorg.dirman.new-note)", "Neorg new note")
    set("n", "<leader>md", "<Plug>(neorg.insert-date)", "Neorg insert date")
    set(
      "n",
      "<leader>mc",
      "<Plug>(neorg.looking-glass.magnify-code-block)",
      "Neorg magnify code block"
    )
    set("n", "<leader>mm", "", "Neorg inject metadata")
  end,
})
