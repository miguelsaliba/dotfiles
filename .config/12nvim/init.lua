vim.loader.enable()
_G.Util = require('util') -- Custom functions
require('options')
require('autocmds')
require('keymaps')

vim.lsp.enable({
  'gdscript',
  'gopls',
  'lua_ls',
  'clangd',
  'ts_ls',
  'vue_ls',
  'tailwindcss',
  'rust_analyzer',
})


vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

local misc = require('mini.misc')
Util.now = function(f) misc.safely('now', f) end
Util.later = function(f) misc.safely('later', f) end
Util.now_if_args = vim.fn.argc(-1) > 0 and Util.now or Util.later
Util.on_ft = function(ft, f) misc.safely('filetype:' .. ft, f) end
--- @param ev vim.api.keyset.events|vim.api.keyset.events[]
Util.on_event = function(ev, f)
  if type(ev) == 'table' then ev = table.concat(ev, ',') end
  misc.safely('event:' .. ev, f)
end

Util.later(function() vim.cmd.packadd('nvim.undotree') end)
