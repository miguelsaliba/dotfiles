Util.later(function()
  vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    { src = 'https://github.com/olimorris/codecompanion.nvim', version = vim.version.range('^19.0.0') },
    { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('^1') },
  })

  local codecompanion = require('codecompanion')

  codecompanion.setup({
    interactions = {
      chat = {
        adapter = 'anthropic',
      },
      inline = { adapter = 'anthropic' },
      cmd = { adapter = 'anthropic' },
    },
  })

  vim.keymap.set({ 'n', 'v' }, '<leader>cc', codecompanion.toggle, { desc = 'CodeCompanion chat' })

  vim.cmd.cab('cc CodeCompanion')
end)
