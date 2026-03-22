return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    lazy = true, -- will be loading it using snacks.nvim
    build = ':Copilot auth',
    opts = {
      panel = { enabled = false },
      suggestion = {
        enabled = false,
        auto_trigger = false,
      },
      server = {
        type = 'binary',
      },
    },
  },
  {
    'olimorris/codecompanion.nvim',
    version = '^19.0.0',
    opts = {
      interactions = {
        chat = {
          adapter = 'anthropic',
        },
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    keys = {
      {
        '<leader>cc',
        function()
          require('codecompanion').toggle()
        end,
        desc = 'Code Companion Chat',
      },
    },
  },
}
