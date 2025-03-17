vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldmethod = "expr"
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "zr", function()
  require("ufo").openFoldsExceptKinds({ "imports" })
end)
vim.keymap.set("n", "zm1", function()
  require("ufo").closeFoldsWith(1)
end)
vim.keymap.set("n", "zm2", function()
  require("ufo").closeFoldsWith(2)
end)
vim.keymap.set("n", "zm3", function()
  require("ufo").closeFoldsWith(3)
end)
vim.keymap.set("n", "K", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end)

require("ufo").setup({
  provider_selector = function(bufnr, filetype, buftype)
    if filetype == "markdown" then
      return { "treesitter", "indent" }
    end

    return { "lsp", "indent" }
  end,
  close_fold_kinds_for_ft = {
    default = { "imports", "comment" },
  },
  preview = {
    win_config = {
      winblend = 0,
    },
  },
})
