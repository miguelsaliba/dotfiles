Util.later(function()
  vim.pack.add({
    'https://github.com/tpope/vim-fugitive',
  })

  vim.keymap.set('n', '<leader>gg', '<cmd>Git<cr>', { desc = 'Fugitive' })
  vim.keymap.set('n', '<leader>gs', '<cmd>Git status<cr>', { desc = 'git status' })
end)
