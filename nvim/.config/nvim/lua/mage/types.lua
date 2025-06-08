---@class mage.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias mage.Highlights table<string,mage.Highlight|string>

---@alias mage.HighlightsFn fun(colors: ColorScheme, opts:mage.Config):mage.Highlights

---@class mage.Cache
---@field groups mage.Highlights
---@field inputs table
