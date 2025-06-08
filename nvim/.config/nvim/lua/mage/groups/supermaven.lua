local M = {}

M.url = "https://github.com/supermaven-inc/supermaven-nvim"

---@type mage.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    SupermavenSuggestion = { fg = c.terminal_black },
  }
  return ret
end

return M
