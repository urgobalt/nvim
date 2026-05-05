vim.keymap.set("n", "-", "<CMD>Oil<CR>", {desc = "Open file explorer"})

-- Set current working directory to current directory in oil
vim.keymap.set("n", "<leader>.", function()
  local current_directory

  if vim.o.filetype == "oil" then
    current_directory = require("oil").get_current_dir(0)
  else
    current_directory = vim.fn.expand("%:p:h")
  end

  print("cwd: " .. current_directory)
  vim.fn.chdir(current_directory)
end, {
  desc = "Change the working directory of the neovim process to the current directory using oil",
})

-- Goto neovim config
local config_dir = vim.fn.stdpath("config")
vim.keymap.set(
  "n",
  "<leader>cc",
  "<CMD>Oil " .. config_dir .. "<CR>",
  { desc = "Go to the configuration directory of neovim" }
)

require("oil").setup({
  default_file_explorer = true,
  columns = {
    "icon",
    "permissions",
    "size",
    "mtime",
  },
  buf_options = {
    buflisted = false,
    bufhidden = "hide",
  },
  win_options = {
    wrap          = false,
    signcolumn    = "no",
    cursorcolumn  = false,
    foldcolumn    = "0",
    spell         = false,
    list          = false,
    conceallevel  = 3,
    concealcursor = "nvic",
  },
  delete_to_trash                 = true,
  skip_confirm_for_simple_edits   = true,
  prompt_save_on_select_new_entry = true,
  cleanup_delay_ms                = 10000,
  lsp_file_methods = {
    enabled          = true,
    timeout_ms       = 1000,
    autosave_changes = false,
  },
  constrain_cursor  = "editable",
  watch_for_changes = true,
  keymaps = {
    ["g?"]        =  { "actions.show_help", mode = "n" },
    ["<CR>"]      =  "actions.select",
    ["<C-p>"]     =  "actions.preview",
    ["<C-c>"]     =  { "actions.close", mode = "n" },
    ["<C-r>"]     =  "actions.refresh",
    ["-"]         =  { "actions.parent", mode = "n" },
    ["_"]         =  { "actions.open_cwd", mode = "n" },
    ["`"]         =  { "actions.cd", mode = "n" },
    ["g~"]        =  { "actions.cd", opts = { scope = "tab" }, mode = "n" },
    ["gs"]        =  { "actions.change_sort", mode = "n" },
    ["gx"]        =  "actions.open_external",
    ["g."]        =  { "actions.toggle_hidden", mode = "n" },
    ["g\\"]       =  { "actions.toggle_trash", mode = "n" },
  },
  use_default_keymaps = false,
  view_options = {
    show_hidden = true,
    is_hidden_file = function(name)
      local m = name:match("^%.")
      return m ~= nil
    end,
    is_always_hidden = function(name)
      local m = name:match("^%.%.$")
      return m ~= nil
    end,
    natural_order    = true,
    case_insensitive = false,
    sort = {
      { "type", "asc" },
      { "name", "asc" },
    },
    -- highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
    --   return nil
    -- end,
  },
  -- Extra arguments to pass to SCP when moving/copying files over SSH
  extra_scp_args = {},
  -- Extra arguments to pass to aws s3 when creating/deleting/moving/copying files using aws s3
  extra_s3_args = {},
  -- EXPERIMENTAL support for performing file operations with git
  -- git = {
  --   -- Return true to automatically git add/mv/rm files
  --   add = function(path)
  --     return false
  --   end,
  --   mv = function(src_path, dest_path)
  --     return false
  --   end,
  --   rm = function(path)
  --     return false
  --   end,
  -- },
  -- Configuration for the floating window in oil.open_float
  float = {
    padding       = 2,
    max_width     = 0,
    max_height    = 0,
    border        = nil,
    get_win_title = nil,
    preview_split = "auto",
    win_options = {
      winblend = 0,
    },
    override = function(conf)
      return conf
    end,
  },
  -- Configuration for the file preview window
  -- preview_win = {
  --   -- Whether the preview window is automatically updated when the cursor is moved
  --   update_on_cursor_moved = true,
  --   -- How to open the preview window "load"|"scratch"|"fast_scratch"
  --   preview_method = "fast_scratch",
  --   -- A function that returns true to disable preview on a file e.g. to avoid lag
  --   disable_preview = function(filename)
  --     return false
  --   end,
  --   -- Window-local options to use for preview window buffers
  --   win_options = {},
  -- },
  -- Configuration for the floating action confirmation window
  confirmation = {
    max_width  = 0.9,
    min_width  = { 40, 0.4 },
    width      = nil,
    max_height = 0.9,
    min_height = { 5, 0.1 },
    height     = nil,
    border     = nil,
    win_options = {
      winblend = 0,
    },
  },
  -- Configuration for the floating progress window
  progress = {
    max_width        = 0.9,
    min_width        = { 40, 0.4 },
    width            = nil,
    max_height       = { 10, 0.9 },
    min_height       = { 5, 0.1 },
    height           = nil,
    border           = nil,
    minimized_border = "none",
    win_options = {
      winblend = 0,
    },
  },
  -- TODO: Customize the border for ssh and keymaps

  -- Configuration for the floating SSH window
  ssh = {
    border = nil,
  },
  -- Configuration for the floating keymaps help window
  keymaps_help = {
    border = nil,
  },
})

vim.g.rooter_patterns = {
  ".git",
  ".jj",
  "node_modules",
  "package.json",
  "cargo.toml",
  "project.json",
  ".direnv",
  "dune-project",
  "Dockerfile",
  "docker-compose.yaml",
  "docker-compose.yml",
}

vim.g.rooter_buftypes = { "", "acwrite" }
