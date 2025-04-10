return {
  {
    'nyoom-engineering/oxocarbon.nvim',
    lazy = false,
    name = 'oxocarbon',
    priority = 2000,
    dependencies = { 'xiyaowong/transparent.nvim' },
  },
  {
    'xiyaowong/transparent.nvim',
    opts = {
      extra_groups = {
        'GitSignsAdd',
        'GitSignsChange',
        'GitSignsDelete',
        'WinSeparator',
      },
      exclude_groups = {
        'CursorLine',
      },
    },
  },
  { 'folke/tokyonight.nvim' },
  -- { 'rebelot/kanagawa.nvim' },
  -- 'navarasu/onedark.nvim',
  -- 'Shatur/neovim-ayu',
  -- 'ellisonleao/gruvbox.nvim',
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = {
      -- styles = {
      --   transparency = false,
      -- },
    },
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 2000,
    config = function()
      vim.cmd.colorscheme 'catppuccin'
      -- vim.cmd 'TransparentEnable'
    end,
  },
}
