Util.on_event({ 'InsertEnter', 'CmdlineEnter' }, function()
  vim.pack.add({
    { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('^1') },
    'https://github.com/fang2hou/blink-copilot',
  })

  require('blink.cmp').setup({
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      list = { selection = { auto_insert = false } },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
      providers = {
        copilot = {
          name = 'copilot',
          module = 'blink-copilot',
          async = true,
        },
      },
    },
  })

  vim.keymap.set('n', '<leader>co', function() vim.lsp.enable('copilot', not vim.lsp.is_enabled('copilot')) end, { desc = 'Toggle copilot' })
end)
