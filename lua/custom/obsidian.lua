require("obsidian").setup({
	workspaces = {
		{ name = "personal", path = "~/vaults/personal/" },
	},
	completion = {
		nvim_cmp = true,
		min_chars = 2,
	},
	mappings = {
		["gf"] = {
			action = function()
				return require("obsidian").util.gf_passthrough()
			end,
			opts = { noremap = false, expr = true, buffer = true },
		},
		["<leader>lt"] = {
			action = function()
				return require("obsidian").util.toggle_checkbox()
			end,
			opts = { buffer = true },
		},
		["<leader>lq"] = {
			action = function()
				return require("obsidian").util.smart_action()
			end,
			opts = { buffer = true, expr = true },
		},
	},
	note_path_func = function(spec)
		local path = spec.dir / tostring(spec.title)
		return path:with_suffix(".md")
	end,
	note_frontmatter_func = function(note)
		if note.title then
			note:add_alias(note.title)
		end

		local out = {
			id = note.title,
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
