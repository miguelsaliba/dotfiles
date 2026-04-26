Util.now_if_args(function ()
  vim.pack.add({ 'https://github.com/folke/snacks.nvim' })

  require('snacks').setup({
    bigfile = { enabled = true },
    indent = { enabled = true },
  })
end)

Util.later(function()
  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesActionRename',
    callback = function(event) Snacks.rename.on_rename_file(event.data.from, event.data.to) end,
  })

  vim.keymap.set('n', '<c-/>', function() Snacks.terminal() end, { desc = 'Toggle terminal'})
  vim.keymap.set('n', '<c-_>', function() Snacks.terminal() end)
  vim.keymap.set('t', '<c-/>', '<cmd>close<cr>', { desc = 'Hide terminal'})
  vim.keymap.set('t', '<c-_>', '<cmd>close<cr>')
end)
