local M = {}

M.url = "https://github.com/akinsho/bufferline.nvim"

---@type mage.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    BufferLineIndicatorSelected = { fg = c.git.change },
  }
end

return M
