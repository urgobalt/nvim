local lualine = require("lualine")

local c = {
	-- Basic
	bg = "#1a1a19",
	fg = "#d1d1d1",
	-- Normal
	red = "#ff968c",
	green = "#61957f",
	yellow = "#ffc591",
	blue = "#8db4d4",
	magenta = "#de9bc8",
	cyan = "#7bb099",
	-- Bright
	bright_red = "#ffafa5",
	bright_green = "#7aae98",
	bright_yellow = "#ffdeaa",
	bright_blue = "#a6cded",
	bright_magenta = "#f7b4e1",
	bright_cyan = "#94c9b2",
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
		theme = {
			-- We are going to use lualine_c an lualine_x as left and
			-- right section. Both are highlighted by c theme .  So we
			-- are just setting default looks o statusline
			normal = { c = { fg = c.fg, bg = c.bg } },
			inactive = { c = { fg = c.fg, bg = c.bg } },
		},
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left({
	function()
		return "▊"
	end,
	color = { fg = c.cyan }, -- Sets highlighting of component
	padding = { left = 0, right = 1 }, -- We don't need space before this
})

ins_left({
	-- mode component
	function()
		return ""
	end,
	color = function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = c.red,
			i = c.green,
			v = c.blue,
			[""] = c.blue,
			V = c.blue,
			c = c.magenta,
			no = c.red,
			s = c.orange,
			S = c.orange,
			[""] = c.orange,
			ic = c.yellow,
			R = c.violet,
			Rv = c.violet,
			cv = c.red,
			ce = c.red,
			r = c.cyan,
			rm = c.cyan,
			["r?"] = c.cyan,
			["!"] = c.red,
			t = c.red,
		}
		return { fg = mode_color[vim.fn.mode()] }
	end,
	padding = { right = 1 },
})

ins_left({
	-- filesize component
	"filesize",
	cond = conditions.buffer_not_empty,
})

ins_left({
	"filename",
	cond = conditions.buffer_not_empty,
	color = { fg = c.blue, gui = "italic" },
})

ins_left("location")

ins_left({ "progress", color = { fg = c.fg, gui = "bold" } })

ins_left({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		error = { fg = c.red },
		warn = { fg = c.yellow },
		info = { fg = c.cyan },
	},
})

-- Add components to right sections
ins_right({
	-- Lsp server name .
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = " LSP:",
	color = { fg = c.fg },
})

ins_right({
	"o:encoding", -- option component same as &encoding in viml
	fmt = string.upper, -- I'm not sure why it's upper case either ;)
	cond = conditions.hide_in_width,
	color = { fg = c.green, gui = "bold" },
})

ins_right({
	"FugitiveHead",
	icon = "",
	color = { fg = c.magenta, gui = "bold" },
})

ins_right({
	"diff",
	-- Is it me or the symbol for modified us really weird
	symbols = { added = " ", modified = " ", removed = " " },
	diff_color = {
		added = { fg = c.green },
		modified = { fg = c.orange },
		removed = { fg = c.red },
	},
	cond = conditions.hide_in_width,
})

ins_right({
	function()
		return "▊"
	end,
	color = { fg = c.cyan }, -- Sets highlighting of component
	padding = { left = 0, right = 1 }, -- We don't need space before this
})

-- ins_left({
-- 	"FugitiveHead",
-- 	cond = conditions.check_git_workspace,
-- })

lualine.setup(config)
