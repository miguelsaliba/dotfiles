return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = true,
  keys = {
    {'<leader>gg', function() require('neogit').open() end, desc = 'Open Neogit', { silent = true, }},
    {'<leader>gs', function() require('neogit').open() end, desc = 'Open Neogit', { silent = true, }},
    {'<leader>gc', ":Neogit commit<CR>", desc = 'Neogit Commit', { silent = true,}},
    {'<leader>gl', vim.cmd.NeogitLogCurrent, desc = 'Neogit Log for current file', { silent = true,}},
  },
}
