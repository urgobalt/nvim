-- Leave terminal mode
vim.keymap.set(
  "t",
  "<C-n>",
  "<C-\\><C-n>",
  { noremap = true, desc = "Leave terminal mode" }
)
vim.keymap.set(
  "t",
  "<C-A-n>",
  "<C-\\><C-n>",
  { noremap = true, desc = "Leave terminal mode" }
)

-- Run in terminal
vim.keymap.set({ "n", "o" }, "<C-t>", function()
  local ok, input = pcall(vim.fn.input, "Command: ", "", "shellcmd")
  if not ok or input == "" then
    return
  end
  local cmd = input
  local bufnr = vim.api.nvim_create_buf(true, true)
  local chan = 0

  local function write_to_term(_, data)
    data = data or ""
    pcall(vim.api.nvim_chan_send, chan, vim.fn.join(data, "\n"))
  end

  local jobid = vim.fn.jobstart(cmd, {
    on_stdout = write_to_term,
    on_stderr = write_to_term,
    on_exit = function(_, code, _)
      pcall(
        vim.api.nvim_chan_send,
        chan,
        "\n\n[command exited with code '" .. code .. "']"
      )
    end,
    pty = true,
    detach = false,
    env = {
      TERM = vim.env.TERM,
    },
  })
  vim.api.nvim_create_autocmd("BufDelete", {
    callback = function(args)
      local buf_num = args.buf
      if buf_num == bufnr then
        local pid = vim.fn.jobpid(jobid)
        pcall(vim.fn.system, "kill $(ps -s " .. pid .. " -o pid=)")
        pcall(vim.fn.jobstop, jobid)
        vim.api.nvim_del_autocmd(args.id)
      end
    end,
  })
  chan = vim.api.nvim_open_term(bufnr, {
    on_input = function(_, _, _, data)
      vim.fn.chansend(jobid, data)
    end,
  })
  vim.api.nvim_chan_send(chan, '[running "' .. cmd .. '"]\n\n')
  if chan == 0 then
    return
  end
  vim.api.nvim_set_current_buf(bufnr)
end, { desc = "Open terminal" })
