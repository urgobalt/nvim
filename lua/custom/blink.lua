--- @type table<string, blink.cmp.KeymapCommand[]>
local custom_keymaps = {
  ["<C-y>"] = { "select_and_accept" },
  ["<C-e>"] = { "cancel" },
  ["<C-n>"] = { "select_next" },
  ["<C-p>"] = { "select_prev" },
}

require("blink.cmp").setup({
  -- 'default' for mappings similar to built-in completion
  -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
  -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
  -- See the full "keymap" documentation for information on defining your own keymap.
  keymap = custom_keymaps,

  appearance = {
    use_nvim_cmp_as_default = true,
    -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = "mono",
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    per_filetype = {
      sql = { "dadbod", "buffer" },
      lua = { inherit_defaults = true, "lazydev" },
    },
    providers = {
      dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
    },
  },
  completion = {
    keyword = { range = "prefix" },
    menu = { auto_show = true },
    documentation = { auto_show = true, auto_show_delay_ms = 1000 },
    ghost_text = { enabled = false },

    accept = {
      create_undo_point = true,
      auto_brackets = {
        enabled = true,
        default_brackets = { "(", ")" },
        override_brackets_for_filetypes = {},
        kind_resolution = {
          enabled = true,
          blocked_filetypes = { "typescriptreact", "javascriptreact", "vue" },
        },
        semantic_token_resolution = {
          enabled = true,
          blocked_filetypes = {},
          timeout_ms = 400,
        },
      },
    },
  },
  cmdline = {
    completion = {
      menu = { auto_show = true },
    },
    keymap = custom_keymaps,
  },
})
