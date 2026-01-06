local dap = require("dap")
local ui = require("dapui")

ui.setup()
require("dap-lldb").setup({})

dap.configurations.asm = {
  {
    name = "Run executable (LLDB)",
    type = "lldb",
    request = "launch",
    -- This requires special handling of 'run_last', see
    -- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
    program = function()
      local path = vim.fn.input({
        prompt = "Path to executable: ",
        default = vim.fn.getcwd() .. "/",
        completion = "file",
      })

      return (path and path ~= "") and path or dap.ABORT
    end,
  },
}

vim.keymap.set("n", "<leader>b",  dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

vim.keymap.set("n", "<leader>g?", function()
  require("dapui").eval(nil, { enter = true })
end)

require("nvim-dap-virtual-text").setup({})

vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.step_back)
vim.keymap.set("n", "<F8>", dap.restart)

vim.keymap.set("n", "<leader>d", function()
  dap.close()
  ui.close()
end)

dap.listeners.before.attach.dapui_config           = function() ui.open()  end
dap.listeners.before.launch.dapui_config           = function() ui.open()  end
dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
dap.listeners.before.event_exited.dapui_config     = function() ui.close() end
