_G.Util = require('util') -- Custom functions
_G.color = 'vague'
require('options')
require('mappings')
require('commands')

vim.lsp.enable({
  'gdscript',
  'gopls',
  'lua_ls',
  'clangd',
  'ts_ls',
  'vue_ls',
  'rust_analyzer',
})

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  spec = { import = 'plugins' },
  install = { colorscheme = { color } },
})

-- vim: ts=2 sts=2 sw=2 et
