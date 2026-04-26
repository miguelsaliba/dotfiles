Util.later(function()
  vim.pack.add({ 'https://github.com/OXY2DEV/markview.nvim' })

  local filetypes = require('markview.spec').default.preview.filetypes
  filetypes = vim.tbl_extend('force', filetypes, { 'codecompanion' })

  require('markview').setup({
    preview = {
      filetypes = filetypes,
      ignore_buftypes = {},
    },
  })
end)
