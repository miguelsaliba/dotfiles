---@type ChadrcConfig 
local M = {}
M.ui = {
  theme = 'everblush',
  transparency = true
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
M.blankline = { show_current_context_start = false }
return M
