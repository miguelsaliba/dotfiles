return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      default_file_explorer = false,
    },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  {
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    opts = {
      pair_cmap = false,
    },
  },
  {
    'otavioschwanck/arrow.nvim',
    opts = {
      show_icon = true,
      leader_key = '<leader>;',
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    enabled = false,
    cmd = { 'RenderMarkdown' },
    ft = 'markdown',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    opts = {},
  },
  {
    'stevearc/quicker.nvim',
    event = 'FileType qf',
    opts = {},
  },
}
