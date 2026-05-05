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
    },
    center = {
      { icon = " ", desc = "New File",  key = "n", action = "enew" },
      { icon = " ", desc = "Find File", key = "f", action = "Telescope find_files" },
      { icon = "󰱽 ", desc = "Live Grep", key = "g", action = "Telescope live_grep" },
      { icon = "󰙏 ", desc = "Explorer",  key = "e", action = "Oil" },
    },
    vertical_center = true,
  },
})
