Util.now_if_args(function()
  local obsidian_dir = '~/Documents/Obsidian'
  -- Don't need obsidian.lua if we don't have the directory
  -- I could make this more complicated but I only have one dir for now.
  if not vim.uv.fs_stat(vim.fn.expand(obsidian_dir)) then return end

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
        path = obsidian_dir,
      },
    },
    daily_notes = {
      folder = 'Daily Notes',
    },
    templates = { folder = 'templates' },
    note_id_func = function(title)
      return title
    end,
    note = { template = nil },
  })
end)
