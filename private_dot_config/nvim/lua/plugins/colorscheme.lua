return {
  {
     "nyoom-engineering/oxocarbon.nvim",
     lazy = false,
     name = "oxocarbon",
     dependencies = { "xiyaowong/transparent.nvim" },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  {
    "vague2k/vague.nvim",
    priority = 1000,
    config = function ()
      vim.cmd.colorscheme("vague")
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
  },
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "xiyaowong/transparent.nvim",
    opts = {
      extra_groups = {
        "GitSignsAdd",
        "GitSignsChange",
        "GitSignsDelete",
        "WinSeparator",
        "SnacksPicker",
        "WhichKeyNormal",
        "WhichKeyBorder",
        "WhichKeyTitle",
      },
      exclude_groups = {
        "CursorLine",
      }
    },
  },
}
