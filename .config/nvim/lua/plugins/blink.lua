return {
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
        },
      },
    },
  },
}
