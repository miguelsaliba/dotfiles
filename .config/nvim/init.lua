_G.Util = require("util") -- Custom functions
_G.color = "vague"
require "options"
require "mappings"
require "commands"

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)


vim.lsp.enable({'gdscript', 'gopls', 'lua_ls'})

require('lazy').setup({
  {
    'NMAC427/guess-indent.nvim',
    opts = {},
  },

  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'williamboman/mason.nvim', opts = {} },
  {'neovim/nvim-lspconfig'},

  {
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'folke/lazydev.nvim',
      'fang2hou/blink-copilot',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      -- Please read `:help ins-completion`, it is really good!
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        list = { selection = { auto_insert = false } },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev', 'buffer', 'omni', 'copilot' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
          copilot = {
            name = 'copilot',
            module = 'blink-copilot',
            score_offset = 100,
            async = true,
          }
        },
      },
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
  },

  { import = 'plugins' },
}, {
  install = { colorscheme = { color } },
})

-- vim: ts=2 sts=2 sw=2 et
