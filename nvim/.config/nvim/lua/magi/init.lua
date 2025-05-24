local config = require("magi.config")

local M = {}
---@type {light?: string, dark?: string}
M.styles = {}

---@param opts? magi.Config
function M.load(opts)
  opts = require("magi.config").extend(opts)
  local bg = vim.o.background
  local style_bg = opts.style == "scroll" and "light" or "dark"

  if bg ~= style_bg then
    if vim.g.colors_name == "magi-" .. opts.style then
      opts.style = bg == "light" and (M.styles.light or "scroll") or (M.styles.dark or "tome")
    else
      vim.o.background = style_bg
    end
  end
  M.styles[vim.o.background] = opts.style
  return require("magi.theme").setup(opts)
end

M.setup = config.setup

return M
