local M = {}

M.url = "https://github.com/echasnovski/mini.test"

---@type mage.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniTestEmphasis = { bold = true },
    MiniTestFail = { fg = c.red, bold = true },
    MiniTestPass = { fg = c.green, bold = true },
  }
end

return M
