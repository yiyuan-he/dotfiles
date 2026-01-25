local M = {}

M.palette = {
  -- UI colors
  dark2 = "#b4d8fd",       -- selection background (from palette 0)
  dark1 = "#e5e5e5",       -- cursor line, highlights
  background = "#ffffff",  -- main background
  text = "#262626",        -- foreground text
  -- Accent colors (based on xcode palette)
  accent1 = "#ad3da4",     -- magenta - keywords, statements (palette 5)
  accent2 = "#0f68a0",     -- blue - attributes, parameters (palette 4)
  accent3 = "#d12f1b",     -- red - strings (palette 1)
  accent4 = "#3e8087",     -- teal - functions (palette 2)
  accent5 = "#0f68a0",     -- blue - types (palette 4)
  accent6 = "#804fb8",     -- purple - constants, numbers (palette 6)
  -- Dimmed colors for comments and UI
  dimmed1 = "#5d6c79",
  dimmed2 = "#8a99a6",     -- comments (palette 8)
  dimmed3 = "#a0adb8",
  dimmed4 = "#c0c9d0",
  dimmed5 = "#d8dde2",
  -- Extra
  panel = "#f5f5f7",
  light = "#ffffff",
  -- Additional semantic colors
  brown = "#78492a",       -- palette 3
  darkTeal = "#23575c",    -- palette 10
  darkBlue = "#0b4f79",    -- palette 12
  darkPurple = "#4b21b0",  -- palette 14
}

function M.setup()
  local p = M.palette

  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.background = "light"
  vim.g.colors_name = "xcode-light"

  local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Editor
  hl("Normal", { fg = p.text, bg = p.background })
  hl("NormalFloat", { fg = p.text, bg = p.panel })
  hl("FloatBorder", { fg = p.dimmed3, bg = p.panel })
  hl("Cursor", { fg = p.background, bg = p.text })
  hl("CursorLine", { bg = p.dark1 })
  hl("CursorColumn", { bg = p.dark1 })
  hl("ColorColumn", { bg = p.dark1 })
  hl("LineNr", { fg = p.dimmed4 })
  hl("CursorLineNr", { fg = p.text, bold = true })
  hl("SignColumn", { fg = p.dimmed3, bg = p.background })
  hl("VertSplit", { fg = p.dark1 })
  hl("WinSeparator", { fg = p.dark1 })
  hl("Folded", { fg = p.dimmed2, bg = p.dark1 })
  hl("FoldColumn", { fg = p.dimmed3 })
  hl("NonText", { fg = p.dimmed4 })
  hl("SpecialKey", { fg = p.dimmed4 })
  hl("Whitespace", { fg = p.dimmed4 })
  hl("EndOfBuffer", { fg = p.dimmed4 })

  -- Search & Selection
  hl("Search", { fg = p.text, bg = "#f9e98e" })
  hl("IncSearch", { fg = p.background, bg = p.brown })
  hl("CurSearch", { fg = p.background, bg = p.brown })
  hl("Visual", { bg = p.dark2 })
  hl("VisualNOS", { bg = p.dark2 })

  -- Popup menu
  hl("Pmenu", { fg = p.text, bg = p.panel })
  hl("PmenuSel", { fg = p.text, bg = p.dark1 })
  hl("PmenuSbar", { bg = p.dark1 })
  hl("PmenuThumb", { bg = p.dimmed3 })

  -- Status & Tab lines
  hl("StatusLine", { fg = p.text, bg = p.dark1 })
  hl("StatusLineNC", { fg = p.dimmed2, bg = p.dark1 })
  hl("TabLine", { fg = p.dimmed2, bg = p.dark1 })
  hl("TabLineFill", { bg = p.dark1 })
  hl("TabLineSel", { fg = p.text, bg = p.background })
  hl("WinBar", { fg = p.text, bg = p.background, bold = true })
  hl("WinBarNC", { fg = p.dimmed2, bg = p.background })

  -- Messages
  hl("ErrorMsg", { fg = p.accent3 })
  hl("WarningMsg", { fg = p.brown })
  hl("ModeMsg", { fg = p.text, bold = true })
  hl("MoreMsg", { fg = p.accent4 })
  hl("Question", { fg = p.accent5 })

  -- Diff
  hl("DiffAdd", { bg = "#d4edda" })
  hl("DiffChange", { bg = "#e2e8f0" })
  hl("DiffDelete", { fg = p.accent3, bg = "#fce4e4" })
  hl("DiffText", { bg = "#c3dafe" })

  -- Spelling
  hl("SpellBad", { undercurl = true, sp = p.accent3 })
  hl("SpellCap", { undercurl = true, sp = p.brown })
  hl("SpellLocal", { undercurl = true, sp = p.accent5 })
  hl("SpellRare", { undercurl = true, sp = p.accent6 })

  -- Diagnostics
  hl("DiagnosticError", { fg = p.accent3 })
  hl("DiagnosticWarn", { fg = p.brown })
  hl("DiagnosticInfo", { fg = p.accent5 })
  hl("DiagnosticHint", { fg = p.accent4 })
  hl("DiagnosticOk", { fg = p.accent4 })
  hl("DiagnosticUnderlineError", { undercurl = true, sp = p.accent3 })
  hl("DiagnosticUnderlineWarn", { undercurl = true, sp = p.brown })
  hl("DiagnosticUnderlineInfo", { undercurl = true, sp = p.accent5 })
  hl("DiagnosticUnderlineHint", { undercurl = true, sp = p.accent4 })
  hl("DiagnosticVirtualTextError", { fg = p.accent3, bg = "#fce4e4" })
  hl("DiagnosticVirtualTextWarn", { fg = p.brown, bg = "#fef3cd" })
  hl("DiagnosticVirtualTextInfo", { fg = p.accent5, bg = "#d1ecf1" })
  hl("DiagnosticVirtualTextHint", { fg = p.accent4, bg = "#d4edda" })

  -- Syntax
  hl("Comment", { fg = p.dimmed2, italic = true })
  hl("Constant", { fg = p.accent6 })
  hl("String", { fg = p.accent3 })
  hl("Character", { fg = p.accent3 })
  hl("Number", { fg = p.accent6 })
  hl("Boolean", { fg = p.accent1 })
  hl("Float", { fg = p.accent6 })
  hl("Identifier", { fg = p.text })
  hl("Function", { fg = p.accent4 })
  hl("Statement", { fg = p.accent1 })
  hl("Conditional", { fg = p.accent1 })
  hl("Repeat", { fg = p.accent1 })
  hl("Label", { fg = p.accent1 })
  hl("Operator", { fg = p.text })
  hl("Keyword", { fg = p.accent1 })
  hl("Exception", { fg = p.accent1 })
  hl("PreProc", { fg = p.brown })
  hl("Include", { fg = p.brown })
  hl("Define", { fg = p.brown })
  hl("Macro", { fg = p.brown })
  hl("PreCondit", { fg = p.brown })
  hl("Type", { fg = p.accent5 })
  hl("StorageClass", { fg = p.accent1 })
  hl("Structure", { fg = p.accent5 })
  hl("Typedef", { fg = p.accent5 })
  hl("Special", { fg = p.accent6 })
  hl("SpecialChar", { fg = p.accent6 })
  hl("Tag", { fg = p.accent1 })
  hl("Delimiter", { fg = p.text })
  hl("SpecialComment", { fg = p.dimmed2, italic = true })
  hl("Debug", { fg = p.accent6 })
  hl("Underlined", { underline = true })
  hl("Ignore", { fg = p.dimmed3 })
  hl("Error", { fg = p.accent3 })
  hl("Todo", { fg = p.brown, bold = true })

  -- Treesitter
  hl("@variable", { fg = p.text })
  hl("@variable.builtin", { fg = p.accent1 })
  hl("@variable.parameter", { fg = p.text })
  hl("@variable.member", { fg = p.accent4 })
  hl("@constant", { fg = p.accent6 })
  hl("@constant.builtin", { fg = p.accent1 })
  hl("@constant.macro", { fg = p.brown })
  hl("@module", { fg = p.accent5 })
  hl("@label", { fg = p.accent1 })
  hl("@string", { fg = p.accent3 })
  hl("@string.escape", { fg = p.accent6 })
  hl("@string.regexp", { fg = p.accent6 })
  hl("@string.special", { fg = p.accent6 })
  hl("@character", { fg = p.accent3 })
  hl("@character.special", { fg = p.accent6 })
  hl("@boolean", { fg = p.accent1 })
  hl("@number", { fg = p.accent6 })
  hl("@number.float", { fg = p.accent6 })
  hl("@type", { fg = p.accent5 })
  hl("@type.builtin", { fg = p.accent5 })
  hl("@type.definition", { fg = p.accent5 })
  hl("@attribute", { fg = p.accent4 })
  hl("@property", { fg = p.accent4 })
  hl("@function", { fg = p.accent4 })
  hl("@function.builtin", { fg = p.accent4 })
  hl("@function.macro", { fg = p.brown })
  hl("@function.method", { fg = p.accent4 })
  hl("@constructor", { fg = p.accent5 })
  hl("@operator", { fg = p.text })
  hl("@keyword", { fg = p.accent1 })
  hl("@keyword.modifier", { fg = p.accent1 })
  hl("@keyword.type", { fg = p.accent1 })
  hl("@keyword.coroutine", { fg = p.accent1 })
  hl("@keyword.function", { fg = p.accent1 })
  hl("@keyword.operator", { fg = p.accent1 })
  hl("@keyword.import", { fg = p.brown })
  hl("@keyword.repeat", { fg = p.accent1 })
  hl("@keyword.return", { fg = p.accent1 })
  hl("@keyword.exception", { fg = p.accent1 })
  hl("@keyword.conditional", { fg = p.accent1 })
  hl("@punctuation.delimiter", { fg = p.text })
  hl("@punctuation.bracket", { fg = p.text })
  hl("@punctuation.special", { fg = p.accent1 })
  hl("@comment", { fg = p.dimmed2, italic = true })
  hl("@comment.todo", { fg = p.brown, bold = true })
  hl("@comment.warning", { fg = p.brown, bold = true })
  hl("@comment.error", { fg = p.accent3, bold = true })
  hl("@comment.note", { fg = p.accent5, bold = true })
  hl("@markup.heading", { fg = p.accent1, bold = true })
  hl("@markup.italic", { italic = true })
  hl("@markup.strong", { bold = true })
  hl("@markup.strikethrough", { strikethrough = true })
  hl("@markup.underline", { underline = true })
  hl("@markup.quote", { fg = p.dimmed1, italic = true })
  hl("@markup.math", { fg = p.accent5 })
  hl("@markup.link", { fg = p.accent5, underline = true })
  hl("@markup.link.url", { fg = p.accent5, underline = true })
  hl("@markup.raw", { fg = p.accent4 })
  hl("@markup.list", { fg = p.accent1 })
  hl("@tag", { fg = p.accent1 })
  hl("@tag.attribute", { fg = p.accent4 })
  hl("@tag.delimiter", { fg = p.text })

  -- LSP Semantic Tokens
  hl("@lsp.type.class", { fg = p.accent5 })
  hl("@lsp.type.decorator", { fg = p.accent4 })
  hl("@lsp.type.enum", { fg = p.accent5 })
  hl("@lsp.type.enumMember", { fg = p.accent6 })
  hl("@lsp.type.function", { fg = p.accent4 })
  hl("@lsp.type.interface", { fg = p.accent5 })
  hl("@lsp.type.macro", { fg = p.brown })
  hl("@lsp.type.method", { fg = p.accent4 })
  hl("@lsp.type.namespace", { fg = p.accent5 })
  hl("@lsp.type.parameter", { fg = p.text })
  hl("@lsp.type.property", { fg = p.accent4 })
  hl("@lsp.type.struct", { fg = p.accent5 })
  hl("@lsp.type.type", { fg = p.accent5 })
  hl("@lsp.type.typeParameter", { fg = p.accent5 })
  hl("@lsp.type.variable", { fg = p.text })

  -- Git signs
  hl("GitSignsAdd", { fg = p.accent4 })
  hl("GitSignsChange", { fg = p.accent5 })
  hl("GitSignsDelete", { fg = p.accent3 })

  -- Telescope
  hl("TelescopeBorder", { fg = p.dimmed3, bg = p.background })
  hl("TelescopeNormal", { fg = p.text, bg = p.background })
  hl("TelescopePromptBorder", { fg = p.dimmed3, bg = p.background })
  hl("TelescopePromptNormal", { fg = p.text, bg = p.background })
  hl("TelescopePromptPrefix", { fg = p.accent1 })
  hl("TelescopeSelection", { bg = p.dark1 })
  hl("TelescopeSelectionCaret", { fg = p.accent1, bg = p.dark1 })
  hl("TelescopeMatching", { fg = p.accent1, bold = true })

  -- NeoTree
  hl("NeoTreeNormal", { fg = p.text, bg = p.panel })
  hl("NeoTreeNormalNC", { fg = p.text, bg = p.panel })
  hl("NeoTreeDirectoryIcon", { fg = p.accent5 })
  hl("NeoTreeDirectoryName", { fg = p.accent5 })
  hl("NeoTreeRootName", { fg = p.accent1, bold = true })
  hl("NeoTreeFileName", { fg = p.text })
  hl("NeoTreeGitAdded", { fg = p.accent4 })
  hl("NeoTreeGitModified", { fg = p.accent5 })
  hl("NeoTreeGitDeleted", { fg = p.accent3 })
  hl("NeoTreeIndentMarker", { fg = p.dimmed4 })

  -- Cmp
  hl("CmpItemAbbr", { fg = p.text })
  hl("CmpItemAbbrDeprecated", { fg = p.dimmed3, strikethrough = true })
  hl("CmpItemAbbrMatch", { fg = p.accent1, bold = true })
  hl("CmpItemAbbrMatchFuzzy", { fg = p.accent1, bold = true })
  hl("CmpItemKind", { fg = p.accent5 })
  hl("CmpItemMenu", { fg = p.dimmed2 })

  -- Which-key
  hl("WhichKey", { fg = p.accent1 })
  hl("WhichKeyGroup", { fg = p.accent5 })
  hl("WhichKeyDesc", { fg = p.text })
  hl("WhichKeySeperator", { fg = p.dimmed3 })

  -- Indent guides
  hl("IndentBlanklineChar", { fg = p.dimmed5 })
  hl("IblIndent", { fg = p.dimmed5 })
  hl("IblScope", { fg = p.dimmed3 })

  -- Mini
  hl("MiniStatuslineModeNormal", { fg = p.background, bg = p.accent5, bold = true })
  hl("MiniStatuslineModeInsert", { fg = p.background, bg = p.accent4, bold = true })
  hl("MiniStatuslineModeVisual", { fg = p.background, bg = p.accent6, bold = true })
  hl("MiniStatuslineModeReplace", { fg = p.background, bg = p.accent3, bold = true })
  hl("MiniStatuslineModeCommand", { fg = p.background, bg = p.brown, bold = true })

  -- Lazy
  hl("LazyButton", { fg = p.text, bg = p.dark1 })
  hl("LazyButtonActive", { fg = p.background, bg = p.accent5 })
  hl("LazyH1", { fg = p.background, bg = p.accent1, bold = true })

  -- Mason
  hl("MasonHeader", { fg = p.background, bg = p.accent1, bold = true })
  hl("MasonHighlight", { fg = p.accent5 })
  hl("MasonHighlightBlockBold", { fg = p.background, bg = p.accent4, bold = true })

  -- Notify
  hl("NotifyERRORBorder", { fg = p.accent3 })
  hl("NotifyERRORIcon", { fg = p.accent3 })
  hl("NotifyERRORTitle", { fg = p.accent3 })
  hl("NotifyWARNBorder", { fg = p.brown })
  hl("NotifyWARNIcon", { fg = p.brown })
  hl("NotifyWARNTitle", { fg = p.brown })
  hl("NotifyINFOBorder", { fg = p.accent5 })
  hl("NotifyINFOIcon", { fg = p.accent5 })
  hl("NotifyINFOTitle", { fg = p.accent5 })

  -- Treesitter Context
  hl("TreesitterContext", { bg = p.dark1 })
  hl("TreesitterContextLineNumber", { fg = p.dimmed2, bg = p.dark1 })

  -- Matching parens
  hl("MatchParen", { fg = p.brown, bold = true })

  -- Directory
  hl("Directory", { fg = p.accent5 })

  -- Title
  hl("Title", { fg = p.accent1, bold = true })

  -- Conceal
  hl("Conceal", { fg = p.dimmed3 })

  -- Terminal colors (from the provided palette)
  vim.g.terminal_color_0 = "#b4d8fd"  -- palette 0
  vim.g.terminal_color_1 = "#d12f1b"  -- palette 1
  vim.g.terminal_color_2 = "#3e8087"  -- palette 2
  vim.g.terminal_color_3 = "#78492a"  -- palette 3
  vim.g.terminal_color_4 = "#0f68a0"  -- palette 4
  vim.g.terminal_color_5 = "#ad3da4"  -- palette 5
  vim.g.terminal_color_6 = "#804fb8"  -- palette 6
  vim.g.terminal_color_7 = "#262626"  -- palette 7
  vim.g.terminal_color_8 = "#8a99a6"  -- palette 8
  vim.g.terminal_color_9 = "#d12f1b"  -- palette 9
  vim.g.terminal_color_10 = "#23575c" -- palette 10
  vim.g.terminal_color_11 = "#78492a" -- palette 11
  vim.g.terminal_color_12 = "#0b4f79" -- palette 12
  vim.g.terminal_color_13 = "#ad3da4" -- palette 13
  vim.g.terminal_color_14 = "#4b21b0" -- palette 14
  vim.g.terminal_color_15 = "#262626" -- palette 15
end

return M
