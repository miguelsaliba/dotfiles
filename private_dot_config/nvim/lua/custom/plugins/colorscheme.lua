return {
  {
    'nyoom-engineering/oxocarbon.nvim',
    lazy = false,
    name = 'oxocarbon',
    priority = 2000,
    config = function()
      vim.cmd.colorscheme 'oxocarbon'
      vim.cmd 'TransparentEnable'
    end,
    dependencies = { 'xiyaowong/transparent.nvim' },
  },
  {
    'xiyaowong/transparent.nvim',
    opts = {
      extra_groups = {
        'GitSignsAdd',
        'GitSignsChange',
        'GitSignsDelete',
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
}
