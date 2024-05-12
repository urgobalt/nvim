return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      columns = {
        'icon',
        'permissions',
      },
      delete_to_trash = true,
      lsp_file_methods = {
        autosave_changes = true,
      },
      contraint_cursor = "name",
      buf_options = {
        buflisted = false,
        bufhidden = 'hide',
      },
      view_options = {
        show_hidden = true,
        is_always_hidden = function (name, _)
          return name == ".."
        end
      },
      experimental_watch_for_changes = true,
    }

    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Explore Current Directory' })
  end,
}
