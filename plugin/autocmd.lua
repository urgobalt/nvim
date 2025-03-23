local create = vim.api.nvim_create_autocmd

create("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

create("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
  end,
})

create("FileType", {
  group = vim.api.nvim_create_augroup("FormatOptions", { clear = true }),
  pattern = "*",
  callback = function()
    vim.opt_local.fo:remove("o")
  end,
})

create("BufRead", {
  pattern = "*",
  callback = function(args)
    local ignored_filetypes = { "dashboard", "markdown" }
    local win = vim.api.nvim_get_current_win()
    for _, ft in pairs(ignored_filetypes) do
      if vim.api.nvim_buf_get_option(args.buf, "filetype") == ft then
        vim.api.nvim_set_option_value("colorcolumn", "", { win = win })
        return
      end
    end

    if vim.api.nvim_buf_get_option(args.buf, "buftype") ~= "" then
      vim.api.nvim_set_option_value("colorcolumn", "", { win = win })
      return
    end

    vim.api.nvim_set_option_value("colorcolumn", "80,120", { win = win })
  end,
})
