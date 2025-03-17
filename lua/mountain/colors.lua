local mountain = {
  -- Grayscale
  yoru = "#0f0f0f",
  kasseki = "#191919",
  iwa = "#262626",
  tetsu = "#393939",
  amagumo = "#4c4c4c",
  gin = "#767676",
  okami = "#a0a0a0",
  tsuki = "#bfbfbf",
  fuyu = "#cacaca",
  usagi = "#e7e7e7",
  yuki = "#f0f0f0",
  -- Alphas
  ume = "#8f8aac",
  kosumosu = "#ac8aac",
  chikyu = "#aca98a",
  kaen = "#ac8a8c",
  aki = "#c6a679",
  mizu = "#8aacab",
  take = "#8aac8b",
  shinkai = "#8a98ac",
  -- Accent
  ajisai = "#a39ec4",
  sakura = "#c49ec4",
  suna = "#c4c19e",
  ichigo = "#c49ea0",
  yuyake = "#ceb188",
  sora = "#9ec3c4",
  kusa = "#9ec49f",
  kori = "#a5b4cb",
}

mountain = vim.tbl_deep_extend("keep", mountain, {
  bg = mountain.kasseki,
  bg_alt = mountain.yoru,
  fg = mountain.yuki,
  text = mountain.kaen,
  comments = mountain.amagumo,
  selection = mountain.tetsu,
  contrast = mountain.iwa,
  active = mountain.amagumo,
  border = mountain.aki,
  line_numbers = mountain.fuyu,
  highlight = mountain.aki,
  disabled = mountain.aki,
  cursor = mountain.yuki,
  accent = mountain.kaen,

  error = mountain.ichigo,
  link = mountain.mizu,

  none = "NONE",
})

-- Enable contrast sidebars, floating windows and popup menus
if vim.g.mountain_contrast == true then
  mountain.sidebar = mountain.bg_alt
  mountain.float = mountain.bg_alt
else
  mountain.sidebar = mountain.bg
  mountain.float = mountain.bg
end

if vim.g.mountain_cursorline_transparent == true then
  mountain.cursorlinefg = mountain.bg
else
  mountain.cursorlinefg = mountain.mountain_kasseki
end

return mountain
