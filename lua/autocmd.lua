local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  desc = "Show highlight on yanked word",
  callback = function ()
    vim.hl.on_yank()
  end
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  desc = "Restore last cursor position",
  callback = function ()
    if vim.o.diff then
      return
    end

    local last_pos = vim.api.nvim_buf_get_mark(0, '"')
    local last_row = vim.api.nvim_buf_line_count(0)

    local row = last_pos[1]
    if row < 1 or row > last_row then
      return
    end

    pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
  end
})
