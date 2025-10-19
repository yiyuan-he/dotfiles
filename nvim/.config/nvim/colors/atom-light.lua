-- ==============================================================================
--   Name:        Atom Light
--   Description: A light colorscheme inspired by Atom One Light
-- ==============================================================================

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.background = "light"
vim.g.colors_name = "atom-light"

-- Color palette based on Atom One Light
local colors = {
  -- Background/Foreground
  bg = "#fafafa",
  fg = "#383a42",

  -- Cursor
  cursor = "#526fff",

  -- Selection
  selection_bg = "#e5e5e6",
  selection_fg = "#383a42",

  -- ANSI colors (palette 0-15)
  black = "#000000",
  red = "#e45649",
  green = "#50a14f",
  yellow = "#c18401",
  blue = "#4078f2",
  magenta = "#a626a4",
  cyan = "#0184bc",
  white = "#fafafa",

  -- Bright colors
  bright_black = "#5c6370",
  bright_red = "#e06c75",
  bright_green = "#98c379",
  bright_yellow = "#e5c07b",
  bright_blue = "#61afef",
  bright_magenta = "#c678dd",
  bright_cyan = "#56b6c2",
  bright_white = "#ffffff",

  -- UI elements (derived colors)
  bg_dark = "#f0f0f0",
  bg_highlight = "#e5e5e6",
  comment = "#a0a1a7",
  line_nr = "#9d9d9f",
  visual = "#d0d0d0",
  border = "#d7dae0",
  orange = "#d75f00",
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
hi("CursorLineNr", { fg = colors.fg, style = "bold" })
hi("SignColumn", { fg = colors.line_nr, bg = colors.bg })
hi("FoldColumn", { fg = colors.line_nr, bg = colors.bg })

hi("Folded", { fg = colors.comment, bg = colors.bg_highlight })
hi("VertSplit", { fg = colors.border })
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
hi("IncSearch", { fg = colors.bg, bg = colors.cyan })
hi("CurSearch", { fg = colors.bg, bg = colors.cyan })

hi("MatchParen", { fg = colors.blue, style = "bold,underline" })
hi("Whitespace", { fg = colors.border })
hi("NonText", { fg = colors.border })
hi("SpecialKey", { fg = colors.border })

hi("Directory", { fg = colors.blue })
hi("Title", { fg = colors.magenta, style = "bold" })
hi("Question", { fg = colors.green })
hi("MoreMsg", { fg = colors.green })
hi("ModeMsg", { fg = colors.fg })

hi("WildMenu", { fg = colors.bg, bg = colors.blue })
hi("Conceal", { fg = colors.comment })

-- Diagnostics
hi("DiagnosticError", { fg = colors.red })
hi("DiagnosticWarn", { fg = colors.orange })
hi("DiagnosticInfo", { fg = colors.cyan })
hi("DiagnosticHint", { fg = colors.blue })
hi("DiagnosticOk", { fg = colors.green })

hi("DiagnosticUnderlineError", { sp = colors.red, style = "underline" })
hi("DiagnosticUnderlineWarn", { sp = colors.orange, style = "underline" })
hi("DiagnosticUnderlineInfo", { sp = colors.cyan, style = "underline" })
hi("DiagnosticUnderlineHint", { sp = colors.blue, style = "underline" })
hi("DiagnosticUnderlineOk", { sp = colors.green, style = "underline" })

hi("DiagnosticVirtualTextError", { fg = colors.red })
hi("DiagnosticVirtualTextWarn", { fg = colors.orange })
hi("DiagnosticVirtualTextInfo", { fg = colors.cyan })
hi("DiagnosticVirtualTextHint", { fg = colors.blue })

hi("ErrorMsg", { fg = colors.red })
hi("WarningMsg", { fg = colors.orange })

-- Diff
hi("DiffAdd", { fg = colors.green, bg = colors.bg_dark })
hi("DiffChange", { fg = colors.orange, bg = colors.bg_dark })
hi("DiffDelete", { fg = colors.red, bg = colors.bg_dark })
hi("DiffText", { fg = colors.blue, bg = colors.bg_dark, style = "bold" })

hi("diffAdded", { fg = colors.green })
hi("diffRemoved", { fg = colors.red })
hi("diffChanged", { fg = colors.orange })
hi("diffFile", { fg = colors.magenta })
hi("diffNewFile", { fg = colors.green })
hi("diffOldFile", { fg = colors.red })
hi("diffLine", { fg = colors.cyan })

-- Syntax highlighting
hi("Comment", { fg = colors.comment, style = "italic" })

hi("Constant", { fg = colors.cyan })
hi("String", { fg = colors.green })
hi("Character", { fg = colors.green })
hi("Number", { fg = colors.orange })
hi("Boolean", { fg = colors.orange })
hi("Float", { fg = colors.orange })

hi("Identifier", { fg = colors.fg })
hi("Function", { fg = colors.blue })

hi("Statement", { fg = colors.magenta })
hi("Conditional", { fg = colors.magenta })
hi("Repeat", { fg = colors.magenta })
hi("Label", { fg = colors.magenta })
hi("Operator", { fg = colors.cyan })
hi("Keyword", { fg = colors.magenta })
hi("Exception", { fg = colors.magenta })

hi("PreProc", { fg = colors.yellow })
hi("Include", { fg = colors.magenta })
hi("Define", { fg = colors.magenta })
hi("Macro", { fg = colors.yellow })
hi("PreCondit", { fg = colors.yellow })

hi("Type", { fg = colors.yellow })
hi("StorageClass", { fg = colors.magenta })
hi("Structure", { fg = colors.yellow })
hi("Typedef", { fg = colors.yellow })

hi("Special", { fg = colors.cyan })
hi("SpecialChar", { fg = colors.cyan })
hi("Tag", { fg = colors.red })
hi("Delimiter", { fg = colors.fg })
hi("SpecialComment", { fg = colors.comment, style = "italic" })
hi("Debug", { fg = colors.red })

hi("Underlined", { style = "underline" })
hi("Ignore", { fg = colors.comment })
hi("Error", { fg = colors.red, bg = colors.bg })
hi("Todo", { fg = colors.magenta, bg = colors.bg, style = "bold" })

-- Treesitter
hi("@variable", { fg = colors.red })
hi("@variable.builtin", { fg = colors.orange })
hi("@variable.parameter", { fg = colors.red })
hi("@variable.member", { fg = colors.red })

hi("@constant", { fg = colors.orange })
hi("@constant.builtin", { fg = colors.orange })
hi("@constant.macro", { fg = colors.orange })

hi("@module", { fg = colors.red })
hi("@label", { fg = colors.magenta })

hi("@string", { fg = colors.green })
hi("@string.regexp", { fg = colors.cyan })
hi("@string.escape", { fg = colors.cyan })

hi("@character", { fg = colors.green })
hi("@character.special", { fg = colors.cyan })

hi("@number", { fg = colors.orange })
hi("@boolean", { fg = colors.orange })
hi("@float", { fg = colors.orange })

hi("@function", { fg = colors.blue })
hi("@function.builtin", { fg = colors.cyan })
hi("@function.macro", { fg = colors.yellow })
hi("@function.method", { fg = colors.blue })

hi("@constructor", { fg = colors.yellow })
hi("@operator", { fg = colors.cyan })

hi("@keyword", { fg = colors.magenta })
hi("@keyword.function", { fg = colors.magenta })
hi("@keyword.operator", { fg = colors.magenta })
hi("@keyword.return", { fg = colors.magenta })
hi("@keyword.conditional", { fg = colors.magenta })
hi("@keyword.repeat", { fg = colors.magenta })
hi("@keyword.import", { fg = colors.magenta })

hi("@type", { fg = colors.yellow })
hi("@type.builtin", { fg = colors.yellow })
hi("@type.qualifier", { fg = colors.magenta })

hi("@property", { fg = colors.red })
hi("@attribute", { fg = colors.yellow })

hi("@comment", { fg = colors.comment, style = "italic" })

hi("@punctuation.delimiter", { fg = colors.fg })
hi("@punctuation.bracket", { fg = colors.fg })
hi("@punctuation.special", { fg = colors.cyan })

hi("@tag", { fg = colors.red })
hi("@tag.attribute", { fg = colors.orange })
hi("@tag.delimiter", { fg = colors.fg })

hi("@markup.strong", { style = "bold" })
hi("@markup.italic", { style = "italic" })
hi("@markup.underline", { style = "underline" })
hi("@markup.strikethrough", { style = "strikethrough" })
hi("@markup.heading", { fg = colors.red, style = "bold" })
hi("@markup.link", { fg = colors.blue, style = "underline" })
hi("@markup.link.url", { fg = colors.cyan, style = "underline" })
hi("@markup.raw", { fg = colors.green })
hi("@markup.math", { fg = colors.orange })

hi("@diff.plus", { fg = colors.green })
hi("@diff.minus", { fg = colors.red })
hi("@diff.delta", { fg = colors.orange })

-- LSP Semantic Tokens
hi("@lsp.type.class", { fg = colors.yellow })
hi("@lsp.type.decorator", { fg = colors.blue })
hi("@lsp.type.enum", { fg = colors.yellow })
hi("@lsp.type.enumMember", { fg = colors.cyan })
hi("@lsp.type.function", { fg = colors.blue })
hi("@lsp.type.interface", { fg = colors.yellow })
hi("@lsp.type.macro", { fg = colors.yellow })
hi("@lsp.type.method", { fg = colors.blue })
hi("@lsp.type.namespace", { fg = colors.yellow })
hi("@lsp.type.parameter", { fg = colors.red })
hi("@lsp.type.property", { fg = colors.red })
hi("@lsp.type.struct", { fg = colors.yellow })
hi("@lsp.type.type", { fg = colors.yellow })
hi("@lsp.type.typeParameter", { fg = colors.yellow })
hi("@lsp.type.variable", { fg = colors.red })

-- Git Signs
hi("GitSignsAdd", { fg = colors.green })
hi("GitSignsChange", { fg = colors.orange })
hi("GitSignsDelete", { fg = colors.red })

-- Telescope
hi("TelescopeBorder", { fg = colors.blue })
hi("TelescopePromptBorder", { fg = colors.blue })
hi("TelescopeResultsBorder", { fg = colors.blue })
hi("TelescopePreviewBorder", { fg = colors.blue })
hi("TelescopeSelection", { fg = colors.fg, bg = colors.bg_highlight })
hi("TelescopeSelectionCaret", { fg = colors.magenta })
hi("TelescopeMultiSelection", { fg = colors.magenta })
hi("TelescopeMatching", { fg = colors.cyan, style = "bold" })

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
