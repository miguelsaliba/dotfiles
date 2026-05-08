Util.now_if_args(function()
  vim.pack.add({
    {
      src = 'https://github.com/obsidian-nvim/obsidian.nvim',
      version = vim.version.range('*'), -- use latest release, remove to use latest commit
    },
  })

  require('obsidian').setup({
    legacy_commands = false, -- this will be removed in 4.0.0
    workspaces = {
      {
        name = 'personal',
        path = '~/Documents/Obsidian',
      },
    },
    daily_notes = {
      folder = 'Daily Notes',
    },
    templates = { folder = 'templates' },
    note = { template = nil },
  })
end)
