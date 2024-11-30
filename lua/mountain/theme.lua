local mountain = require("mountain.colors")

local theme = {}

theme.loadSyntax = function ()
    -- Syntax highlight groups
  local syntax = {
    Type =           { fg = mountain.mizu }, -- int, long, char, etc.
    StorageClass =   { fg = mountain.aki }, -- static, register, volatile, etc.
    Structure =      { fg = mountain.aki }, -- struct, union, enum, etc.
    Constant =       { fg = mountain.usagi }, -- any constant
    String =         { fg = mountain.take, bg = mountain.none, style= 'italic' }, -- Any string
    Character =      { fg = mountain.take }, -- any character constant: 'c', '\n'
    Number =         { fg = mountain.kosumosu }, -- a number constant: 5
    Boolean =        { fg = mountain.aki }, -- a boolean constant: TRUE, false
    Float =          { fg = mountain.kosumosu }, -- a floating point constant: 2.3e10
    Statement =      { fg = mountain.aki }, -- any statement
    Label =          { fg = mountain.aki }, -- case, default, etc.
    Operator =       { fg = mountain.aki }, -- sizeof", "+", "*", etc.
    Exception =      { fg = mountain.aki }, -- try, catch, throw
    PreProc =        { fg = mountain.aki }, -- generic Preprocessor
    Include =        { fg = mountain.aki }, -- preprocessor #include
    Define =         { fg = mountain.aki }, -- preprocessor #define
    Macro =          { fg = mountain.aki }, -- same as Define
    Typedef =        { fg = mountain.aki }, -- A typedef
    PreCondit =      { fg = mountain.ume }, -- preprocessor #if, #else, #endif, etc.
    Special =        { fg = mountain.tetsu, bg = mountain.none, style = "italic" }, -- any special symbol
    SpecialChar =    { fg = mountain.ume }, -- special character in a constant
    Tag =            { fg = mountain.tetsu }, -- you can use CTRL-] on this
    Delimiter =      { fg = mountain.tetsu }, -- character that needs attention like , or .
    SpecialComment = { fg = mountain.chikyu }, -- special things inside a comment
    Debug =          { fg = mountain.take }, -- debugging statements
    Underlined =     { fg = mountain.link, bg = mountain.none, style = 'underline' }, -- text that stands out, HTML links
    Ignore =         { fg = mountain.disabled }, -- left blank, hidden
    Error =          { fg = mountain.error, bg = mountain.none, style = 'bold,underline' }, -- any erroneous construct
    Todo =           { fg = mountain.mountain_ume, bg = mountain.none, style = 'bold,italic' }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Conceal =        { fg = mountain.none, bg = mountain.bg },


    htmlLink = { fg = mountain.link, style = "underline" },
    htmlH1 =   { fg = mountain.kaen, style = "bold" },
    htmlH2 =   { fg = mountain.take, style = "bold" },
    htmlH3 =   { fg = mountain.kosumosu, style = "bold" },
    htmlH4 =   { fg = mountain.kaen, style = "bold" },
    htmlH5 =   { fg = mountain.aki, style = "bold" },
    markdownH1 = { fg = mountain.kaen, style = "bold" },
    markdownH2 = { fg = mountain.take, style = "bold" },
    markdownH3 = { fg = mountain.kosumosu, style = "bold" },
    markdownH1Delimiter = { fg = mountain.kaen },
    markdownH2Delimiter = { fg = mountain.take },
    markdownH3Delimiter = { fg = mountain.kosumosu },
  }

  syntax.Comment =    {fg = mountain.tetsu}
  syntax.Conditional =  {fg = mountain.aki} -- normal if, then, else, endif, switch, etc.
  syntax.Keyword =    {fg = mountain.chikyu, bg = mountain.none, style = "italic"} -- normal for, do, while, etc.
  syntax.Repeat =      {fg = mountain.aki} -- normal any other keyword
  syntax.Function =    {fg = mountain.chikyu}
  syntax.Identifier =      {fg = mountain.aki}; -- any variable name

  return syntax

end


theme.loadEditor = function ()
    -- Editor highlight groups

  local editor = {
    NormalFloat =      { fg = mountain.fg, bg = mountain.float }, -- normal text and background color
    ColorColumn =      { fg = mountain.none, bg = mountain.kasseki }, --  used for the columns set with 'colorcolumn'
    Conceal =          { fg = mountain.disabled }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor =           { fg = mountain.tetsu, bg = mountain.none, style = 'reverse' }, -- the character under the cursor
    CursorIM =         { fg = mountain.cursor, bg = mountain.none, style = 'reverse' }, -- like Cursor, but used when in IME mode
    Directory =        { fg = mountain.yuki, bg = mountain.none }, -- directory names (and other special names in listings)
    DiffAdd =          { fg = mountain.kosumosu, bg = mountain.none, style = 'reverse' }, -- diff mode: Added line
    DiffChange =       { fg = mountain.mizu, bg = mountain.none, style = 'reverse' }, --  diff mode: Changed line
    DiffDelete =       { fg = mountain.take, bg = mountain.none, style = 'reverse' }, -- diff mode: Deleted line
    DiffText =         { fg = mountain.kaen, bg = mountain.none, style = 'reverse' }, -- diff mode: Changed text within a changed line
    EndOfBuffer =      { fg = mountain.disabled },
    ErrorMsg =         { fg = mountain.none },
    Folded =           { fg = mountain.disabled, mountain.none, style = 'italic' },
    FoldColumn =       { fg = mountain.yuki },
    IncSearch =        { fg = mountain.none, bg = mountain.tetsu, style = 'reverse' },
    LineNr =           { fg = mountain.line_numbers },
    CursorLineNr =     { fg = mountain.accent },
    MatchParen =       { fg = mountain.kaen, bg = mountain.none, style = 'bold' },
    ModeMsg =          { fg = mountain.accent },
    MoreMsg =          { fg = mountain.accent },
    NonText =          { fg = mountain.disabled },
    Pmenu =            { fg = mountain.text, bg = mountain.contrast },
    PmenuSel =         { fg = mountain.accent, bg = mountain.active },
    PmenuSbar =        { fg = mountain.text, bg = mountain.contrast },
    PmenuThumb =       { fg = mountain.fg, bg = mountain.accent },
    Question =         { fg = mountain.kosumosu },
    QuickFixLine =     { fg = mountain.highlight, mountain.usagi, style = 'reverse' },
    qfLineNr =         { fg = mountain.highlight, mountain.usagi, style = 'reverse' },
    Search =           { fg = mountain.kasseki, bg = mountain.usagi, style = 'reverse' },
    SpecialKey =       { fg = mountain.aki },
    SpellBad =         { fg = mountain.take, bg = mountain.none, style = 'italic,undercurl' },
    SpellCap =         { fg = mountain.yuki, bg = mountain.none, style = 'italic,undercurl' },
    SpellLocal =       { fg = mountain.kaen, bg = mountain.none, style = 'italic,undercurl' },
    SpellRare =        { fg = mountain.aki, bg = mountain.none, style = 'italic,undercurl' },
    StatusLine =       { fg = mountain.fg, bg = mountain.contrast },
    StatusLineNC =     { fg = mountain.text, bg = mountain.disabled },
    StatusLineTerm =   { fg = mountain.fg, bg = mountain.contrast },
    StatusLineTermNC = { fg = mountain.text, bg = mountain.disabled },
    TabLineFill =      { fg = mountain.fg },
    TablineSel =       { fg = mountain.kaen, bg = mountain.tetsu },
    Tabline =          { fg = mountain.fg },
    Title =            { fg = mountain.kosumosu, bg = mountain.none, style = 'bold' },
    Visual =           { fg = mountain.none, bg = mountain.selection },
    VisualNOS =        { fg = mountain.none, bg = mountain.selection },
    WarningMsg =       { fg = mountain.kaen },
    WildMenu =         { fg = mountain.mizu, bg = mountain.none, style = 'bold' },
    CursorColumn =     { fg = mountain.none, bg = mountain.active },
    CursorLine =       { fg = mountain.none, bg = mountain.cursorlinefg },
    ToolbarLine =      { fg = mountain.fg, bg = mountain.bg_alt },
    ToolbarButton =    { fg = mountain.fg, bg = mountain.none, style = 'bold' },
    NormalMode =       { fg = mountain.accent, bg = mountain.none, style = 'reverse' },
    InsertMode =       { fg = mountain.kosumosu, bg = mountain.none, style = 'reverse' },
    ReplacelMode =     { fg = mountain.take, bg = mountain.none, style = 'reverse' },
    VisualMode =       { fg = mountain.aki, bg = mountain.none, style = 'reverse' },
    CommandMode =      { fg = mountain.tetsu, bg = mountain.none, style = 'reverse' },
    Warnings =         { fg = mountain.kaen },

    healthError =   { fg = mountain.error },
    healthSuccess = { fg = mountain.kosumosu },
    healthWarning = { fg = mountain.kaen },

    -- dashboard
    DashboardShortCut = { fg = mountain.yuki },
    DashboardHeader =   { fg = mountain.aki },
    DashboardCenter =   { fg = mountain.kaen },
    DashboardFooter =   { fg = mountain.kosumosu, style = "italic" },

  }

  -- Options:

  --Set transparent background
  if vim.g.disable_background then
    editor.Normal =     { fg = mountain.fg, bg = mountain.none } -- normal text and background color
    editor.SignColumn = { fg = mountain.fg, bg = mountain.none }
  else
    editor.Normal =     { fg = mountain.fg, bg = mountain.bg } -- normal text and background color
    editor.SignColumn = { fg = mountain.fg, bg = mountain.bg }
  end

  -- Remove window split borders
  if vim.g.borders then
    editor.VertSplit = { fg = mountain.border }
  else
    editor.VertSplit = { fg = mountain.bg }
  end

  return editor
end

theme.loadTerminal = function ()

  vim.g.terminal_color_0 = mountain.kasseki
  vim.g.terminal_color_1 = mountain.take
  vim.g.terminal_color_2 = mountain.kosumosu
  vim.g.terminal_color_3 = mountain.ume
  vim.g.terminal_color_4 = mountain.aki
  vim.g.terminal_color_5 = mountain.kaen
  vim.g.terminal_color_6 = mountain.kaen
  vim.g.terminal_color_7 = mountain.gin
  vim.g.terminal_color_8 = mountain.tetsu
  vim.g.terminal_color_9 = mountain.take
  vim.g.terminal_color_10 = mountain.kosumosu
  vim.g.terminal_color_11 = mountain.ume
  vim.g.terminal_color_12 = mountain.aki
  vim.g.terminal_color_13 = mountain.kaen
  vim.g.terminal_color_14 = mountain.yuki
  vim.g.terminal_color_15 = mountain.usagi

end

theme.loadTreeSitter = function ()
  -- TreeSitter highlight groups

  local treesitter = {
    TSAnnotation =        { fg = mountain.mizu },    -- For C++/Dart attributes, annotations thatcan be attached to the code to denote some kind of meta information.
    TSCharacter=          { fg = mountain.kosumosu },    -- For characters.
    TSConstructor =       { fg = mountain.aki }, -- For constructor calls and definitions: `=                                                                          { }` in Lua, and Java constructors.
    TSConstant =          { fg = mountain.ume },    -- For constants
    TSFloat =             { fg = mountain.kaen },    -- For floats
    TSNumber =            { fg = mountain.kaen },    -- For all number
    TSString =            { fg = mountain.kosumosu },    -- For strings.

    TSAttribute =         { fg = mountain.kaen },    -- (unstable) TODO: docs
    TSBoolean=            { fg = mountain.aki },    -- For booleans.
    TSConstBuiltin =      { fg = mountain.yuki },    -- For constant that are built in the language: `nil` in Lua.
    TSConstMacro =        { fg = mountain.yuki },    -- For constants that are defined by macros: `NULL` in C.
    TSError =             { fg = mountain.error },    -- For syntax/parser errors.
    TSException =         { fg = mountain.kaen },    -- For exception related keywords.
    TSField =             { fg = mountain.tetsu }, -- For fields.
    TSFuncMacro =         { fg = mountain.yuki },    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSInclude =           { fg = mountain.aki },    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSLabel =             { fg = mountain.kaen }, -- For labels: `label:` in C and `:label:` in Lua.
    TSNamespace =         { fg = mountain.tetsu},    -- For identifiers referring to modules and namespaces.
    TSOperator =          { fg = mountain.aki }, -- For any operator: `+`, but also `->` and `*` in C.
    TSParameter =         { fg = mountain.chikyu }, -- For parameters of a function.
    TSParameterReference= { fg = mountain.chikyu },    -- For references to parameters of a function.
    TSProperty =          { fg = mountain.chikyu }, -- Same as `TSField`.
    TSPunctDelimiter =    { fg = mountain.kaen }, -- For delimiters ie: `.`
    TSPunctBracket =      { fg = mountain.kaen }, -- For brackets and parens.
    TSPunctSpecial =      { fg = mountain.kaen }, -- For special punctutation that does not fall in the catagories before.
    TSStringRegex =       { fg = mountain.yuki }, -- For regexes.
    TSStringEscape =      { fg = mountain.disabled }, -- For escape characters within a string.
    TSSymbol =            { fg = mountain.kaen },    -- For identifiers referring to symbols or atoms.
    TSType =              { fg = mountain.aki},    -- For types.
    TSTypeBuiltin =       { fg = mountain.aki},    -- For builtin types.
    TSTag =               { fg = mountain.tetsu },    -- Tags like html tag names.
    TSTagDelimiter =      { fg = mountain.kaen },    -- Tag delimiter like `<` `>` `/`
    TSText =              { fg = mountain.text },    -- For strings considemountain11_gui text in a markup language.
    TSTextReference =     { fg = mountain.kaen }, -- FIXME
    TSEmphasis =          { fg = mountain.chikyu },    -- For text to be represented with emphasis.
    TSUnderline =         { fg = mountain.fg, bg = mountain.none, style = 'underline' },    -- For text to be represented with an underline.
    TSStrike =            { },    -- For strikethrough text.
    TSTitle =             { fg = mountain.chikyu, bg = mountain.none, style = 'bold' },    -- Text that is part of a title.
    TSLiteral =           { fg = mountain.fg },    -- Literal text.
    TSURI =               { fg = mountain.link },    -- Any URI like a link or email.        TSAnnotation =                                                                  { fg = mountain.mountain11_gui },    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.

  }

  treesitter.TSComment=          { fg = mountain.tetsu }
  treesitter.TSConditional =     { fg = mountain.aki }   -- For keywords related to conditionnals.
  treesitter.TSKeyword =         { fg = mountain.aki } -- For keywords that don't fall in previous categories.
  treesitter.TSRepeat =          { fg = mountain.aki }    -- For keywords related to loops.
  treesitter.TSKeywordFunction = { fg = mountain.kaen }
  treesitter.TSFunction =        { fg = mountain.kaen }    -- For fuction (calls and definitions).
  treesitter.TSMethod =          { fg = mountain.yuki }    -- For method calls and definitions.
  treesitter.TSFuncBuiltin =     { fg = mountain.kaen }
  treesitter.TSVariable =        { fg = mountain.accent }-- Any variable name that does not have another highlight.
  treesitter.TSVariableBuiltin = { fg = mountain.accent }

  return treesitter

end

theme.loadLSP = function ()
  -- Lsp highlight groups

  local lsp = {
    LspDiagnosticsDefaultError =           { fg = mountain.error }, -- used for "Error" diagnostic virtual text
    LspDiagnosticsSignError =              { fg = mountain.error }, -- used for "Error" diagnostic signs in sign column
    LspDiagnosticsFloatingError =          { fg = mountain.error }, -- used for "Error" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextError =       { fg = mountain.error }, -- Virtual text "Error"
    LspDiagnosticsUnderlineError =         { style = 'undercurl', sp = mountain.error }, -- used to underline "Error" diagnostics.
    LspDiagnosticsDefaultWarning =         { fg = mountain.kaen}, -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsSignWarning =            { fg = mountain.kaen}, -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsFloatingWarning =        { fg = mountain.kaen}, -- used for "Warning" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextWarning =     { fg = mountain.kaen}, -- Virtual text "Warning"
    LspDiagnosticsUnderlineWarning =       { style = 'undercurl', sp = mountain.kaen }, -- used to underline "Warning" diagnostics.
    LspDiagnosticsDefaultInformation =     { fg = mountain.chikyu }, -- used for "Information" diagnostic virtual text
    LspDiagnosticsSignInformation =        { fg = mountain.chikyu },  -- used for "Information" diagnostic signs in sign column
    LspDiagnosticsFloatingInformation =    { fg = mountain.chikyu }, -- used for "Information" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextInformation = { fg = mountain.chikyu }, -- Virtual text "Information"
    LspDiagnosticsUnderlineInformation =   { style = 'undercurl', sp = mountain.chikyu }, -- used to underline "Information" diagnostics.
    LspDiagnosticsDefaultHint =            { fg = mountain.aki  },  -- used for "Hint" diagnostic virtual text
    LspDiagnosticsSignHint =               { fg = mountain.aki  }, -- used for "Hint" diagnostic signs in sign column
    LspDiagnosticsFloatingHint =           { fg = mountain.aki  }, -- used for "Hint" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextHint =        { fg = mountain.aki  }, -- Virtual text "Hint"
    LspDiagnosticsUnderlineHint =          { style = 'undercurl', sp = mountain.chikyu }, -- used to underline "Hint" diagnostics.
    LspReferenceText =                     { fg = mountain.accent, bg = mountain.highlight }, -- used for highlighting "text" references
    LspReferenceRead =                     { fg = mountain.accent, bg = mountain.highlight }, -- used for highlighting "read" references
    LspReferenceWrite =                    { fg = mountain.accent, bg = mountain.highlight }, -- used for highlighting "write" references
  }

  return lsp

end

theme.loadPlugins = function()
  -- Plugins highlight groups

  local plugins = {

    -- LspTrouble
    LspTroubleText =   { fg = mountain.text },
    LspTroubleCount =  { fg = mountain.aki, bg = mountain.active },
    LspTroubleNormal = { fg = mountain.fg, bg = mountain.sidebar },

    -- Diff
    diffAdded =     { fg = mountain.kosumosu },
    diffRemoved =   { fg = mountain.take },
    diffChanged =   { fg = mountain.kaen },
    diffOldFile =   { fg = mountain.yelow },
    diffNewFile =   { fg = mountain.mizu },
    diffFile =      { fg = mountain.yuki },
    diffLine =      { fg = mountain.comments },
    diffIndexLine = { fg = mountain.aki },

    -- Neogit
    NeogitBranch =               { fg = mountain.chikyu },
    NeogitRemote =               { fg = mountain.aki },
    NeogitHunkHeader =           { fg = mountain.fg, bg = mountain.highlight },
    NeogitHunkHeaderHighlight =  { fg = mountain.yuki, bg = mountain.contrast },
    NeogitDiffContextHighlight = { fg = mountain.bg_alt, bg = mountain.contrast },
    NeogitDiffDeleteHighlight =  { fg = mountain.take },
    NeogitDiffAddHighlight =     { fg = mountain.kosumosu },

    -- GitGutter
    GitGutterAdd =    { fg = mountain.kosumosu }, -- diff mode: Added line |diff.txt|
    GitGutterChange = { fg = mountain.kaen }, -- diff mode: Changed line |diff.txt|
    GitGutterDelete = { fg = mountain.take }, -- diff mode: Deleted line |diff.txt|

    -- GitSigns
    GitSignsAdd =      { fg = mountain.kosumosu }, -- diff mode: Added line |diff.txt|
    GitSignsAddNr =    { fg = mountain.kosumosu }, -- diff mode: Added line |diff.txt|
    GitSignsAddLn =    { fg = mountain.kosumosu }, -- diff mode: Added line |diff.txt|
    GitSignsChange =   { fg = mountain.kaen }, -- diff mode: Changed line |diff.txt|
    GitSignsChangeNr = { fg = mountain.kaen }, -- diff mode: Changed line |diff.txt|
    GitSignsChangeLn = { fg = mountain.kaen }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete =   { fg = mountain.take }, -- diff mode: Deleted line |diff.txt|
    GitSignsDeleteNr = { fg = mountain.take }, -- diff mode: Deleted line |diff.txt|
    GitSignsDeleteLn = { fg = mountain.take }, -- diff mode: Deleted line |diff.txt|

    -- Telescope
    TelescopePromptBorder =   { fg = mountain.kaen },
    TelescopeResultsBorder =  { fg = mountain.aki },
    TelescopePreviewBorder =  { fg = mountain.kosumosu },
    TelescopeSelectionCaret = { fg = mountain.aki },
    TelescopeSelection =      { fg = mountain.aki },
    TelescopeMatching =       { fg = mountain.kaen },
    TelescopeNormal =         { fg = mountain.fg, bg = mountain.float },

    -- NvimTree
    NvimTreeRootFolder =        { fg = mountain.yuki, style = "bold" },
    NvimTreeGitDirty =          { fg = mountain.kaen },
    NvimTreeGitNew =            { fg = mountain.kosumosu },
    NvimTreeImageFile =         { fg = mountain.kaen },
    NvimTreeExecFile =          { fg = mountain.kosumosu },
    NvimTreeSpecialFile =       { fg = mountain.aki , style = "underline" },
    NvimTreeFolderName=         { fg = mountain.chikyu },
    NvimTreeEmptyFolderName=    { fg = mountain.disabled },
    NvimTreeFolderIcon=         { fg = mountain.accent },
    NvimTreeIndentMarker =      { fg  = mountain.disabled },
    LspDiagnosticsError =       { fg = mountain.error },
    LspDiagnosticsWarning =     { fg = mountain.kaen },
    LspDiagnosticsInformation = { fg = mountain.chikyu },
    LspDiagnosticsHint =        { fg = mountain.aki },

    -- WhichKey
    WhichKey =          { fg = mountain.accent , style = 'bold'},
    WhichKeyGroup =     { fg = mountain.text },
    WhichKeyDesc =      { fg = mountain.yuki, style = 'italic' },
    WhichKeySeperator = { fg = mountain.fg },
    WhichKeyFloating =  { bg = mountain.float },
    WhichKeyFloat =     { bg = mountain.float },

    -- LspSaga
    DiagnosticError =            { fg = mountain.error },
    DiagnosticWarning =          { fg = mountain.kaen },
    DiagnosticInformation =      { fg = mountain.chikyu },
    DiagnosticHint =             { fg = mountain.aki },
    DiagnosticTruncateLine =     { fg = mountain.fg },
    LspFloatWinNormal =          { bg = mountain.contrast },
    LspFloatWinBorder =          { fg = mountain.aki },
    LspSagaBorderTitle =         { fg = mountain.kaen },
    LspSagaHoverBorder =         { fg = mountain.chikyu },
    LspSagaRenameBorder =        { fg = mountain.kosumosu },
    LspSagaDefPreviewBorder =    { fg = mountain.kosumosu },
    LspSagaCodeActionBorder =    { fg = mountain.yuki },
    LspSagaFinderSelection =     { fg = mountain.kosumosu },
    LspSagaCodeActionTitle =     { fg = mountain.chikyu },
    LspSagaCodeActionContent =   { fg = mountain.aki },
    LspSagaSignatureHelpBorder = { fg = mountain.ume },
    ReferencesCount =            { fg = mountain.aki },
    DefinitionCount =            { fg = mountain.aki },
    DefinitionIcon =             { fg = mountain.yuki },
    ReferencesIcon =             { fg = mountain.yuki },
    TargetWord =                 { fg = mountain.kaen },

    -- BufferLine
    BufferLineIndicatorSelected = { fg = mountain.bg },
    BufferLineFill =              { bg = mountain.bg },

    -- Sneak
    Sneak =      { fg = mountain.bg, bg = mountain.accent },
    SneakScope = { bg = mountain.selection },

    -- Indent Blankline
    IndentBlanklineChar =        { fg = mountain.tetsu },
    IndentBlanklineContextChar = { fg = mountain.tetsu },

    -- Illuminate
    illuminatedWord =    { bg = mountain.cursorlinefg },
    illuminatedCurWord = { bg = mountain.cursorlinefg },

    -- nvim-dap
    DapBreakpoint = { fg = mountain.kosumosu},
    DapStopped =    { fg = mountain.kaen},

    -- Hop
    HopNextKey =   { fg = mountain.accent, style = 'bold' },
    HopNextKey1 =  { fg = mountain.kaen, style = 'bold' },
    HopNextKey2 =  { fg = mountain.tetsu},
    HopUnmatched = { fg = mountain.comments },

    -- Fern
    FernBranchText = { fg = mountain.tetsu},
  }
  -- Options:

  -- Disable nvim-tree background
  if vim.g.disable_background then
    plugins.NvimTreeNormal = { fg = mountain.fg, bg = mountain.none }
  else
    plugins.NvimTreeNormal = { fg = mountain.fg, bg = mountain.sidebar }
  end

  if vim.g.enable_sidebar_background then
    plugins.NvimTreeNormal = { fg = mountain.fg, bg = mountain.sidebar }
  else
    plugins.NvimTreeNormal = { fg = mountain.fg, bg = mountain.none }
  end

  return plugins

end

return theme
