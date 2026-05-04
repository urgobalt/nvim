local telescope = require('telescope')
local builtin = require('telescope.builtin')
local flash = require('flash')

telescope.setup({
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = { prompt_position = 'top' },
    sorting_strategy = 'ascending',
  }
})

vim.keymap.set('n', '<leader>tf', builtin.find_files,                    { desc = 'Find files' })
vim.keymap.set('n', '<leader>tw', builtin.lsp_dynamic_workspace_symbols, { desc = 'Search symbols' })
vim.keymap.set('n', '<leader>tb', builtin.buffers,                       { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>ts', builtin.live_grep,                     { desc = 'Live grep' })
vim.keymap.set('n', '<leader>tt', "<CMD>TodoTelescope<CR>",              { desc = 'List and search todo comments' })

flash.setup({
  search = {
    -- Enable jump labels directly within search
    mode = 'search',
  },
})

vim.keymap.set('n', 'q', '§', { desc = 'Record a macro' }) -- INFO: Macro key remap happens here
vim.keymap.set({ 'n', 'x', 'o' }, 'q', function() flash.jump() end, { desc = 'Flash jump' })
vim.keymap.set({ 'c' }, '<c-s>', function() flash.toggle() end, { desc = 'Toggle Flash Search' })
