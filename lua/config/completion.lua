require('blink.cmp').setup({
  keymap = { preset = 'default' },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono'
  },
  sources = {
    default = { 'lsp', 'ripgrep', 'path', 'cmdline', 'buffer', 'lazydev' },
    providers = {
      ripgrep = {
        name = 'Ripgrep',
        module = 'blink-ripgrep',
        score_offset = -10,
      },
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        -- make lazydev completions top priority (see `:h blink.cmp`)
        score_offset = 100,
      },
    },
  },
})
