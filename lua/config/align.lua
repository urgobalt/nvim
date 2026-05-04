local align = require('mini.align')

align.setup({
  mappings = {
    start = nil,
    start_with_preview = 'ga',
  },
  register_opts = {
    ['='] = { keys = { '=', '==' } },
    ['|'] = { keys = { '|' } },
  }
})
