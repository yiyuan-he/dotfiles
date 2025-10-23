-- ==============================================================================
--   Name:        GitHub Light
--   Description: A clean light colorscheme inspired by GitHub's interface
-- ==============================================================================

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.background = "light"
vim.g.colors_name = "github-light"

-- Color palette inspired by GitHub Light
local colors = {
  -- Background/Foreground - clean white
  bg = "#ffffff",
  fg = "#24292f",

  -- Cursor
  cursor = "#0969da",

  -- Selection
  selection_bg = "#ddf4ff",
  selection_fg = "#24292f",

  -- ANSI colors
  black = "#24292f",
  red = "#cf222e",
  green = "#116329",
  yellow = "#9a6700",
  blue = "#0969da",
  magenta = "#8250df",
  cyan = "#1b7c83",
  white = "#ffffff",

  -- Bright colors
  bright_black = "#57606a",
  bright_red = "#a40e26",
  bright_green = "#1a7f37",
  bright_yellow = "#d4a72c",
  bright_blue = "#218bff",
  bright_magenta = "#a475f9",
  bright_cyan = "#3192aa",
  bright_white = "#ffffff",

  -- UI elements
  bg_dark = "#f6f8fa",
  bg_highlight = "#eaeef2",
  comment = "#6e7781",
  line_nr = "#8c959f",
  visual = "#ddf4ff",
  border = "#d0d7de",
  orange = "#bc4c00",
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
hi("FloatBorder", { fg = colors.border, bg = colors.bg_dark })
hi("NormalNC", { fg = colors.fg, bg = colors.bg })

hi("Cursor", { fg = colors.bg, bg = colors.cursor })
hi("lCursor", { fg = colors.bg, bg = colors.cursor })
hi("CursorIM", { fg = colors.bg, bg = colors.cursor })
hi("TermCursor", { fg = colors.bg, bg = colors.cursor })
hi("TermCursorNC", { fg = colors.bg, bg = colors.cursor })

hi("CursorLine", { bg = colors.bg_dark })
hi("CursorColumn", { bg = colors.bg_dark })
hi("ColorColumn", { bg = colors.bg_dark })

hi("LineNr", { fg = colors.line_nr })
hi("CursorLineNr", { fg = colors.fg, style = "bold" })
hi("SignColumn", { fg = colors.line_nr, bg = colors.bg })
hi("FoldColumn", { fg = colors.line_nr, bg = colors.bg })

hi("Folded", { fg = colors.comment, bg = colors.bg_highlight })
hi("VertSplit", { fg = colors.border })
hi("StatusLine", { fg = colors.fg, bg = colors.bg_dark })
hi("StatusLineNC", { fg = colors.comment, bg = colors.bg_dark })

hi("Pmenu", { fg = colors.fg, bg = colors.bg_highlight })
hi("PmenuSel", { fg = colors.bg, bg = colors.blue })
hi("PmenuSbar", { bg = colors.bg_highlight })
hi("PmenuThumb", { bg = colors.comment })

hi("TabLine", { fg = colors.comment, bg = colors.bg_dark })
hi("TabLineFill", { bg = colors.bg_dark })
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
hi("Title", { fg = colors.blue, style = "bold" })
hi("Question", { fg = colors.green })
hi("MoreMsg", { fg = colors.green })
hi("ModeMsg", { fg = colors.fg })

hi("WildMenu", { fg = colors.bg, bg = colors.blue })
hi("Conceal", { fg = colors.comment })

-- Diagnostics
hi("DiagnosticError", { fg = colors.red })
hi("DiagnosticWarn", { fg = colors.orange })
hi("DiagnosticInfo", { fg = colors.blue })
hi("DiagnosticHint", { fg = colors.comment })
hi("DiagnosticOk", { fg = colors.green })

hi("DiagnosticUnderlineError", { sp = colors.red, style = "underline" })
hi("DiagnosticUnderlineWarn", { sp = colors.orange, style = "underline" })
hi("DiagnosticUnderlineInfo", { sp = colors.blue, style = "underline" })
hi("DiagnosticUnderlineHint", { sp = colors.comment, style = "underline" })
hi("DiagnosticUnderlineOk", { sp = colors.green, style = "underline" })

hi("DiagnosticVirtualTextError", { fg = colors.red })
hi("DiagnosticVirtualTextWarn", { fg = colors.orange })
hi("DiagnosticVirtualTextInfo", { fg = colors.blue })
hi("DiagnosticVirtualTextHint", { fg = colors.comment })

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

hi("Constant", { fg = colors.blue })
hi("String", { fg = colors.cyan })
hi("Character", { fg = colors.cyan })
hi("Number", { fg = colors.blue })
hi("Boolean", { fg = colors.blue })
hi("Float", { fg = colors.blue })

hi("Identifier", { fg = colors.fg })
hi("Function", { fg = colors.magenta })

hi("Statement", { fg = colors.red })
hi("Conditional", { fg = colors.red })
hi("Repeat", { fg = colors.red })
hi("Label", { fg = colors.red })
hi("Operator", { fg = colors.fg })
hi("Keyword", { fg = colors.red })
hi("Exception", { fg = colors.red })

hi("PreProc", { fg = colors.red })
hi("Include", { fg = colors.red })
hi("Define", { fg = colors.red })
hi("Macro", { fg = colors.red })
hi("PreCondit", { fg = colors.red })

hi("Type", { fg = colors.red })
hi("StorageClass", { fg = colors.red })
hi("Structure", { fg = colors.red })
hi("Typedef", { fg = colors.red })

hi("Special", { fg = colors.blue })
hi("SpecialChar", { fg = colors.blue })
hi("Tag", { fg = colors.green })
hi("Delimiter", { fg = colors.fg })
hi("SpecialComment", { fg = colors.comment, style = "italic" })
hi("Debug", { fg = colors.orange })

hi("Underlined", { style = "underline" })
hi("Ignore", { fg = colors.comment })
hi("Error", { fg = colors.red, bg = colors.bg })
hi("Todo", { fg = colors.magenta, bg = colors.bg, style = "bold" })

-- Treesitter
hi("@variable", { fg = colors.fg })
hi("@variable.builtin", { fg = colors.blue })
hi("@variable.parameter", { fg = colors.fg })
hi("@variable.member", { fg = colors.fg })

hi("@constant", { fg = colors.blue })
hi("@constant.builtin", { fg = colors.blue })
hi("@constant.macro", { fg = colors.blue })

hi("@module", { fg = colors.fg })
hi("@label", { fg = colors.fg })

hi("@string", { fg = colors.cyan })
hi("@string.regexp", { fg = colors.cyan })
hi("@string.escape", { fg = colors.blue })

hi("@character", { fg = colors.cyan })
hi("@character.special", { fg = colors.blue })

hi("@number", { fg = colors.blue })
hi("@boolean", { fg = colors.blue })
hi("@float", { fg = colors.blue })

hi("@function", { fg = colors.magenta })
hi("@function.builtin", { fg = colors.magenta })
hi("@function.macro", { fg = colors.magenta })
hi("@function.method", { fg = colors.magenta })

hi("@constructor", { fg = colors.red })
hi("@operator", { fg = colors.fg })

hi("@keyword", { fg = colors.red })
hi("@keyword.function", { fg = colors.red })
hi("@keyword.operator", { fg = colors.red })
hi("@keyword.return", { fg = colors.red })
hi("@keyword.conditional", { fg = colors.red })
hi("@keyword.repeat", { fg = colors.red })
hi("@keyword.import", { fg = colors.red })

hi("@type", { fg = colors.red })
hi("@type.builtin", { fg = colors.red })
hi("@type.qualifier", { fg = colors.red })

hi("@property", { fg = colors.fg })
hi("@attribute", { fg = colors.fg })

hi("@comment", { fg = colors.comment, style = "italic" })

hi("@punctuation.delimiter", { fg = colors.fg })
hi("@punctuation.bracket", { fg = colors.fg })
hi("@punctuation.special", { fg = colors.fg })

hi("@tag", { fg = colors.green })
hi("@tag.attribute", { fg = colors.fg })
hi("@tag.delimiter", { fg = colors.fg })

hi("@markup.strong", { style = "bold" })
hi("@markup.italic", { style = "italic" })
hi("@markup.underline", { style = "underline" })
hi("@markup.strikethrough", { style = "strikethrough" })
hi("@markup.heading", { fg = colors.blue, style = "bold" })
hi("@markup.link", { fg = colors.blue, style = "underline" })
hi("@markup.link.url", { fg = colors.blue, style = "underline" })
hi("@markup.raw", { fg = colors.cyan })
hi("@markup.math", { fg = colors.blue })

hi("@diff.plus", { fg = colors.green })
hi("@diff.minus", { fg = colors.red })
hi("@diff.delta", { fg = colors.orange })

-- LSP Semantic Tokens
hi("@lsp.type.class", { fg = colors.red })
hi("@lsp.type.decorator", { fg = colors.magenta })
hi("@lsp.type.enum", { fg = colors.red })
hi("@lsp.type.enumMember", { fg = colors.blue })
hi("@lsp.type.function", { fg = colors.magenta })
hi("@lsp.type.interface", { fg = colors.red })
hi("@lsp.type.macro", { fg = colors.magenta })
hi("@lsp.type.method", { fg = colors.magenta })
hi("@lsp.type.namespace", { fg = colors.fg })
hi("@lsp.type.parameter", { fg = colors.fg })
hi("@lsp.type.property", { fg = colors.fg })
hi("@lsp.type.struct", { fg = colors.red })
hi("@lsp.type.type", { fg = colors.red })
hi("@lsp.type.typeParameter", { fg = colors.red })
hi("@lsp.type.variable", { fg = colors.fg })

-- Git Signs
hi("GitSignsAdd", { fg = colors.green })
hi("GitSignsChange", { fg = colors.orange })
hi("GitSignsDelete", { fg = colors.red })

-- Telescope
hi("TelescopeBorder", { fg = colors.border })
hi("TelescopePromptBorder", { fg = colors.border })
hi("TelescopeResultsBorder", { fg = colors.border })
hi("TelescopePreviewBorder", { fg = colors.border })
hi("TelescopeSelection", { fg = colors.fg, bg = colors.bg_highlight })
hi("TelescopeSelectionCaret", { fg = colors.blue })
hi("TelescopeMultiSelection", { fg = colors.blue })
hi("TelescopeMatching", { fg = colors.blue, style = "bold" })

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
