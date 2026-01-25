local M = {}

M.palette = {
  dark2 = "#414453",
  dark1 = "#383a42",
  background = "#292a30",
  text = "#dfdfe0",
  accent1 = "#ff7ab2",   -- pink (keywords)
  accent2 = "#ffa14f",   -- orange (parameters, special)
  accent3 = "#ff8170",   -- coral (strings)
  accent4 = "#78c2b3",   -- teal (functions)
  accent5 = "#4eb0cc",   -- cyan (types)
  accent6 = "#b281eb",   -- purple (constants, numbers)
  dimmed1 = "#a0a1a7",
  dimmed2 = "#7f8c98",
  dimmed3 = "#6b7280",
  dimmed4 = "#4b5263",
  dimmed5 = "#414453",
  panel = "#2f3037",
  light = "#ffffff",
}

function M.setup()
  local p = M.palette

  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.background = "dark"
  vim.g.colors_name = "xcode-dark"

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
  hl("Search", { fg = p.background, bg = "#d9c97c" })
  hl("IncSearch", { fg = p.background, bg = p.accent2 })
  hl("CurSearch", { fg = p.background, bg = p.accent2 })
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
  hl("WarningMsg", { fg = p.accent2 })
  hl("ModeMsg", { fg = p.text, bold = true })
  hl("MoreMsg", { fg = p.accent4 })
  hl("Question", { fg = p.accent5 })

  -- Diff
  hl("DiffAdd", { bg = "#2d4a3e" })
  hl("DiffChange", { bg = "#3a3d4d" })
  hl("DiffDelete", { fg = p.accent3, bg = "#4a2d35" })
  hl("DiffText", { bg = "#3d4a5d" })

  -- Spelling
  hl("SpellBad", { undercurl = true, sp = p.accent3 })
  hl("SpellCap", { undercurl = true, sp = p.accent2 })
  hl("SpellLocal", { undercurl = true, sp = p.accent5 })
  hl("SpellRare", { undercurl = true, sp = p.accent6 })

  -- Diagnostics
  hl("DiagnosticError", { fg = p.accent3 })
  hl("DiagnosticWarn", { fg = p.accent2 })
  hl("DiagnosticInfo", { fg = p.accent5 })
  hl("DiagnosticHint", { fg = p.accent4 })
  hl("DiagnosticOk", { fg = p.accent4 })
  hl("DiagnosticUnderlineError", { undercurl = true, sp = p.accent3 })
  hl("DiagnosticUnderlineWarn", { undercurl = true, sp = p.accent2 })
  hl("DiagnosticUnderlineInfo", { undercurl = true, sp = p.accent5 })
  hl("DiagnosticUnderlineHint", { undercurl = true, sp = p.accent4 })
  hl("DiagnosticVirtualTextError", { fg = p.accent3, bg = "#4a2d35" })
  hl("DiagnosticVirtualTextWarn", { fg = p.accent2, bg = "#4a3d25" })
  hl("DiagnosticVirtualTextInfo", { fg = p.accent5, bg = "#254a4d" })
  hl("DiagnosticVirtualTextHint", { fg = p.accent4, bg = "#2d4a3e" })

  -- Syntax
  hl("Comment", { fg = p.dimmed2, italic = true })
  hl("Constant", { fg = p.accent6 })
  hl("String", { fg = p.accent3 })
  hl("Character", { fg = p.accent3 })
  hl("Number", { fg = p.accent6 })
  hl("Boolean", { fg = p.accent6 })
  hl("Float", { fg = p.accent6 })
  hl("Identifier", { fg = p.text })
  hl("Function", { fg = p.accent4 })
  hl("Statement", { fg = p.accent1 })
  hl("Conditional", { fg = p.accent1 })
  hl("Repeat", { fg = p.accent1 })
  hl("Label", { fg = p.accent1 })
  hl("Operator", { fg = p.accent1 })
  hl("Keyword", { fg = p.accent1 })
  hl("Exception", { fg = p.accent1 })
  hl("PreProc", { fg = p.accent1 })
  hl("Include", { fg = p.accent1 })
  hl("Define", { fg = p.accent1 })
  hl("Macro", { fg = p.accent1 })
  hl("PreCondit", { fg = p.accent1 })
  hl("Type", { fg = p.accent5 })
  hl("StorageClass", { fg = p.accent5 })
  hl("Structure", { fg = p.accent5 })
  hl("Typedef", { fg = p.accent5 })
  hl("Special", { fg = p.accent2 })
  hl("SpecialChar", { fg = p.accent2 })
  hl("Tag", { fg = p.accent1 })
  hl("Delimiter", { fg = p.text })
  hl("SpecialComment", { fg = p.dimmed2, italic = true })
  hl("Debug", { fg = p.accent2 })
  hl("Underlined", { underline = true })
  hl("Ignore", { fg = p.dimmed3 })
  hl("Error", { fg = p.accent3 })
  hl("Todo", { fg = p.accent2, bold = true })

  -- Treesitter
  hl("@variable", { fg = p.text })
  hl("@variable.builtin", { fg = p.accent2 })
  hl("@variable.parameter", { fg = p.accent2, italic = true })
  hl("@variable.member", { fg = p.text })
  hl("@constant", { fg = p.accent6 })
  hl("@constant.builtin", { fg = p.accent6 })
  hl("@constant.macro", { fg = p.accent6 })
  hl("@module", { fg = p.accent5 })
  hl("@label", { fg = p.accent1 })
  hl("@string", { fg = p.accent3 })
  hl("@string.escape", { fg = p.accent2 })
  hl("@string.regexp", { fg = p.accent2 })
  hl("@string.special", { fg = p.accent2 })
  hl("@character", { fg = p.accent3 })
  hl("@character.special", { fg = p.accent2 })
  hl("@boolean", { fg = p.accent6 })
  hl("@number", { fg = p.accent6 })
  hl("@number.float", { fg = p.accent6 })
  hl("@type", { fg = p.accent5 })
  hl("@type.builtin", { fg = p.accent5 })
  hl("@type.definition", { fg = p.accent5 })
  hl("@attribute", { fg = p.accent4 })
  hl("@property", { fg = p.text })
  hl("@function", { fg = p.accent4 })
  hl("@function.builtin", { fg = p.accent4 })
  hl("@function.macro", { fg = p.accent4 })
  hl("@function.method", { fg = p.accent4 })
  hl("@constructor", { fg = p.accent5 })
  hl("@operator", { fg = p.accent1 })
  hl("@keyword", { fg = p.accent1 })
  hl("@keyword.modifier", { fg = p.accent1 })
  hl("@keyword.type", { fg = p.accent5 })
  hl("@keyword.coroutine", { fg = p.accent1 })
  hl("@keyword.function", { fg = p.accent1 })
  hl("@keyword.operator", { fg = p.accent1 })
  hl("@keyword.import", { fg = p.accent1 })
  hl("@keyword.repeat", { fg = p.accent1 })
  hl("@keyword.return", { fg = p.accent1 })
  hl("@keyword.exception", { fg = p.accent1 })
  hl("@keyword.conditional", { fg = p.accent1 })
  hl("@punctuation.delimiter", { fg = p.dimmed1 })
  hl("@punctuation.bracket", { fg = p.dimmed1 })
  hl("@punctuation.special", { fg = p.accent1 })
  hl("@comment", { fg = p.dimmed2, italic = true })
  hl("@comment.todo", { fg = p.accent2, bold = true })
  hl("@comment.warning", { fg = p.accent2, bold = true })
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
  hl("@tag.delimiter", { fg = p.dimmed1 })

  -- LSP Semantic Tokens
  hl("@lsp.type.class", { fg = p.accent5 })
  hl("@lsp.type.decorator", { fg = p.accent4 })
  hl("@lsp.type.enum", { fg = p.accent5 })
  hl("@lsp.type.enumMember", { fg = p.accent6 })
  hl("@lsp.type.function", { fg = p.accent4 })
  hl("@lsp.type.interface", { fg = p.accent5 })
  hl("@lsp.type.macro", { fg = p.accent4 })
  hl("@lsp.type.method", { fg = p.accent4 })
  hl("@lsp.type.namespace", { fg = p.accent5 })
  hl("@lsp.type.parameter", { fg = p.accent2, italic = true })
  hl("@lsp.type.property", { fg = p.text })
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
  hl("MiniStatuslineModeCommand", { fg = p.background, bg = p.accent2, bold = true })

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
  hl("NotifyWARNBorder", { fg = p.accent2 })
  hl("NotifyWARNIcon", { fg = p.accent2 })
  hl("NotifyWARNTitle", { fg = p.accent2 })
  hl("NotifyINFOBorder", { fg = p.accent5 })
  hl("NotifyINFOIcon", { fg = p.accent5 })
  hl("NotifyINFOTitle", { fg = p.accent5 })

  -- Treesitter Context
  hl("TreesitterContext", { bg = p.dark1 })
  hl("TreesitterContextLineNumber", { fg = p.dimmed2, bg = p.dark1 })

  -- Matching parens
  hl("MatchParen", { fg = p.accent2, bold = true })

  -- Directory
  hl("Directory", { fg = p.accent5 })

  -- Title
  hl("Title", { fg = p.accent1, bold = true })

  -- Conceal
  hl("Conceal", { fg = p.dimmed3 })

  -- Terminal colors
  vim.g.terminal_color_0 = p.dark2
  vim.g.terminal_color_1 = p.accent3
  vim.g.terminal_color_2 = p.accent4
  vim.g.terminal_color_3 = "#d9c97c"
  vim.g.terminal_color_4 = p.accent5
  vim.g.terminal_color_5 = p.accent6
  vim.g.terminal_color_6 = p.accent5
  vim.g.terminal_color_7 = p.text
  vim.g.terminal_color_8 = p.dimmed2
  vim.g.terminal_color_9 = p.accent3
  vim.g.terminal_color_10 = "#acf2e4"
  vim.g.terminal_color_11 = p.accent2
  vim.g.terminal_color_12 = "#6bdfff"
  vim.g.terminal_color_13 = p.accent1
  vim.g.terminal_color_14 = "#dabaff"
  vim.g.terminal_color_15 = p.light
end

return M
