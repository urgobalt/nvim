return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "julianolf/nvim-dap-lldb",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    require("custom.dap")
  end,
}
