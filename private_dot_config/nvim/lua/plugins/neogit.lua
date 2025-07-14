return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'folke/snacks.nvim',
  },
  config = true,
  keys = {
    {'<leader>gg', function() require('neogit').open() end, desc = 'Open Neogit', { silent = true, }},
    {'<leader>gs', function() require('neogit').open({ cwd = vim.fn.expand('%:p:h') }) end, desc = 'Open Neogit', { silent = true, }},
    {'<leader>gc', function() require('neogit').open({ 'commit' }) end, desc = 'Neogit Commit', { silent = true,}},
    {'<leader>gl', vim.cmd.NeogitLogCurrent, desc = 'Neogit Log for current file', { silent = true,}},
  },
}
