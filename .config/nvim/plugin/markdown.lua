Util.now_if_args(function()
  vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
  })

  require('render-markdown').setup({
    file_types = { 'markdown', 'codecompanion' },
  })
end)
