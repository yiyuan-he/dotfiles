local M = {}

M.url = "https://github.com/nvimdev/indentmini.nvim"

---@type mage.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    IndentLine                 = { fg = c.fg_gutter, nocombine = true },
    IndentLineCurrent          = { fg = c.blue1, nocombine = true },
  }
end

return M
