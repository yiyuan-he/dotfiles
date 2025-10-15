-- ==============================================================================
--   Name:        Elegant
--   Description: An elegant dark colorscheme
-- ==============================================================================

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "elegant"

-- Color palette from your terminal config
local colors = {
  -- Background/Foreground
  bg = "#292b31",
  fg = "#ced2d6",

  -- Cursor
  cursor = "#00beff",

  -- Selection
  selection_bg = "#d5d5d5",
  selection_fg = "#144385",

  -- ANSI colors (palette 0-15)
  black = "#0a1222",
  red = "#ff0257",
  green = "#85cc95",
  yellow = "#ffcb8b",
  blue = "#8dabe1",
  magenta = "#c792eb",
  cyan = "#78ccf0",
  white = "#ffffff",

  -- Bright colors
  bright_black = "#575656",
  bright_red = "#ff0057",
  bright_green = "#85cc95",
  bright_yellow = "#ffcb8b",
  bright_blue = "#8dabe1",
  bright_magenta = "#c792eb",
  bright_cyan = "#3facef",
  bright_white = "#ffffff",

  -- UI elements (derived colors)
  bg_dark = "#1a1c22",
  bg_highlight = "#33353b",
  comment = "#7a7d85",
  line_nr = "#555761",
  visual = "#3a3c48",
  none = "NONE",
}

-- Helper function to set highlights
local function hi(group, opts)
  local cmd = "highlight " .. group
  if opts.fg then cmd = cmd .. " guifg=" .. opts.fg end
  if opts.bg then cmd = cmd .. " guibg=" .. opts.bg end
  if opts.style then cmd = cmd .. " gui=" .. opts.style end
  if opts.sp then cmd = cmd .. " guisp=" .. opts.sp end
  vim.cmd(cmd)
end

-- Editor UI
hi("Normal", { fg = colors.fg, bg = colors.bg })
hi("NormalFloat", { fg = colors.fg, bg = colors.bg_dark })
hi("FloatBorder", { fg = colors.blue, bg = colors.bg_dark })
hi("NormalNC", { fg = colors.fg, bg = colors.bg })

hi("Cursor", { fg = colors.bg, bg = colors.cursor })
hi("lCursor", { fg = colors.bg, bg = colors.cursor })
hi("CursorIM", { fg = colors.bg, bg = colors.cursor })
hi("TermCursor", { fg = colors.bg, bg = colors.cursor })
hi("TermCursorNC", { fg = colors.bg, bg = colors.cursor })

hi("CursorLine", { bg = colors.bg_highlight })
hi("CursorColumn", { bg = colors.bg_highlight })
hi("ColorColumn", { bg = colors.bg_highlight })

hi("LineNr", { fg = colors.line_nr })
hi("CursorLineNr", { fg = colors.yellow, style = "bold" })
hi("SignColumn", { fg = colors.line_nr, bg = colors.bg })
hi("FoldColumn", { fg = colors.line_nr, bg = colors.bg })

hi("Folded", { fg = colors.comment, bg = colors.bg_highlight })
hi("VertSplit", { fg = colors.bright_black })
hi("StatusLine", { fg = colors.fg, bg = colors.bg_highlight })
hi("StatusLineNC", { fg = colors.comment, bg = colors.bg_highlight })

hi("Pmenu", { fg = colors.fg, bg = colors.bg_highlight })
hi("PmenuSel", { fg = colors.bg, bg = colors.blue })
hi("PmenuSbar", { bg = colors.bg_highlight })
hi("PmenuThumb", { bg = colors.comment })

hi("TabLine", { fg = colors.comment, bg = colors.bg_highlight })
hi("TabLineFill", { bg = colors.bg_highlight })
hi("TabLineSel", { fg = colors.fg, bg = colors.bg })

hi("Visual", { bg = colors.visual })
hi("VisualNOS", { bg = colors.visual })

hi("Search", { fg = colors.bg, bg = colors.yellow })
hi("IncSearch", { fg = colors.bg, bg = colors.bright_cyan })
hi("CurSearch", { fg = colors.bg, bg = colors.bright_cyan })

hi("MatchParen", { fg = colors.bright_cyan, style = "bold,underline" })
hi("Whitespace", { fg = colors.bright_black })
hi("NonText", { fg = colors.bright_black })
hi("SpecialKey", { fg = colors.bright_black })

hi("Directory", { fg = colors.blue })
hi("Title", { fg = colors.magenta, style = "bold" })
hi("Question", { fg = colors.green })
hi("MoreMsg", { fg = colors.green })
hi("ModeMsg", { fg = colors.fg })

hi("WildMenu", { fg = colors.bg, bg = colors.blue })
hi("Conceal", { fg = colors.comment })

-- Diagnostics
hi("DiagnosticError", { fg = colors.red })
hi("DiagnosticWarn", { fg = colors.yellow })
hi("DiagnosticInfo", { fg = colors.bright_cyan })
hi("DiagnosticHint", { fg = colors.cyan })
hi("DiagnosticOk", { fg = colors.green })

hi("DiagnosticUnderlineError", { sp = colors.red, style = "underline" })
hi("DiagnosticUnderlineWarn", { sp = colors.yellow, style = "underline" })
hi("DiagnosticUnderlineInfo", { sp = colors.bright_cyan, style = "underline" })
hi("DiagnosticUnderlineHint", { sp = colors.cyan, style = "underline" })
hi("DiagnosticUnderlineOk", { sp = colors.green, style = "underline" })

hi("DiagnosticVirtualTextError", { fg = colors.red })
hi("DiagnosticVirtualTextWarn", { fg = colors.yellow })
hi("DiagnosticVirtualTextInfo", { fg = colors.bright_cyan })
hi("DiagnosticVirtualTextHint", { fg = colors.cyan })

hi("ErrorMsg", { fg = colors.red })
hi("WarningMsg", { fg = colors.yellow })

-- Diff
hi("DiffAdd", { fg = colors.green, bg = colors.bg_dark })
hi("DiffChange", { fg = colors.yellow, bg = colors.bg_dark })
hi("DiffDelete", { fg = colors.red, bg = colors.bg_dark })
hi("DiffText", { fg = colors.blue, bg = colors.bg_dark, style = "bold" })

hi("diffAdded", { fg = colors.green })
hi("diffRemoved", { fg = colors.red })
hi("diffChanged", { fg = colors.yellow })
hi("diffFile", { fg = colors.magenta })
hi("diffNewFile", { fg = colors.green })
hi("diffOldFile", { fg = colors.red })
hi("diffLine", { fg = colors.bright_cyan })

-- Syntax highlighting
hi("Comment", { fg = colors.comment, style = "italic" })

hi("Constant", { fg = colors.cyan })
hi("String", { fg = colors.green })
hi("Character", { fg = colors.green })
hi("Number", { fg = colors.yellow })
hi("Boolean", { fg = colors.yellow })
hi("Float", { fg = colors.yellow })

hi("Identifier", { fg = colors.fg })
hi("Function", { fg = colors.blue })

hi("Statement", { fg = colors.magenta })
hi("Conditional", { fg = colors.magenta })
hi("Repeat", { fg = colors.magenta })
hi("Label", { fg = colors.magenta })
hi("Operator", { fg = colors.bright_cyan })
hi("Keyword", { fg = colors.magenta })
hi("Exception", { fg = colors.red })

hi("PreProc", { fg = colors.cyan })
hi("Include", { fg = colors.magenta })
hi("Define", { fg = colors.magenta })
hi("Macro", { fg = colors.cyan })
hi("PreCondit", { fg = colors.cyan })

hi("Type", { fg = colors.cyan })
hi("StorageClass", { fg = colors.magenta })
hi("Structure", { fg = colors.cyan })
hi("Typedef", { fg = colors.cyan })

hi("Special", { fg = colors.bright_cyan })
hi("SpecialChar", { fg = colors.bright_cyan })
hi("Tag", { fg = colors.magenta })
hi("Delimiter", { fg = colors.fg })
hi("SpecialComment", { fg = colors.comment, style = "italic" })
hi("Debug", { fg = colors.red })

hi("Underlined", { style = "underline" })
hi("Ignore", { fg = colors.comment })
hi("Error", { fg = colors.red, bg = colors.bg })
hi("Todo", { fg = colors.magenta, bg = colors.bg, style = "bold" })

-- Treesitter
hi("@variable", { fg = colors.fg })
hi("@variable.builtin", { fg = colors.red })
hi("@variable.parameter", { fg = colors.fg })
hi("@variable.member", { fg = colors.cyan })

hi("@constant", { fg = colors.cyan })
hi("@constant.builtin", { fg = colors.yellow })
hi("@constant.macro", { fg = colors.cyan })

hi("@module", { fg = colors.cyan })
hi("@label", { fg = colors.magenta })

hi("@string", { fg = colors.green })
hi("@string.regexp", { fg = colors.bright_cyan })
hi("@string.escape", { fg = colors.bright_cyan })

hi("@character", { fg = colors.green })
hi("@character.special", { fg = colors.bright_cyan })

hi("@number", { fg = colors.yellow })
hi("@boolean", { fg = colors.yellow })
hi("@float", { fg = colors.yellow })

hi("@function", { fg = colors.blue })
hi("@function.builtin", { fg = colors.blue })
hi("@function.macro", { fg = colors.cyan })
hi("@function.method", { fg = colors.blue })

hi("@constructor", { fg = colors.cyan })
hi("@operator", { fg = colors.bright_cyan })

hi("@keyword", { fg = colors.magenta })
hi("@keyword.function", { fg = colors.magenta })
hi("@keyword.operator", { fg = colors.magenta })
hi("@keyword.return", { fg = colors.magenta })
hi("@keyword.conditional", { fg = colors.magenta })
hi("@keyword.repeat", { fg = colors.magenta })
hi("@keyword.import", { fg = colors.magenta })

hi("@type", { fg = colors.cyan })
hi("@type.builtin", { fg = colors.cyan })
hi("@type.qualifier", { fg = colors.magenta })

hi("@property", { fg = colors.cyan })
hi("@attribute", { fg = colors.cyan })

hi("@comment", { fg = colors.comment, style = "italic" })

hi("@punctuation.delimiter", { fg = colors.fg })
hi("@punctuation.bracket", { fg = colors.fg })
hi("@punctuation.special", { fg = colors.bright_cyan })

hi("@tag", { fg = colors.magenta })
hi("@tag.attribute", { fg = colors.cyan })
hi("@tag.delimiter", { fg = colors.fg })

hi("@markup.strong", { style = "bold" })
hi("@markup.italic", { style = "italic" })
hi("@markup.underline", { style = "underline" })
hi("@markup.strikethrough", { style = "strikethrough" })
hi("@markup.heading", { fg = colors.magenta, style = "bold" })
hi("@markup.link", { fg = colors.bright_cyan, style = "underline" })
hi("@markup.link.url", { fg = colors.cyan, style = "underline" })
hi("@markup.raw", { fg = colors.green })
hi("@markup.math", { fg = colors.cyan })

hi("@diff.plus", { fg = colors.green })
hi("@diff.minus", { fg = colors.red })
hi("@diff.delta", { fg = colors.yellow })

-- LSP Semantic Tokens
hi("@lsp.type.class", { fg = colors.cyan })
hi("@lsp.type.decorator", { fg = colors.cyan })
hi("@lsp.type.enum", { fg = colors.cyan })
hi("@lsp.type.enumMember", { fg = colors.cyan })
hi("@lsp.type.function", { fg = colors.blue })
hi("@lsp.type.interface", { fg = colors.cyan })
hi("@lsp.type.macro", { fg = colors.cyan })
hi("@lsp.type.method", { fg = colors.blue })
hi("@lsp.type.namespace", { fg = colors.cyan })
hi("@lsp.type.parameter", { fg = colors.fg })
hi("@lsp.type.property", { fg = colors.cyan })
hi("@lsp.type.struct", { fg = colors.cyan })
hi("@lsp.type.type", { fg = colors.cyan })
hi("@lsp.type.typeParameter", { fg = colors.cyan })
hi("@lsp.type.variable", { fg = colors.fg })

-- Git Signs
hi("GitSignsAdd", { fg = colors.green })
hi("GitSignsChange", { fg = colors.yellow })
hi("GitSignsDelete", { fg = colors.red })

-- Telescope
hi("TelescopeBorder", { fg = colors.blue })
hi("TelescopePromptBorder", { fg = colors.blue })
hi("TelescopeResultsBorder", { fg = colors.blue })
hi("TelescopePreviewBorder", { fg = colors.blue })
hi("TelescopeSelection", { fg = colors.fg, bg = colors.bg_highlight })
hi("TelescopeSelectionCaret", { fg = colors.magenta })
hi("TelescopeMultiSelection", { fg = colors.magenta })
hi("TelescopeMatching", { fg = colors.bright_cyan, style = "bold" })

-- Terminal colors
vim.g.terminal_color_0 = colors.black
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.blue
vim.g.terminal_color_5 = colors.magenta
vim.g.terminal_color_6 = colors.cyan
vim.g.terminal_color_7 = colors.white
vim.g.terminal_color_8 = colors.bright_black
vim.g.terminal_color_9 = colors.bright_red
vim.g.terminal_color_10 = colors.bright_green
vim.g.terminal_color_11 = colors.bright_yellow
vim.g.terminal_color_12 = colors.bright_blue
vim.g.terminal_color_13 = colors.bright_magenta
vim.g.terminal_color_14 = colors.bright_cyan
vim.g.terminal_color_15 = colors.bright_white
