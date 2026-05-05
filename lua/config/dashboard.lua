local package_count = #vim.pack.get(nil, {info = false})

require("dashboard").setup({
  theme = "doom",
  config = {
    header = {
      "███████╗███████╗███╗   ██╗███████╗██╗██████╗ ██╗     ███████╗",
      "██╔════╝██╔════╝████╗  ██║██╔════╝██║██╔══██╗██║     ██╔════╝",
      "███████╗█████╗  ██╔██╗ ██║███████╗██║██████╔╝██║     █████╗  ",
      "╚════██║██╔══╝  ██║╚██╗██║╚════██║██║██╔══██╗██║     ██╔══╝  ",
      "███████║███████╗██║ ╚████║███████║██║██████╔╝███████╗███████╗",
      "╚══════╝╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝╚═════╝ ╚══════╝╚══════╝",
      "", "",
    },
    center = {
      { icon = " ", desc = "New File",  key = "n", action = "enew" },
      { icon = " ", desc = "Find File", key = "f", action = "Telescope find_files" },
      { icon = "󰱽 ", desc = "Live Grep", key = "s", action = "Telescope live_grep" },
      { icon = "󰙏 ", desc = "Explorer",  key = "e", action = "Oil" },
    },
    footer = {
      "",
      "startup time: " .. math.ceil(startup_time*1000) .. "ms",
      "neovim loaded " .. package_count .. " plugins",
    },
    vertical_center = true,
  },
})
