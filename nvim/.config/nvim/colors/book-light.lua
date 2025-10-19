-- ==============================================================================
--   Name:        Book Light
--   Description: A warm, soft light colorscheme inspired by the Rust Programming Language book
--                Designed to be easy on the eyes, especially for people with astigmatism
-- ==============================================================================

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.background = "light"
vim.g.colors_name = "book-light"

-- Color palette inspired by the Rust book
-- Using warm, softer tones with reduced contrast for better readability
local colors = {
  -- Background/Foreground - warm cream instead of harsh white
  bg = "#f4f0ed",
  fg = "#3e3933",

  -- Cursor
  cursor = "#6b8bb8",

  -- Selection
  selection_bg = "#e3ddd7",
  selection_fg = "#3e3933",

  -- Softer ANSI colors
  black = "#3e3933",
  red = "#c65f5f",
  green = "#80a665",
  yellow = "#d9a456",
  blue = "#6b8bb8",
  magenta = "#a06e93",
  cyan = "#4e999f",
  white = "#f4f0ed",

  -- Bright colors (slightly more vibrant but still soft)
  bright_black = "#7c7267",
  bright_red = "#d68787",
  bright_green = "#99b885",
  bright_yellow = "#e8b96e",
  bright_blue = "#88a4c7",
  bright_magenta = "#b885a8",
  bright_cyan = "#6ba8ad",
  bright_white = "#faf8f5",

  -- UI elements (warm tones)
  bg_dark = "#ebe6e1",
  bg_highlight = "#e3ddd7",
  comment = "#9c8d7f",
  line_nr = "#b3a89d",
  visual = "#ddd5cc",
  border = "#cfc5bb",
  orange = "#cc8a3c",
  rust = "#ce7c3a",
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

-- Syntax highlighting (inspired by Rust book syntax highlighting)
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

hi("PreProc", { fg = colors.rust })
hi("Include", { fg = colors.magenta })
hi("Define", { fg = colors.magenta })
hi("Macro", { fg = colors.rust })
hi("PreCondit", { fg = colors.rust })

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

-- Treesitter (colors inspired by Rust book)
hi("@variable", { fg = colors.fg })
hi("@variable.builtin", { fg = colors.rust })
hi("@variable.parameter", { fg = colors.fg })
hi("@variable.member", { fg = colors.fg })

hi("@constant", { fg = colors.orange })
hi("@constant.builtin", { fg = colors.orange })
hi("@constant.macro", { fg = colors.orange })

hi("@module", { fg = colors.fg })
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
hi("@function.macro", { fg = colors.rust })
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

hi("@property", { fg = colors.fg })
hi("@attribute", { fg = colors.rust })

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
hi("@markup.heading", { fg = colors.rust, style = "bold" })
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
hi("@lsp.type.macro", { fg = colors.rust })
hi("@lsp.type.method", { fg = colors.blue })
hi("@lsp.type.namespace", { fg = colors.yellow })
hi("@lsp.type.parameter", { fg = colors.fg })
hi("@lsp.type.property", { fg = colors.fg })
hi("@lsp.type.struct", { fg = colors.yellow })
hi("@lsp.type.type", { fg = colors.yellow })
hi("@lsp.type.typeParameter", { fg = colors.yellow })
hi("@lsp.type.variable", { fg = colors.fg })

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
