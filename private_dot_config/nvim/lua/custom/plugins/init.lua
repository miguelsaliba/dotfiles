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
    "kawre/leetcode.nvim",
    cmd = "Leet",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
      "nvim-telescope/telescope.nvim",
      -- "ibhagwan/fzf-lua",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {},
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    cmd = { 'RenderMarkdown' },
    ft = "markdown",
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    opts = {},
  },

  { "nvzone/volt", lazy = true },

  {
    "nvzone/menu",
    lazy = true,
    keys = {
      {
        "<RightMouse>", function ()
          require('menu.utils').delete_old_menus()

          vim.cmd.exec '"normal! \\<RightMouse>"'

          -- clicked buf
          local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
          local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

          require("menu").open(options, { mouse = true })
        end
      },
    },
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
