return {
  {
    'NMAC427/guess-indent.nvim',
    opts = {},
  },
  {
    'stevearc/oil.nvim',
    ---@type oil.setupOpts
    opts = {
      default_file_explorer = false,
    },
    keys = {
      {
        '<leader>o',
        function()
          require('oil').toggle_float()
        end,
        desc = 'Open parent directory',
      },
    },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
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
  {
    'Kohei-Wada/yadm-git.nvim',
    lazy = false,
    opts = {},
  },
}
