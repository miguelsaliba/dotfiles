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
      chat = { adapter = 'claude_code' },
      inline = { adapter = 'claude_code' },
      cmd = { adapter = 'claude_code' },
    },
    adapters = {
      acp = {
        claude_code = function()
          return require('codecompanion.adapters').extend('claude_code', {
            env = { api_key = 'CLAUDE_CODE_OAUTH_TOKEN_NVIM' },
          })
        end,
      },
      http = {
        anthropic_api = function()
          return require('codecompanion.adapters').extend('anthropic', {
            env = { api_key = 'ANTHROPIC_API_KEY_NVIM' },
          })
        end,
      },
    },
  })

  vim.keymap.set({ 'n', 'v' }, '<leader>cc', codecompanion.toggle, { desc = 'CodeCompanion toggle' })
  vim.keymap.set({ 'n', 'v' }, '<leader>cn', codecompanion.chat, { desc = 'CodeCompanion chat' })

  vim.cmd.cab('cc CodeCompanion')
end)
