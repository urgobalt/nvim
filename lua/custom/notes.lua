function Zettelkasten(title)
  -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
  -- In this case a note with the title 'My new note' will be given an ID that looks
  -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
  local suffix = "unknown"
  if title ~= nil then
    -- If title is given, transform it into valid file name.
    suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
  else
    -- If title is nil, just add 4 random uppercase letters to the suffix.
    for _ = 1, 4 do
      suffix = suffix .. string.char(math.random(65, 90))
    end
  end
  return tostring(os.time()) .. "-" .. suffix
end

local function client_cb(client)
  vim.keymap.set(
    "n",
    "<leader>mo",
    "<CMD>ObsidianOpen<CR>",
    { desc = "Open current buffer in Obsidian" }
  )

  vim.keymap.set(
    "n",
    "<leader>mn",
    "<CMD>ObsidianNew<CR>",
    { desc = "Create a new Obsidian note" }
  )
  vim.keymap.set(
    "v",
    "<leader>mn",
    "<CMD>ObsidianLinkNew<CR>",
    {
      desc = "Create a new Obsidian note using the current selection and link to it",
    }
  )

  vim.keymap.set(
    "n",
    "<leader>mr",
    "<CMD>ObsidianRename<CR>",
    { desc = "Rename current Obsidian note" }
  )
  vim.keymap.set(
    "v",
    "<leader>me",
    "<CMD>ObsidianExtractNote<CR>",
    { desc = "Extract current selection to new note and link to it" }
  )
  vim.keymap.set(
    { "n", "v" },
    "<leader>ml",
    "<CMD>ObsidianLink<CR>",
    { desc = "Link to note" }
  )
  vim.keymap.set(
    "n",
    "<leader>mt",
    "<CMD>ObsidianTags<CR>",
    { desc = "Open notes based on active tags within the vault" }
  )
  vim.keymap.set(
    "n",
    "<leader>mb",
    "<CMD>ObsidianBacklinks<CR>",
    { desc = "Open list of backlinks in current note" }
  )
  vim.keymap.set(
    "n",
    "<leader>m/",
    "<CMD>ObsidianTOC<CR>",
    { desc = "Open table of contents in current picker" }
  )
  vim.keymap.set(
    "n",
    "<leader>mq",
    "<CMD>ObsidianToggleCheckbox<CR>",
    { desc = "Cycle through checkbox states" }
  )

  vim.keymap.set(
    "n",
    "<leader>mp",
    "<CMD>ObsidianPasteImg<CR>",
    { desc = "Paste image into vault and link to it at cursor position" }
  )

  vim.keymap.set("n", "<leader>mz", function()
    local title = vim.fn.input("Zettelkasten title: ")
    local ztitle = Zettelkasten(title)
    vim.cmd("ObsidianRename " .. ztitle)
  end, { desc = "Put zettelkasten based id at cursor location" })
end

local obsidian = require("obsidian")
obsidian.setup({
  workspaces = {
    { name = "personal", path = "~/vaults/personal/" },
  },
  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },
  new_notes_location = "current_dir",
  mappings = {
    ["gf"] = {
      action = function()
        return obsidian.util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
  },
  note_id_func = Zettelkasten,
  note_path_func = function(spec)
    local path = spec.dir / tostring(spec.id)
    return path:with_suffix(".md")
  end,
  note_frontmatter_func = function(note)
    if note.title then
      note:add_alias(note.title)
    end

    local out = {
      id = note.id,
      aliases = note.aliases,
      tags = note.tags,
    }

    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end

    return out
  end,
  follow_url_func = function(url)
    vim.fn.jobstart({ "xdg-open", url })
  end,

  callbacks = {
    post_setup = client_cb,
  },

  preferred_link_style = "markdown",

  ui = { enable = false },
  ---@diagnostic disable
  picker = {
    name = "telescope.nvim",
    mappings = {
      new = "<C-x>",
      insert_link = "<C-l>",
    },
  },
  ---@diagnostic enable
})

vim.api.nvim_create_user_command("Zettelkasten", function(opts)
  local title = ""
  if opts["args"] ~= "" then
    title = opts["args"]
  else
    title = vim.fn.input("Zettelkasten title: ")
  end

  local ztitle = Zettelkasten(title)
  local pos = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  local nline = line:sub(0, pos) .. ztitle .. line:sub(pos + 1)
  vim.api.nvim_set_current_line(nline)
end, { desc = "Paste a string of zettelkasten into buffer", nargs = "?" })

require("render-markdown").setup({
  start_enabled = true,
  checkbox = {
    custom = {
      todo = {
        raw = "[-]",
        rendered = "󰥔 ",
        highlight = "RenderMarkdownTodo",
      },
      arrow = {
        raw = "[>]",
        rendered = " ",
        highlight = "RenderMarkdownHint",
      },
      tilde = {
        raw = "[~]",
        rendered = "󰰱 ",
        highlight = "RenderMarkdownError",
      },
      important = {
        raw = "[!]",
        rendered = " ",
        highlight = "RenderMarkdownWarn",
      },
    },
  },
})
require("autolist").setup({})
