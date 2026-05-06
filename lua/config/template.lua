require("esqueleto").setup({
  autouse = true,
  directories = { vim.fn.stdpath("config") .. "/templates" },
  patterns = function(dir)
    return vim.fn.readdir(dir)
  end,
  wildcards = {
    expand = true,
    lookup = {},
  },
  advanced = {
    ignored = { "oil" },
    ignore_os_files = true,
  },
})
