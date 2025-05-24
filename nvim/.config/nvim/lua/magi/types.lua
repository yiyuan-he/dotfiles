---@class magi.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias magi.Highlights table<string,magi.Highlight|string>

---@alias magi.HighlightsFn fun(colors: ColorScheme, opts:magi.Config):magi.Highlights

---@class magi.Cache
---@field groups magi.Highlights
---@field inputs table
