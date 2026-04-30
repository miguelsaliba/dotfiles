Util.now_if_args(function ()
  vim.pack.add({ 'https://github.com/folke/snacks.nvim' })

  require('snacks').setup({
    bigfile = { enabled = true },
    indent = { enabled = true },
  })
end)

Util.later(function()
  vim.keymap.set('n', '<c-/>', function() Snacks.terminal() end, { desc = 'Toggle terminal'})
  vim.keymap.set('n', '<c-_>', function() Snacks.terminal() end)
  vim.keymap.set('t', '<c-/>', '<cmd>close<cr>', { desc = 'Hide terminal'})
  vim.keymap.set('t', '<c-_>', '<cmd>close<cr>')
end)
