return {

  { 'nvim-telescope/telescope-symbols.nvim' },

  {
    'altermo/ultimate-autopair.nvim',
    event = {'InsertEnter','CmdlineEnter'},
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
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    opts = {
      messages = {
        view_search = false,
      }
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    cmd = { 'RenderMarkdown' },
    ft = "markdown",
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    opts = {},
  },
  {
    "f-person/auto-dark-mode.nvim",
    opts = {},
  },

  {
    "chrishrb/gx.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }, -- Required for Neovim < 0.10.0
    cmd = { "Browse" },
    init = function ()
      vim.g.netrw_nogx = 1 -- disable netrw gx
    end,
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    config = true, -- default settings
  }
}
